package com.nadu.rms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.google.gson.Gson;
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
		
		model.addAttribute("detail",detail);	// detail로 뷰에 넘김
		/* 디테일에 해당하는 리뷰 가져오기.*/
		List<Review> reviews = reviewsDAO.selectReviewsByEsidx(esidx);
		model.addAttribute("reviews", reviews);
		
	}
	// 이벤트 리스트 데이터 반환
	public String dataLoad(HttpServletRequest req, Model model){
		
		// Json 형태로 변환시켜줄 Gson 객체 생성
		Gson gson = new Gson();
		
		List<JsonClass> ret = new ArrayList<JsonClass>();
		
		//파라메터 가져오기
		String esidx = req.getParameter("esidx");
		String mid = (String)req.getSession().getAttribute("mid");
		
		// DAO 활용 데이터 가져오기
		List<Event_Eventlist> detail = eventsDAO.selectEventsDetailByESIDX(esidx);
		List<Guestlist> glist = geustlistDAO.searchGuestlistById(mid);
		List<Map<Object, Object>> cntlist = geustlistDAO.selectCntGuestlist();

		// JSON으로 넘길 데이터 다시 생성
		for (Event_Eventlist e : detail) {
			
			JsonClass tmpObject = new JsonClass();
			
			tmpObject.setElidx(e.getElidx());
			tmpObject.setAddr(e.getAddr());
			tmpObject.setDate(e.getEldate());
			tmpObject.setAttended(false);
			
			tmpObject.setMaxguest(e.getMaxgnum());
			// 참여자 숫자 
			for (Map<Object, Object> c : cntlist) {
				System.out.println("ㅁ"+e.getElidx());
				System.out.println("ㅌ"+c.get("ELIDX"));
				if(((String)c.get("ELIDX")).equals(e.getElidx())){
					tmpObject.setCntguest(Integer.parseInt(c.get("CNT").toString()));
					System.out.println(tmpObject.getCntguest());
					break;
				}
			}

			// 참여 했는지 체크
			for (Guestlist g : glist) {
				if(g.getGuest().equals(mid)){
					tmpObject.setAttended(true);
					break;
				}
			}
			
			ret.add(tmpObject);
		}

		return gson.toJson(ret);
	}
	
	class JsonClass{
		String elidx;
		boolean attended;
		String addr;
		String date;
		int maxguest;
		int cntguest;
		
		public String getElidx() {
			return elidx;
		}
		public void setElidx(String elidx) {
			this.elidx = elidx;
		}
		public boolean isAttended() {
			return attended;
		}
		public void setAttended(boolean attended) {
			this.attended = attended;
		}
		public String getAddr() {
			return addr;
		}
		public void setAddr(String addr) {
			this.addr = addr;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public int getMaxguest() {
			return maxguest;
		}
		public void setMaxguest(int maxguest) {
			this.maxguest = maxguest;
		}
		public int getCntguest() {
			return cntguest;
		}
		public void setCntguest(int cntguest) {
			this.cntguest = cntguest;
		}
	}
}
