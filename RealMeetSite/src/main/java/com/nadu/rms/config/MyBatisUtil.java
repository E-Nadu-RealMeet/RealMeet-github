package com.nadu.rms.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nadu.rms.controller.EventController;

public class MyBatisUtil {
	static final Logger log = LoggerFactory.getLogger(EventController.class);
	private static SqlSessionFactory sqlSessionFactory;
	
	static{
		String resource = "com/nadu/rms/config/mybatis-config.xml";
		InputStream inputStream;
		try{
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		}catch(IOException e){
			log.debug("MyBatisUtil.java에서 에러 발생"+e.getMessage());
			throw new IllegalArgumentException(e);
		}
	}

	public static SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}
}
