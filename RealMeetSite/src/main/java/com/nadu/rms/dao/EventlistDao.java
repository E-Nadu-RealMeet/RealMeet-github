package com.nadu.rms.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nadu.rms.vo.Event_Eventlist;

public class EventlistDao {
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
	
	public int insertEventlist(Event_Eventlist el){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = "com.nadu.rms.mapper.EventlistMapper.insertEventlist";
			return sqlSession.insert(statement, el);
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
