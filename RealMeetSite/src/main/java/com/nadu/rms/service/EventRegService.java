package com.nadu.rms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.controller.EventController;
import com.nadu.rms.dao.CategoryDAO;
import com.nadu.rms.dao.EventlistDao;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.mapper.annotation.EventlistMapper;
import com.nadu.rms.mapper.annotation.EventsMapper;
import com.nadu.rms.mapper.annotation.UsersMapper;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Users;

public class EventRegService {
	EventsDao eventsDAO;
	EventlistDao eventlistDAO;
	CategoryDAO categoryDAO;
	static final Logger log = LoggerFactory.getLogger(EventRegService.class);
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
		String mid = (String) request.getSession().getAttribute("mid");
		e.setHolder(mid);
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper eventMapper = session.getMapper(EventsMapper.class);
		EventlistMapper elMapper = session.getMapper(EventlistMapper.class);
		try{
			iv = eventMapper.insertEvents(e);
			log.info("insertEvents(e) 실행 결과"+iv);
			
			
			iv+= elMapper.insertEventlist(e);
			log.info("insertEventlist(e) 실행 결과"+iv);
			session.commit();
		}catch(Exception ext){
			log.debug(ext.getMessage());
			ext.printStackTrace();
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
