package com.nadu.rms.controller;

import java.util.List;
import java.util.Map;

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

import com.google.gson.Gson;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.ReviewsDao;
import com.nadu.rms.service.EventRegService;
import com.nadu.rms.service.EventsService;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;
import com.nadu.rms.vo.Eventlist;
import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.Review;

@Controller
@RequestMapping("event/*")
public class EventController {

	EventsDao eventsDAO;
	ReviewsDao reviewsDAO;
	EventsService eventsService;
	EventRegService eventRegService;
	
	static final Logger log = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}
	@Autowired
	public void setReviewsDAO(ReviewsDao reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	@Autowired
	public void setEventsService(EventsService eventsService) {
		this.eventsService = eventsService;
	}
	@Autowired
	public void setEventRegService(EventRegService eventRegService) {
		this.eventRegService = eventRegService;
	}
	
	// 모든 이벤트 보기
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String eventListViewLoad(HttpServletRequest req, Model model) {

		
		return "event/eventlist";
	}

	@RequestMapping(value = "list/dataload", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventListDataLoad(HttpServletRequest req, HttpServletResponse res, Model model){
		
		
		String returnValue = eventsService.listLoad(req, eventsDAO);
		// 얻은 값 반환.
		 
		log.info("gson : " + returnValue);
		return returnValue;
	}
	
	// 특정 이벤트 뷰 상세 보기
	@RequestMapping(value = "{esidx}", method = RequestMethod.GET)
	public String eventDetailViewLoad(@PathVariable String esidx, Model model) {
		
		/* 해당 인덱스 번호  디테일 가져옴. */
		Map<String,String> detail = eventsDAO.selectEventsDetailByESIDX(esidx);
		model.addAttribute("detail",detail);	// detail로 뷰에 넘김
		
		/* 디테일에 해당하는 리뷰 가져오기.*/
		List<Review> reviews = reviewsDAO.selectReviewsByEsidx(esidx);
		model.addAttribute("reviews", reviews);
		
		//뷰 리턴(detail)
		return "event/eventdetail";
	}

	// 이벤트 등록
	@RequestMapping(value = "reg", method = RequestMethod.GET)
	public String eventReg(Model model) {
		List<String> categories = eventsDAO.getCategories();
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
