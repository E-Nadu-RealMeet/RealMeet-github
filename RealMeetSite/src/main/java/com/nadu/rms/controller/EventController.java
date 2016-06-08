package com.nadu.rms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadu.rms.service.EventApplyService;
import com.nadu.rms.service.EventDataService;
import com.nadu.rms.service.EventDetailService;
import com.nadu.rms.service.EventRegService;
import com.nadu.rms.vo.Event_Eventlist;


@Controller
@RequestMapping("event/*")
public class EventController {


	EventDataService eventDataService;
	EventRegService eventRegService;
	EventDetailService eventDetailService;
	EventApplyService eventApplyService;
	
	static final Logger log = LoggerFactory.getLogger(EventController.class);

	
	@Autowired
	public void setEventApplyService(EventApplyService eventApplyService) {
		this.eventApplyService = eventApplyService;
	}
	@Autowired
	public void setEventsService(EventDataService eventDataService) {
		this.eventDataService = eventDataService;
	}
	@Autowired
	public void setEventRegService(EventRegService eventRegService) {
		this.eventRegService = eventRegService;
	}
	@Autowired
	public void setEventDetailService(EventDetailService eventDetailService) {
		this.eventDetailService = eventDetailService;
	}

	// 모든 이벤트 보기
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String eventListViewLoad(HttpServletRequest req, Model model) {
		return "event/eventList";
	}


	// 이벤트 참여하기
	@RequestMapping(value = "apply/{elidx}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventApply(@PathVariable String elidx, HttpServletRequest req ,Model model) {

		String returnString = "";
		int ret = eventApplyService.applyEvent((String)req.getSession().getAttribute("mid"), elidx);
		if(ret == 0){
			/* 성공 */
			returnString = "Success";
		}
		else if(ret == 1){
			/* 자리가 없음 */
			returnString = "No empty seats";
		}
		else if(ret == 2){
			/* 이미 참여한 경우*/
			returnString = "Already applied for this event";
		}

		return returnString;
	}
	
	// 이벤트 취소하기
	@RequestMapping(value = "cancle/{elidx}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventCancleProc(@PathVariable String esidx, Model model) {

		String returnValue = "";
		//뷰 리턴(detail)
		return returnValue;
	}

	@RequestMapping(value = "list/dataload", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventListDataLoad(HttpServletRequest req, HttpServletResponse res, Model model){


		String returnValue = eventDataService.listLoad(req);
		// 얻은 값 반환.

		log.info("gson : " + returnValue);
		return returnValue;
	}

	// 특정 이벤트 뷰 상세 보기
	@RequestMapping(value = "{esidx}", method = RequestMethod.GET)
	public String eventDetailViewLoad(@PathVariable String esidx,HttpServletRequest req, Model model) {

		/* eventDetailService로 필요한 데이터 가져옴 */
		//req.getSession().setAttribute("mid", "gyu");
		eventDetailService.eventDetailLoad(req, esidx, model);

		//뷰 리턴(detail)
		return "event/eventDetail";
	}

	// 이벤트 등록
	@RequestMapping(value = "reg", method = RequestMethod.GET)
	public String eventReg(Model model, HttpServletRequest request) {
		String mid = (String)request.getSession().getAttribute("mid");
		if(mid == null || mid == ""){
			model.addAttribute("error","notLoginError");
			log.info("contextPath"+request.getContextPath()+"+"+request.getContextPath().length());
			String savePage = request.getRequestURI().substring(request.getContextPath().length()+1);
			log.info("현재 페이지"+savePage);
			request.getSession().setAttribute("savePage", savePage);
			return "redirect:../login";
		}
		
		List<String> categories = eventRegService.getCategories();
		String introValue = "모임을 만들어봐요.";
        model.addAttribute("introValue", introValue );
		model.addAttribute("categories", categories);
		return "event/eventReg";
	}

	// 이벤트 등록 proc
	@RequestMapping(value = "reg", method = RequestMethod.POST)
	public String eventReg(Event_Eventlist e) {

		int iv = eventRegService.eventReg(e);
		
		if(iv>0){
			return "redirect:../event/"+e.getEsidx();
		}else{
			return "redirect:reg";
		}
	}
}
