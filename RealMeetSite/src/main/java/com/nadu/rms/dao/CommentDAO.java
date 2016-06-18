package com.nadu.rms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.CommentMapper;
import com.nadu.rms.vo.Comment;

public class CommentDAO {
	
	public List<Comment> selectComments(int bidx){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		List<Comment> list = mapper.selectComments(bidx); 
		session.close();
		return list;
	}
	
	public int insertComment(Comment comment){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		int iv = mapper.insertComment(comment);
		session.commit();
		session.close();
		return iv;
	}
}
