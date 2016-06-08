package com.nadu.rms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.dao.CategoryDAO;
import com.nadu.rms.dao.EventlistDao;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.mapper.annotation.EventlistMapper;
import com.nadu.rms.mapper.annotation.EventsMapper;
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
	public int eventReg(Event_Eventlist e, HttpServletRequest request) {
		int iv = 0;
		
		e.setHolder((String) request.getSession().getAttribute("mid"));
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		try{
			iv = mapper.insertEvents(e);
			
			EventlistMapper mapper2 = session.getMapper(EventlistMapper.class);
			iv+= mapper2.insertEventlist(e);
			
			session.commit();
		}catch(Exception ext){
			session.rollback();
		}finally{
			session.close();
		}
		return iv;
	}
	public List<String> getCategories(){
		List<String> categories = categoryDAO.select();
		return categories;
	}
}
