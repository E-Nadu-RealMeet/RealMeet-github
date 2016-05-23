/*package com.rms.mybatis.repository.session;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.core.io.Resource;

import com.rms.vo.Events;
import com.rms.vo.Member;

public class ExampleSessionRepository {
	
	private SqlSessionFactory getSqlSessionFactory(){
		
		String resource="com/rms/config/mybatis-config.xml";
		InputStream inputStream;
		
		try{
			inputStream = Resources.getResourceAsStream(resource);
		}catch(IOException e){
			throw new IllegalArgumentException(e);
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
		
	}
	
	public List<Member> selectMemberByPrimaryKey(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = "com.rms.mybatis.mapper.ExampleMapper.selectMemberByPrimaryKey";
			
			return sqlSession.selectList(statement);
			
		}finally {
			sqlSession.close();
		}
	}
	
	

}
*/