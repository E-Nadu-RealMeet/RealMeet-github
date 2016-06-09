package com.nadu.rms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.BannerMapper;
import com.nadu.rms.vo.Event_User;
import com.nadu.rms.vo.Events;

public class BannerDAO {

	/*
	 * private SqlSessionFactory getSqlSessionFactory(){
	 * 
	 * String resource="com/nadu/rms/config/mybatis-config.xml"; InputStream
	 * inputStream;
	 * 
	 * try{ inputStream = Resources.getResourceAsStream(resource);
	 * }catch(IOException e){ throw new IllegalArgumentException(e); } return
	 * new SqlSessionFactoryBuilder().build(inputStream);
	 * 
	 * }
	 */

	public List<Event_User> selectEvents() {
		/*
		 * SqlSession sqlSession = getSqlSessionFactory().openSession();
		 * 
		 * try{ String statement =
		 * "com.nadu.rms.mapper.BannerMapper.selectBanners";
		 * System.out.println(statement); return
		 * sqlSession.selectList(statement);
		 * 
		 * }finally { sqlSession.close(); }
		 */
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BannerMapper mapper = session.getMapper(BannerMapper.class);
		List<Event_User> list = mapper.selectBanners();
		session.close();
		return list;
	}

}
