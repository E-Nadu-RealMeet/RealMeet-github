package com.nadu.rms.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.nadu.rms.vo.Users;

public class UsersDao {
	
	private SqlSessionFactory getSqlSessionFactory(){

		String resource="com/nadu/rms/config/mybatis-config.xml";
		InputStream inputStream;

		try{
			inputStream = Resources.getResourceAsStream(resource);
		}catch(IOException e){
			throw new IllegalArgumentException(e);
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public int insertUsers(Users u){
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statement = "com.nadu.rms.mapper.UsersMapper.insertUsers";
			return sqlSession.insert(statement, u);
		} finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}
	public Users selectUsers(String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try{
			String statement = "com.nadu.rms.mapper.UsersMapper.selectUsers";
			System.out.println(statement);
			return sqlSession.selectOne(statement, id);
			/*return sqlSession.selectList(statement, id);*/
			
		}finally {
			sqlSession.close();
		}
	}

	public int updateUsers(Users u) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statement = "com.nadu.rms.mapper.UsersMapper.updateUsers";
			return sqlSession.update(statement, u);
		} finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public int delUsers(String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statement = "com.nadu.rms.mapper.UsersMapper.delUsers";
			return sqlSession.update(statement, id);
		} finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
