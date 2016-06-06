package com.nadu.rms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;


import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.ReviewsDao;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Review;

public class EventDetailService {

	EventsDao eventsDAO;
	ReviewsDao reviewsDAO;
	
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}
	@Autowired
	public void setReviewsDAO(ReviewsDao reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	
	public void eventDetailLoad(String esidx, Model model){
		
		List<Event_Eventlist> detail = eventsDAO.selectEventsDetailByESIDX(esidx);
		model.addAttribute("detail",detail);	// detail로 뷰에 넘김
		/* 디테일에 해당하는 리뷰 가져오기.*/
		List<Review> reviews = reviewsDAO.selectReviewsByEsidx(esidx);
		model.addAttribute("reviews", reviews);
		
	}
}
