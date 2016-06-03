package com.nadu.rms.trash;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.BannerMapper;
import com.nadu.rms.vo.Events;

public class BannerDao {

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

	public List<Events> selectEvents() {
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
		List<Events> list = mapper.selectBanners();
		session.close();
		return list;
	}

}
