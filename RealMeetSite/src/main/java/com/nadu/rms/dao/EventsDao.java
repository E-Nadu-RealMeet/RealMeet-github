package com.nadu.rms.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.EventsMapper;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;
import com.nadu.rms.vo.Events;

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
		try{
			String statement = "com.nadu.rms.mapper.EventsMapper.insertEvents";
			return session.insert(statement, e);
		}finally{
			session.commit(); //commit을 안하면 데이터 입력이 안됩니다.
			session.close();
		}
	}
	
	//이벤트와 유저 정보 획득Map<Object, Object>
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
	
	// Events와 EventList 테이블 조인 결과 획득 
	public List<Event_Eventlist> selectEventsDetailByESIDX(String esidx){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		List<Event_Eventlist> events = mapper.selectEventsDetailByESIDX(esidx);
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
