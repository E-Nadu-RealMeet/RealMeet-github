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

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.BoardMapper;
import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.Board;

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

	public List<Board> selectBoards(Map<String, Object> paramMap){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		List<Board> list = mapper.selectBoards(paramMap); 
		session.close();
		return list;
		
	/*	int startNum = 1+(pages-1)*10;
		int endNum = 10+(pages-1)*10;
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		List<Board> list = mapper.selectBoards(startNum, endNum, key, query); 
		session.close();
		return list;*/
	}
	

	
	
	public Board selectFreeDetail(int nidx){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.annotation.BoardMapper.selectBoardDetail";
			System.out.println(statement);
			return sqlSession.selectOne(statement, nidx);

		}finally {
			sqlSession.close();
		}
		
	}
	
	public int insertBoard(Board fb){
		SqlSession sqlSesstion = getSqlSessionFactory().openSession();
		try {
			String statement = "com.nadu.rms.mapper.annotation.BoardMapper.insertBoard";
			return sqlSesstion.insert(statement, fb);
		} finally {
			sqlSesstion.commit();
			sqlSesstion.close();
		}
		
	}
	
	public int updateBoard(Board fb){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "com.nadu.rms.mapper.annotation.BoardMapper.updateBoard";
			return sqlSession.update(statement, fb);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void delBoard(String nidx) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.annotation.BoardMapper.delBoard";
			
			
			sqlSession.delete(statement, nidx);

		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
	}

	public int getCountByType(String type) {

		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int cnt = mapper.getCountByType(type);
		session.close();
		return cnt;
		/*try{
			
			
			String statement = "com.nadu.rms.mapper.annotation.BoardMapper.getCountByType";
			return sqlSession.selectOne(statement, type);

		}finally {
			sqlSession.close();
		}*/
		
	}
}
