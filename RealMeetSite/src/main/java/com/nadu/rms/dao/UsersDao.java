package com.nadu.rms.dao;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.UsersMapper;
import com.nadu.rms.vo.Users;

public class UsersDao {
	
	public Users selectUser(String id, String pwd) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		UsersMapper mapper = session.getMapper(UsersMapper.class);
		
		try {
			Users users = mapper.selectUsers(id);
			//아이디와 비밀번호 체크
			if(users!=null&&users.getId().equals(id)&&users.getPwd().equals(pwd)){
				return users;
			}else{
				return null;
			}
		} finally {
			session.commit();
			session.close();
		}
		
		
		/*SqlSession sqlSession = getSqlSessionFactory().openSession();

		try{
			String statement = "com.nadu.rms.mapper.UsersMapper.selectUsers";
			System.out.println(statement);
			return sqlSession.selectOne(statement, id);
			return sqlSession.selectList(statement, id);
			
		}finally {
			sqlSession.close();
		}*/
	}
	/*private SqlSessionFactory getSqlSessionFactory(){

		String resource="com/nadu/rms/config/mybatis-config.xml";
		InputStream inputStream;

		try{
			inputStream = Resources.getResourceAsStream(resource);
		}catch(IOException e){
			throw new IllegalArgumentException(e);
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}
	*/
	
	
	public int insertUsers(Users u){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		UsersMapper mapper = session.getMapper(UsersMapper.class);
		
		try {
			int af = mapper.insertUsers(u);
			return af;
		} finally {
			session.commit();
			session.close();
		}

		/*SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statement = "com.nadu.rms.mapper.UsersMapper.insertUsers";
			return sqlSession.insert(statement, u);
		} finally{
			sqlSession.commit();
			sqlSession.close();
		}*/
	}
	public Users selectUsers(String id) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		UsersMapper mapper = session.getMapper(UsersMapper.class);
		
		try {
			Users users = mapper.selectUsers(id);
			//아이디와 비밀번호 체크
			return users;
		} finally {
			session.commit();
			session.close();
		}
		
		
		/*SqlSession sqlSession = getSqlSessionFactory().openSession();

		try{
			String statement = "com.nadu.rms.mapper.UsersMapper.selectUsers";
			System.out.println(statement);
			return sqlSession.selectOne(statement, id);
			return sqlSession.selectList(statement, id);
			
		}finally {
			sqlSession.close();
		}*/
	}

	public int updateUsers(Users u) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		UsersMapper mapper = session.getMapper(UsersMapper.class);

		try {
			int af = mapper.updateUsers(u);	
			return af;
		} finally {
			session.commit();
			session.close();
		}
		
		
		/*SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statement = "com.nadu.rms.mapper.UsersMapper.updateUsers";
			return sqlSession.update(statement, u);
		} finally{
			sqlSession.commit();
			sqlSession.close();
		}*/
	}
	
	public int uploadfile(String newFileName, String mid){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		UsersMapper mapper = session.getMapper(UsersMapper.class);
		
		try {
			int af = mapper.uploadfile(newFileName, mid);
			return af;
		} finally {
			session.commit();
			session.close();
		}
	}

	public int delUsers(String id) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		UsersMapper mapper = session.getMapper(UsersMapper.class);

		try {
			int af = mapper.delUsers(id);
			return af;
		} finally {
			session.commit();
			session.close();
		}
		
		
		/*SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statement = "com.nadu.rms.mapper.UsersMapper.delUsers";
			return sqlSession.update(statement, id);
		} finally{
			sqlSession.commit();
			sqlSession.close();
		}*/
	}
}
