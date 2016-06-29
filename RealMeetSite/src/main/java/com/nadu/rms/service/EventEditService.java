package com.nadu.rms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.google.gson.Gson;
import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.mapper.annotation.EventsMapper;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Events;

public class EventEditService {

	EventsDao eventsDAO;
	
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}
	
	public String eventDelete(HttpServletRequest req, String esidx){
		
		String result = "error";
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		//esidx를 이용하여 해당 이벤트 정보가져오기.
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		Events event = mapper.selectEvent(esidx);
		
		//현재 로그인 회원과 개최자가 일치하는지 확인
		String mid = (String)req.getSession().getAttribute("mid");
		if(mid.equals(event.getHolder())){
			
			//삭제 수행
			mapper = session.getMapper(EventsMapper.class);
			int iv = mapper.deleteEvent(esidx);
			if(iv > 0) result = "success"; 
			else result = "error";

		}
		else{
			//다를 경우 
			result = "failed";
		}
		
		session.commit();
		session.close();
		
		return "";
	}
}

