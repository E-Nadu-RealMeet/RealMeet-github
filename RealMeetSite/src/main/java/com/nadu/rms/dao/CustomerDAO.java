package com.nadu.rms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.CustomerMapper;
import com.nadu.rms.vo.FAQ;
import com.nadu.rms.vo.Notices;
import com.nadu.rms.vo.QNA;

public class CustomerDAO {

	
//	public List<FAQ> selectFAQs() {
//		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
//		try{
//			String statement = "com.nadu.rms.mapper.CustomerMapper.selectFAQs";
//			System.out.println(statement);
//			return sqlSession.selectList(statement);
//
//		}finally {
//			sqlSession.close();
//		}
//	}
//
//	public List<Notices> selectNotices() {
//		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
//		try{
//			String statement = "com.nadu.rms.mapper.CustomerMapper.selectNotices";
//			System.out.println(statement);
//			return sqlSession.selectList(statement);
//
//		}finally {
//			sqlSession.close();
//		}
//	}
//
//	public List<QNA> selectQNAs() {
//		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
//		try{
//			String statement = "com.nadu.rms.mapper.CustomerMapper.selectQNAs";
//			System.out.println(statement);
//			return sqlSession.selectList(statement);
//
//		}finally {
//			sqlSession.close();
//		}
//	}
	
	public Notices selectNoticeByNidx(String nidx) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.CustomerMapper.selectNoticeByNidx";
			System.out.println(statement);
			return sqlSession.selectOne(statement, nidx);

		}finally {
			sqlSession.close();
		}
	}

	public FAQ selectFAQByFidx(String fidx) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.CustomerMapper.selectFAQByFidx";
			System.out.println(statement);
			return sqlSession.selectOne(statement, fidx);

		}finally {
			sqlSession.close();
		}
	}

	public QNA selectQNAByQidx(String qidx) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.CustomerMapper.selectQNAByQidx";
			System.out.println(statement);
			return sqlSession.selectOne(statement, qidx);

		}finally {
			sqlSession.close();
		}
	}


	public int insertQNAs(QNA q) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		
		try {
			String statement = "com.nadu.rms.mapper.CustomerMapper.insertQNA";
			return session.insert(statement, q);
		} finally {
			session.commit(); // commit�� ���ϸ� ������ �Է��� �ȵ˴ϴ�.
			session.close();
		}
		
	}

	public List<FAQ> selectFAQs(String title) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.CustomerMapper.selectFAQs";
			System.out.println(statement);
			return sqlSession.selectList(statement, title);

		}finally {
			sqlSession.close();
		}
	}

	public List<Notices> selectNotices(String title) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.CustomerMapper.selectNotices";
			System.out.println(statement);
			return sqlSession.selectList(statement, title);

		}finally {
			sqlSession.close();
		}
	}

	public List<QNA> selectQNAs(String title) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.CustomerMapper.selectQNAs";
			System.out.println(statement);
			return sqlSession.selectList(statement, title);

		}finally {
			sqlSession.close();
		}
	}
}
