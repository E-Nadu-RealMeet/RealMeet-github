package com.nadu.rms.trash;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.CommentMapper;
import com.nadu.rms.vo.Comment;

public class CommentDao {
	
	/*public List<Comment> selectComments(int bidx){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		List<Comment> list = mapper.selectComments(bidx); 
		session.close();
		return list;
	}*/
	
}
