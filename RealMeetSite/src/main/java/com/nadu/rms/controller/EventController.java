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

import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.service.EventApplyService;
import com.nadu.rms.service.EventDataService;
import com.nadu.rms.service.EventDetailService;
import com.nadu.rms.service.EventEditService;
import com.nadu.rms.service.EventRegService;
import com.nadu.rms.vo.Event_Eventlist;


@Controller
@RequestMapping("event/*")
public class EventController {
	
	EventDataService eventDataService;
	EventRegService eventRegService;
	EventDetailService eventDetailService;
	EventApplyService eventApplyService;
	EventEditService eventEditService;
	static final Logger log = LoggerFactory.getLogger(EventController.class);
	
	
	@Autowired
	public void setEventEditService(EventEditService eventEditService) {
		this.eventEditService = eventEditService;
	}

	

	
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
		String introValue = "모임 목록입니다.";
        model.addAttribute("introValue", introValue );
		model.addAttribute("page","event/eventList");
		return "event/eventList";
	}


	// 이벤트 참여하기
	@RequestMapping(value = "apply/{elidx}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventApply(@PathVariable String elidx, HttpServletRequest req ,Model model) {

		String returnString = "";

		String ret = eventApplyService.applyEvent(req.getSession().getAttribute("mid").toString(), elidx);
		if(ret.equals("0")){
			/* 성공 */
			returnString = "Success";
		}
		else if(ret.equals("1")){
			/* 자리가 없음 */
			returnString = "No empty seats";
		}
		else if(ret.equals("2")){
			/* 이미 참여한 경우*/
			returnString = "Already applied for this event";
		}

		return returnString;
	}
	
	// 이벤트 취소하기
	@RequestMapping(value = "cancle/{elidx}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventCancleProc(@PathVariable String elidx, HttpServletRequest req,Model model) {

		//취소 작업
		String mid = (String)req.getSession().getAttribute("mid");
		String returnValue = eventApplyService.cancleEvent(mid, elidx);
		//뷰 리턴(detail)
		return returnValue;
	}
	// list 페이지 ajax 대응
	@RequestMapping(value = "list/dataload", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventListDataLoad(HttpServletRequest req, HttpServletResponse res, Model model){
		
		String returnValue = eventDataService.listLoad(req);
		// 얻은 값 반환.

		log.info("gson : " + returnValue);
		return returnValue;
	}
	// detail 페이지  ajax 대응
	@RequestMapping(value = "detail/dataload", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventDetailDataLoad(HttpServletRequest req, HttpServletResponse res, Model model){

		String esidx = req.getParameter("esidx");
		
		String returnValue = eventDetailService.dataLoad(req, model);
		// 얻은 값 반환.

		log.info("DATAgson : " + returnValue);
		return returnValue;
	}

	// 특정 이벤트 뷰 상세 보기
	@RequestMapping(value = "{esidx}", method = RequestMethod.GET)
	public String eventDetailViewLoad(@PathVariable String esidx,HttpServletRequest req, Model model) {
		String introValue = "모임의 자세한 정보입니다.";
        model.addAttribute("introValue", introValue );
		/* eventDetailService로 필요한 데이터 가져옴 */
		//req.getSession().setAttribute("mid", "gyu");
		eventDetailService.detailLoad(req, esidx, model);
		model.addAttribute("page","event/eventDetail");
		
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
        model.addAttribute("introValue", introValue);
		model.addAttribute("categories", categories);
		model.addAttribute("page","event/eventReg");
		return "event/eventReg";
	}

	// 이벤트 등록 proc
	@RequestMapping(value = "reg", method = RequestMethod.POST)
	public String eventReg(Event_Eventlist e, HttpServletRequest request) {

		int iv = eventRegService.eventReg(e, request);
		log.info("eventReg 실행 결과 : "+iv);
		if(iv>1){
			return "redirect:../event/"+e.getEsidx();
		}else{
			return "redirect:reg";
		}
	}
	
	//모든 이벤트 목록 조회 (ajax)
	@RequestMapping(value="dataloadformap", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventListDataloadForMap(){
		String datas = eventDataService.DataloadForMap();
		log.info(datas);
		
		return datas;
	}
	
	@RequestMapping(value = "editName", method = RequestMethod.POST)
	public String eventNameEdit(Event_Eventlist e, HttpServletRequest req, String esidx, Model model, String eventName) {
		esidx = e.getEsidx();
		e.setEventname(e.getEventname());
		int up = eventEditService.eventNameEdit(req,esidx, eventName);
		if (up>0) {
			
		return "redirect:../event/"+esidx;
		}else{
		return "redirect:../event/"+esidx;
		}
	}
	
	@RequestMapping(value = "editDate", method = RequestMethod.POST)
	public String eventDateEdit(Event_Eventlist e, HttpServletRequest req, String esidx, Model model, String elDate) {
		esidx = e.getEsidx();
		e.setEldate(e.getEldate());
		int up = eventEditService.eventDateEdit(req,esidx, elDate);
		if (up>0) {
			
		return "redirect:../event/"+esidx;
		}else{
		return "redirect:../event/"+esidx;
		}
	}
	
	@RequestMapping(value = "editDesc", method = RequestMethod.POST)
	public String eventDescEdit(Event_Eventlist e, HttpServletRequest req, String esidx, Model model, String description) {
		esidx = e.getEsidx();
		e.setDescription(e.getDescription());
		int up = eventEditService.eventDescEdit(req,esidx, description);
		if (up>0) {
			
		return "redirect:../event/"+esidx;
		}else{
		return "redirect:../event/"+esidx;
		}
	}

	@RequestMapping(value = "editCategory", method = RequestMethod.POST)
	public String eventCategoryEdit(Event_Eventlist e, HttpServletRequest req, String esidx, Model model, String category) {
		esidx = e.getEsidx();
		e.setCategory(e.getCategory());
		int up = eventEditService.eventCategoryEdit(req,esidx, category);
		if (up>0) {
			
		return "redirect:../event/"+esidx;
		}else{
		return "redirect:../event/"+esidx;
		}
	}
	
//	@RequestMapping(value="/gmap", method = RequestMethod.GET)
//	public String gmap(){
//		return "customer/gmap";
//	}
}
