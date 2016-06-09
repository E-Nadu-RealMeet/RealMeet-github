package com.nadu.rms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.ReviewsMapper;
import com.nadu.rms.vo.Review;

public class ReviewsDao {

	private static final Logger log = LoggerFactory.getLogger(ReviewsDao.class);

	// 해당 esidx의 모든 리뷰 가져오기. 
	public List<Review> selectReviewsByEsidx(String esidx){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		ReviewsMapper mapper = session.getMapper(ReviewsMapper.class);
		List<Review> reviews = mapper.selectReviewsByEsidx(esidx);
		session.close();
		return reviews;
	}
	
	//해당 esidx의 리뷰 갯수
	public int selectReviewsCount(String esidx){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		ReviewsMapper mapper = session.getMapper(ReviewsMapper.class);
		int iv = mapper.selectReviewsCount(esidx);
		return 0;
	}
}
