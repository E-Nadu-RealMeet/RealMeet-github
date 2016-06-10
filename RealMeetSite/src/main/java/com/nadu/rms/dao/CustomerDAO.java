package com.nadu.rms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.CustomerMapper;
import com.nadu.rms.vo.FAQ;
import com.nadu.rms.vo.Notices;
import com.nadu.rms.vo.QNA;

public class CustomerDAO {

	public List<QNA> selectQNAs() {
        SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
        CustomerMapper mapper = session.getMapper(CustomerMapper.class);
        List<QNA> list = mapper.selectQNAs();
        session.close();
        return list;
    }
<<<<<<< HEAD
	     public List<FAQ> selectFAQs() {
=======
	public List<FAQ> selectFAQs() {
>>>>>>> f44d77afc15da165c87b1f27b6cad6a49f0bb179
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          List<FAQ> list = mapper.selectFAQs();
		          session.close();
		          return list;
		      }
		  
<<<<<<< HEAD
		      public List<Notices> selectNotices() {
=======
	public List<Notices> selectNotices() {
>>>>>>> f44d77afc15da165c87b1f27b6cad6a49f0bb179
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          List<Notices> list = mapper.selectNotices();
		          session.close();
		          return list;
		      }
		  

	
	public Notices selectNoticeByNidx(String nidx) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
<<<<<<< HEAD
		          Notices notices = mapper.selectNoticeByNidx();
=======
		          Notices notices = mapper.selectNoticeByNidx(nidx);
>>>>>>> f44d77afc15da165c87b1f27b6cad6a49f0bb179
		          session.close();
		          return notices;

	}

	public FAQ selectFAQByFidx(String fidx) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          
		          FAQ faq = mapper.selectFAQByFidx();
		          session.close();
		          return faq;

	}

	public QNA selectQNAByQidx(String qidx) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          QNA qna = mapper.selectQNAByQidx();
		          return qna;
		      

	}


	public int insertQNAs(QNA q) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		try {
			int statement = mapper.insertQNA(q);
			return statement;
		} finally {
			session.commit(); // commit�� ���ϸ� ������ �Է��� �ȵ˴ϴ�.
			session.close();
		}
		
	}

	public List<FAQ> selectFAQs(String title) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          List<FAQ> list = mapper.selectFAQs();
		          session.close();
		          return list;


	}

	public List<Notices> selectNotices(String title) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          List<Notices> list = mapper.selectNotices();
		          session.close();
		          return list;

	}

	public List<QNA> selectQNAs(String title) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          List<QNA> list = mapper.selectQNAs();
		          session.close();
		          return list;

	}
}
