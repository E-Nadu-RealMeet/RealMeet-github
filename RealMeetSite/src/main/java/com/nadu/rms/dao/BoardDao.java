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

import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.FreeBoard;

public class BoardDao {
	
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

	public List<FreeBoard> selectFreeBoards(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try{
			String statement = "com.nadu.rms.mapper.FreeBoardMapper.selectFreeBoard";
			System.out.println(statement);
			return sqlSession.selectList(statement);

		}finally {
			sqlSession.close();
		}
	}

	/*public Map<Object, Object> selectFreeDetail(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = "com.nadu.rms.mapper.FreeBoardMapper.selectFreeDetail";
			System.out.println(statement);
			
			return (Map<Object, Object>)sqlSession.selectMap(statement, "nidx");
			//return sqlSession.selectList(statement);
			
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
			sqlSession.commit(); //commit�� ���ϸ� ������ �Է��� �ȵ˴ϴ�.
	}*/
	
	public FreeBoard selectFreeDetail(int nidx){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.FreeBoardMapper.selectFreeDetail";
			System.out.println(statement);
			return sqlSession.selectOne(statement, nidx);

		}finally {
			sqlSession.close();
		}
		
	}
	
	public int insertBoard(FreeBoard fb){
		SqlSession sqlSesstion = getSqlSessionFactory().openSession();
		try {
			String statement = "com.nadu.rms.mapper.FreeBoardMapper.insertFreeBoard";
			return sqlSesstion.insert(statement, fb);
		} finally {
			sqlSesstion.commit();
			sqlSesstion.close();
		}
		
	}
	
	public int updateBoard(FreeBoard fb){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "com.nadu.rms.mapper.FreeBoardMapper.updateFreeBoard";
			return sqlSession.update(statement, fb);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void delBoard(String nidx) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.FreeBoardMapper.delFreeBoard";
			
			
			sqlSession.delete(statement, nidx);

		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
	}
}
