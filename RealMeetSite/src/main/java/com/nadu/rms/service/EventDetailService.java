package com.nadu.rms.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;


import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.GuestlistDao;
import com.nadu.rms.dao.ReviewsDao;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;
import com.nadu.rms.vo.Guestlist;
import com.nadu.rms.vo.Review;

public class EventDetailService {

	EventsDao eventsDAO;
	ReviewsDao reviewsDAO;
	GuestlistDao geustlistDAO;
	
	
	
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}
	@Autowired
	public void setGeustlistDAO(GuestlistDao geustlistDAO) {
		this.geustlistDAO = geustlistDAO;
	}
	@Autowired
	public void setReviewsDAO(ReviewsDao reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	
	public void detailLoad(HttpServletRequest req,String esidx, Model model){
		
		List<Event_Eventlist> detail = eventsDAO.selectEventsDetailByESIDX(esidx);
		
		String mid = (String) req.getSession().getAttribute("mid");
		//세션 아이디에 따른 glist 호출.
		if(mid != null || mid != ""){
			List<Guestlist> glist = geustlistDAO.searchGuestlistById(mid);
			model.addAttribute("glist",glist);
		}
		
		
		model.addAttribute("detail",detail);	// detail로 뷰에 넘김
		/* 디테일에 해당하는 리뷰 가져오기.*/
		List<Review> reviews = reviewsDAO.selectReviewsByEsidx(esidx);
		model.addAttribute("reviews", reviews);
		
	}
	// 이벤트 리스트 데이터 반환
	public String dataLoad(HttpServletRequest req, Model model){
		
		JsonClass js = new JsonClass();
		
		//파라메터 가져오기
		String esidx = req.getParameter("esidx");
		String mid = (String)req.getSession().getAttribute("mid");
		
		
		// DAO 활용 데이터 가져오기
		List<Event_Eventlist> detail = eventsDAO.selectEventsDetailByESIDX(esidx);
		List<Guestlist> glist = geustlistDAO.searchGuestlistById(mid);
		List<Map<Object, Object>> cntlist = geustlistDAO.selectCntGuestlist();
		
		System.out.println(cntlist.size());
		
		for (Map<Object, Object> map : cntlist) {
			System.out.println("ELIDX : "+map.get("ELIDX"));
			System.out.println("CNT : "+map.get("CNT"));
		}
/*		// JSON으로 넘길 데이터 다시 생성
		for (Event_Eventlist e : detail) {
			
			String elidx = e.getElidx();

			
			for (Guestlist guestlist : glist) {
				
			}
		}
		*/
		return "";
	}
	
	class JsonClass{
		
	}
}
