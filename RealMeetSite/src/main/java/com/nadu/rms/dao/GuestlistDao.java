package com.nadu.rms.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.GuestlistMapper;
import com.nadu.rms.vo.Guestlist;


public class GuestlistDao{
		
	 public void callApplyProcedure(Guestlist gl){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		GuestlistMapper mapper = session.getMapper(GuestlistMapper.class);
		mapper.callApplyProcedure(gl);
		session.close();
		/*SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try{
			String statement = "com.nadu.rms.mapper.GuestlistMapper.callApplyProcedure";
			return sqlSession.selectOne(statement,gl);

		}finally {
			sqlSession.commit();
			sqlSession.close();
		}*/
	}
	 
	public int deleteGuestlist(String mid, String elidx){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		GuestlistMapper mapper = session.getMapper(GuestlistMapper.class);
		int ret = mapper.deleteGuestlist(mid, elidx);
		session.commit();
		session.close();
		return ret;
	}
	
	public List<Guestlist> searchGuestlistById(String mid){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		GuestlistMapper mapper = session.getMapper(GuestlistMapper.class);
		List<Guestlist> glist = mapper.searchGuestlistById(mid);
		session.close();
		return glist;
	}
	
	public List<Map<Object,Object>> selectCntGuestlist(){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		GuestlistMapper mapper = session.getMapper(GuestlistMapper.class);
		List<Map<Object,Object>> cntlist = mapper.selectCountGuestlist();
		session.close();
		return cntlist;
	}
	
	
}
