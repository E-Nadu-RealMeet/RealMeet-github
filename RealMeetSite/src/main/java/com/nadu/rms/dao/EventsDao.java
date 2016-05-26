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

import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Events;

public class EventsDao {

	private static final Logger log = LoggerFactory.getLogger(EventsDao.class);
	
	private SqlSessionFactory getSqlSessionFactory(){
		
		String resource="com/nadu/rms/config/mybatis-config.xml";
		InputStream inputStream;

		try{
			inputStream = Resources.getResourceAsStream(resource);
		}catch(IOException e){
			throw new IllegalArgumentException(e);
		}
		return new SqlSessionFactoryBuilder().build(inputStream);

	}

	public List<Events> selectEvents(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try{
			String statement = "com.nadu.rms.mapper.EventsMapper.selectEvents";
			System.out.println(statement);
			return sqlSession.selectList(statement);

		}finally {
			sqlSession.close();
		}
	}
	
	
	public int insertEvents(Event_Eventlist e){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.EventsMapper.insertEvents";
			return sqlSession.insert(statement, e);
		}finally{
			sqlSession.commit(); //commit을 안하면 데이터 입력이 안됩니다.
			sqlSession.close();
		}
	}
	
	//이벤트와 유저 정보 획득
	public List<Map<Object, Object>> selectEventsNUser(){
		//HashMap<String, String> hash = new HashMap<>();
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.EventsMapper.selectEventsNUser";
			return sqlSession.selectList(statement);
		}finally{
			sqlSession.close();
		}
	}
	
	// Events와 EventList 테이블 조인 결과 획득 
	public Map<String, String> selectEventsDetailByESIDX(String esidx){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		try{
			String statement = "com.nadu.rms.mapper.EventsMapper.selectEventsDetailByESIDX";
			System.out.println(statement);
			map = sqlSession.selectOne(statement, esidx);
			return map;

		}finally {
			sqlSession.close();
		}
	}
	
	public int getCntEvents(){
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.EventsMapper.getCntFromEvents";
			return sqlSession.selectOne(statement);
		}finally{
			sqlSession.close();
		}
	}
	
}
