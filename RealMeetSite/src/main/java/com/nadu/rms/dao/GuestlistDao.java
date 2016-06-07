package com.nadu.rms.dao;


import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.vo.Guestlist;


public class GuestlistDao{
	
	
	 public String callApplyProcedure(Guestlist gl){
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();

		try{
			String statement = "com.nadu.rms.mapper.GuestlistMapper.callApplyProcedure";
			return sqlSession.selectOne(statement,gl);

		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
	}
}
