package com.nadu.rms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.EventsMapper;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;

public class EventsDao {

	private static final Logger log = LoggerFactory.getLogger(EventsDao.class);
	

	public List<Event_Eventlist> selectEvents(){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		List<Event_Eventlist> events = mapper.selectEvents();
		session.close();
		return events;
	}
	
	
	public int insertEvents(Event_Eventlist e){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		
		int iv = mapper.insertEvents(e);
		session.commit();
		session.close();
		
		return iv;
	}
	
	//�씠踰ㅽ듃�� �쑀�� �젙蹂� �쉷�뱷Map<Object, Object>
	public List<Event_User> selectEventsNUser(int startNum, int endNum){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		
		Map<String,Integer> paramMap = new HashMap<String,Integer>();
		paramMap.put("startNum", startNum);
		paramMap.put("endNum", endNum);
		
		List<Event_User> events = mapper.selectEventsNUser(paramMap);
		session.close();
		
		return events;
	}
	// Events�� EventList �뀒�씠釉� 議곗씤 寃곌낵 �쉷�뱷 
	public List<Event_Eventlist> selectEventsDetailByESIDX(String esidx){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		List<Event_Eventlist> events = mapper.selectEventsDetailByESIDX(esidx);
		session.close();
		return events;
	}
	
	public int updateEventsNameByESIDX(String esidx, String eventName){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		int events = mapper.updateEventsNameByESIDX(esidx, eventName);
		session.commit();
		session.close();
		return events;
				
	}
	
	public int updateEventsDateByESIDX(String esidx, String elDate){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		int events = mapper.updateEventsDateByESIDX(esidx, elDate);
		session.commit();
		session.close();
		return events;
				
	}
	
	public int updateEventsDescByESIDX(String esidx, String description){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		int events = mapper.updateEventsDateByESIDX(esidx, description);
		session.commit();
		session.close();
		return events;
				
	}
	
	public int updateEventsCategoryByESIDX(String esidx, String Category){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		int events = mapper.updateEventsCategoryByESIDX(esidx, Category);
		session.commit();
		session.close();
		return events;
				
	}
	
	public int selectCntEvents(){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		int cnt = mapper.selectCntEvents();
		session.close();
		return cnt;
	}
	/*
	public List<String> getCategories(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = "com.nadu.rms.mapper.EventsMapper.getCategories";
			return sqlSession.selectList(statement);
		}finally{
			sqlSession.close();
		}
		
	}*/
}
