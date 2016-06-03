package com.nadu.rms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.CategoryMapper;

public class CategoryDAO {
	public List<String> select(){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CategoryMapper mapper = session.getMapper(CategoryMapper.class);
		List<String> categories = mapper.selectCategory();
		session.close();
		
		return categories;
	}
}
