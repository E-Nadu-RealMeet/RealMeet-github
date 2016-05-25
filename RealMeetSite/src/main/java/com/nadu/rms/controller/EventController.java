package com.nadu.rms.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.ReviewsDao;
import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.Review;

@Controller
@RequestMapping("event/*")
public class EventController {

	EventsDao eventsDAO;
	ReviewsDao reviewsDAO;

	static final Logger log = LoggerFactory.getLogger(EventController.class);
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}
	@Autowired
	public void setReviewsDAO(ReviewsDao reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}


	// 모든 이벤트 보기
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String eventListViewLoad(HttpServletRequest req, Model model) {

		// 이벤트 정보 리스트  (select * from events)
		/*
		List<Events> list = eventsDAO.selectEvents();
		model.addAttribute("list", list);*/
		
		// 이벤트 정보 및 홀더 정보 획득.
		List<Map<Object,Object>> list = eventsDAO.selectEventsNUser();
		model.addAttribute("list",list);
		// 필터 체크.
		// 뷰 리턴
		return "event/eventlist";
	}

	@RequestMapping(value = "list/dataload", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String eventListDataLoad(HttpServletRequest req, HttpServletResponse res, Model model){
		
		List<Map<Object, Object>> datas = eventsDAO.selectEventsNUser();
		
		
		Gson gson = new Gson();
		
		log.info("접속 ㅇㅇ");
		
		class DataSet{
			int variable;

			public int getVariable() {
				return variable;
			}

			public void setVariable(int variable) {
				this.variable = variable;
			}
			
			
		}
		
		DataSet s = new DataSet();
		s.setVariable(1324);
		log.info("sV : "+s.getVariable());
		log.info("gson.toJson(s) :"+gson.toJson(s));
		log.info("gson : " + gson.toJson(datas));
		return gson.toJson(datas);
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
	public String eventReg() {
		return "event/eventReg";
	}

	// 이벤트 등록 proc
	@RequestMapping(value = "reg", method = RequestMethod.POST)
	public String eventReg(Model model, Events e) {

		//현재 로그인 기능이 없기 때문에 holder는 won으로 통일하겠습니다.
		e.setHolder("won");
		//로그인 기능 완료 후 삭제 요망 부분
		int iv = eventsDAO.insertEvents(e);
		if(iv>0){
			return "redirect:../event/"+e.getEsidx();
		}else{
			return "redirect:reg";
		}
	}
}
