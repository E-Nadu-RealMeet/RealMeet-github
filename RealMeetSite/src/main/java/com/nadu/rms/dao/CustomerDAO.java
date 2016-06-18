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

	public List<FAQ> selectFAQs() {

		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          List<FAQ> list = mapper.selectFAQs();
		          session.close();
		          return list;
		      }
		  

	public List<Notices> selectNotices() {

		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          List<Notices> list = mapper.selectNotices();
		          session.close();
		          return list;
		      }
		  
	public int countQNAs() {
        SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
        CustomerMapper mapper = session.getMapper(CustomerMapper.class);
        int list = mapper.countQNAs();
        session.close();
        return list;
    }

	public int countFAQs() {

		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          int list = mapper.countFAQs();
		          session.close();
		          return list;
		      }
		  

	public int countNotices() {

		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          int list = mapper.countNotices();
		          session.close();
		          return list;
		      }
	
	public Notices selectNoticeByNidx(String nidx) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);

		          Notices notices = mapper.selectNoticeByNidx(nidx);

		          session.close();
		          return notices;

	}

	public FAQ selectFAQByFidx(String fidx) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          
		          FAQ faq = mapper.selectFAQByFidx(fidx);
		          session.close();
		          return faq;

	}

	public QNA selectQNAByQidx(String qidx) {
		          SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		          CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		          QNA qna = mapper.selectQNAByQidx(qidx);
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

	public int addAnswer(QNA q) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		try {
			int statement = mapper.addAnswer(q);
			return statement;
		} finally {
			session.commit(); // commit�� ���ϸ� ������ �Է��� �ȵ˴ϴ�.
			session.close();
		}
	}
}
