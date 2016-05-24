package com.nadu.rms.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nadu.rms.vo.Review;

public class ReviewsDao {

	private static final Logger log = LoggerFactory.getLogger(ReviewsDao.class);
	
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
	
	// 해당 esidx의 모든 리뷰 가져오기. 
	public List<Review> selectReviewsByEsidx(String esidx){
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try{
			String statement = "com.nadu.rms.mapper.ReviewsMapper.selectReviewsByEsidx";
			return sqlSession.selectList(statement,esidx);

		}finally {
			sqlSession.close();
		}
	}
}
