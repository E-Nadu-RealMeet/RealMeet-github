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

public class EventEditService {

	EventsDao eventsDAO;
	
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}
	
	public int eventNameEdit(HttpServletRequest req,String esidx, String eventName){
		int up = 0;
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		
		up = mapper.updateEventsNameByESIDX(esidx, eventName);
		session.commit();
		session.close();
		return up;
	}
	
	public int eventDateEdit(HttpServletRequest req,String esidx, String elDate){
		int up = 0;
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		
		up = mapper.updateEventsDateByESIDX(esidx, elDate);
		session.commit();
		session.close();
		return up;
	}
	public int eventDescEdit(HttpServletRequest req,String esidx, String description){
		int up = 0;
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		
		up = mapper.updateEventsDescByESIDX(esidx, description);
		session.commit();
		session.close();
		return up;
	}
	
	public int eventCategoryEdit(HttpServletRequest req,String esidx, String category){
		int up = 0;
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		
		up = mapper.updateEventsCategoryByESIDX(esidx, category);
		session.commit();
		session.close();
		return up;
	}
}

