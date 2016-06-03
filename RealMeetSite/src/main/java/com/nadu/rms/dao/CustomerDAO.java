package com.nadu.rms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.CustomerMapper;
import com.nadu.rms.vo.FAQ;
import com.nadu.rms.vo.Notices;
import com.nadu.rms.vo.QNA;

public class CustomerDAO {

	public List<FAQ> selectAllFAQs() {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		List<FAQ> list = mapper.selectFAQs();
		session.close();
		return list;
	}

	public List<Notices> selectAllNotices() {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		List<Notices> list = mapper.selectNotices();
		session.close();
		return list;
	}

	public Notices selectNoticesDetail(String nidx) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		Notices notices = mapper.selectNoticesDetail();
		session.close();
		return notices;
	}

	public FAQ selectFAQsDetail(String fidx) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		FAQ faq = mapper.selectFAQDetail();
		session.close();
		return faq;
	}

	public QNA selectQNAsDetail(String qidx) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		QNA qna = mapper.selectQNADetail();
		return qna;
	}

	public List<QNA> selectAllQNAs() {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		List<QNA> list = mapper.selectQNAs();
		return list;
	}

	public int insertQNAs(QNA q) {
		/*SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		int iv = mapper.
		try {
			String statement = "com.nadu.rms.mapper.customerMapper.insertQNAs";
			return session.insert(statement, q);
		} finally {
			session.commit(); // commit�� ���ϸ� ������ �Է��� �ȵ˴ϴ�.
			session.close();
		}*/
		return 0;
	}

	public List<FAQ> searchFAQs(String title) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		List<FAQ> list = mapper.selectFAQs();
		session.close();
		return list;
	}

	public List<Notices> searchNotices(String title) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		List<Notices> list = mapper.searchNotices();
		session.close();
		return list;
	}

	public List<QNA> searchQNAs(String title) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		List<QNA> list = mapper.selectQNAs();
		session.close();
		return list;
	}
}
