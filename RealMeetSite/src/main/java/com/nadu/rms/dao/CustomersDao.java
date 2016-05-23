package com.nadu.rms.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.nadu.rms.vo.FAQ;
import com.nadu.rms.vo.Notices;
import com.nadu.rms.vo.QNA;

public class CustomersDao {

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
	
	public List<FAQ> selectAllFAQs(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = "com.nadu.rms.mapper.customerMapper.selectAllFAQs";
			System.out.println(statement);
			return sqlSession.selectList(statement);
			
		}finally {
			sqlSession.close();
		}
	}
	
	public List<Notices> selectAllNotices(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = "com.nadu.rms.mapper.customerMapper.selectAllNotices";
			System.out.println(statement);
			return sqlSession.selectList(statement);
			
		}finally {
			sqlSession.close();
		}
	}
	public List<Notices> selectNoticesDetail(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = "com.nadu.rms.mapper.customerMapper.selectNoticesDetail";
			System.out.println(statement);
			return sqlSession.selectList(statement);
			
		}finally {
			sqlSession.close();
		}
	}
	public List<QNA> selectAllQNAs(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = "com.nadu.rms.mapper.customerMapper.selectAllQNAs";
			System.out.println(statement);
			return sqlSession.selectList(statement);
			
		}finally {
			sqlSession.close();
		}
	}
	
	public int insertQNAs(QNA q){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.customerMapper.insertQNAs";
			return sqlSession.insert(statement, q);
		}finally{
			sqlSession.commit(); //commit을 안하면 데이터 입력이 안됩니다.
			sqlSession.close();
		}
	}
}
