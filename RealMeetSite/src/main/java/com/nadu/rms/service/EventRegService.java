package com.nadu.rms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.nadu.rms.dao.CategoryDAO;
import com.nadu.rms.dao.EventlistDao;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.vo.Event_Eventlist;

public class EventRegService {
	EventsDao eventsDAO;
	EventlistDao eventlistDAO;
	CategoryDAO categoryDAO;
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}
	@Autowired
	public void setEventlistDao(EventlistDao eventlistDao) {
		this.eventlistDAO = eventlistDao;
	}
	@Autowired
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
	// 이벤트 등록시 es&el 동시 등록 메서드
	public int eventReg(Event_Eventlist e) {
		int iv = 0;
		
		// 현재 로그인 기능이 없기 때문에 holder는 won으로 통일하겠습니다.
		e.setHolder("won");
		// 로그인 기능 완료 후 삭제 요망 부분
		iv = eventsDAO.insertEvents(e);
		iv = eventlistDAO.insertEventlist(e);
		return iv;
	}
	
	public List<String> getCategories(){
		List<String> categories = categoryDAO.select();
		return categories;
	}
}
