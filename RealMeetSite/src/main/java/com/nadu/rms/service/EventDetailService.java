package com.nadu.rms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.google.gson.Gson;
import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.GuestlistDao;
import com.nadu.rms.dao.ReviewsDao;
import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.mapper.annotation.GoodUsersMapper;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Guestlist;
import com.nadu.rms.vo.Review;
import com.nadu.rms.vo.Users;

public class EventDetailService {

	EventsDao eventsDAO;
	ReviewsDao reviewsDAO;
	GuestlistDao geustlistDAO;
	UsersDao usersDAO;
	
	@Autowired
	public void setUsersDAO(UsersDao usersDAO) {
		this.usersDAO = usersDAO;
	}
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
	
	public String EventDetailImg(String esidx){
		
		String imgsrc = eventsDAO.selectEventsImg(esidx);
		return imgsrc;
	}
	
	public int ReviewInsert(String title, String content, String mid, String esidx){
		
		int iv = eventsDAO.ReviewInsert(title, content, mid, esidx);
		return iv;
	}
	
	public int detailLoad(HttpServletRequest req,String esidx, Model model){
		
		String holder = "";
		Users holderInfo;
		List<Event_Eventlist> holderEvents;
		
		List<Event_Eventlist> detail = eventsDAO.selectEventsDetailByESIDX(esidx);
		model.addAttribute("detail",detail);	// detail로 뷰에 넘김
		/* 디테일에 해당하는 리뷰 가져오기.*/
		List<Review> reviews = reviewsDAO.selectReviewsByEsidx(esidx);
		model.addAttribute("reviews", reviews);
		
		if(detail.size()!=0){
			holder = detail.get(0).getHolder();
			holderInfo = usersDAO.selectUsers(holder);
			holderEvents = eventsDAO.selectMyEvents(holder);
			
			model.addAttribute("holderInfo",holderInfo);
			model.addAttribute("holderEvents", holderEvents);
		}
		
		return detail.size();
		
	}
	// 이벤트 리스트 데이터 반환
	public String dataLoad(HttpServletRequest req, Model model){
		
		// Json 형태로 변환시켜줄 Gson 객체 생성
		Gson gson = new Gson();
		
		List<JsonClass> ret = new ArrayList<JsonClass>();
		
		//파라메터 가져오기
		String esidx = req.getParameter("esidx");
		String mid = (String)req.getSession().getAttribute("mid");
		
		System.out.println("esidx"+esidx);
		System.out.println("mid"+mid);
		// DAO 활용 데이터 가져오기
		List<Event_Eventlist> detail = eventsDAO.selectEventsDetailByESIDX(esidx);
		List<Guestlist> glist = geustlistDAO.searchGuestlistById(mid);
		List<Map<Object, Object>> cntlist = geustlistDAO.selectCntGuestlist();

		// JSON으로 넘길 데이터 형태로 가공
		// esidx로 검색한 event,eventlist 전체 순회
		for (Event_Eventlist e : detail) {
			
			// 가공할 형태의 이너클래스 생성
			JsonClass tmpObject = new JsonClass();
			
			// 데이터 삽입
			tmpObject.setElidx(e.getElidx());
			tmpObject.setAddr(e.getAddr());
			tmpObject.setDate(e.getEldate());
			tmpObject.setAttended("false");
			
			tmpObject.setMaxguest(Integer.parseInt(e.getMaxgnum()));
			// 참여자 숫자 가져오기
			for (Map<Object, Object> c : cntlist) {
				//각 elidx마다 카운트된 숫자들중
				//지금 보고있는 elidx의 참여자 카운트 수를 가져옴
				if(((String)c.get("ELIDX")).equals(e.getElidx())){
					tmpObject.setCntguest(Integer.parseInt(c.get("CNT").toString()));
					System.out.println(tmpObject.getCntguest());
					break;
				}
			}

			// 현재 로그인한 유저가 참여 했는지 체크
			for (Guestlist g : glist) {
				System.out.println(g.getGuest());
				System.out.println(g.getGidx());
				System.out.println("e:"+e.getElidx()+"g:"+g.getElidx());
				if(g.getElidx().equals(e.getElidx())){
					tmpObject.setAttended("true");
					break;
				}
			}
			
			//개최자인경우
			if(req.getSession().getAttribute("mid")!=null && req.getSession().getAttribute("mid").equals(e.getHolder())){
				tmpObject.setAttended("owned");
			}
			
			ret.add(tmpObject);
		}

		// Json형태로 반환
		return gson.toJson(ret);
	}
	
	class JsonClass{
		String elidx;
		String attended;
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
		public String isAttended() {
			return attended;
		}
		public void setAttended(String attended) {
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

	public int goodUserChk(String mid) {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		GoodUsersMapper mapper = session.getMapper(GoodUsersMapper.class);
		int goodUserCnt=0;
		try{
			goodUserCnt = mapper.selectGoodUserCnt(mid);
		}finally{
			session.close();
		}
		
		return goodUserCnt;
	}
	public int goodApply(String mid, String esidx) {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		GoodUsersMapper mapper = session.getMapper(GoodUsersMapper.class);
		int goodUserCnt=0;
		try{
			goodUserCnt = mapper.insertGoodUser(mid, esidx);
		}finally{
			session.commit();
			session.close();
		}
		
		return goodUserCnt;
	}
}
