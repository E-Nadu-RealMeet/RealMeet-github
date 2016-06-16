package com.nadu.rms.mapper.annotation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Comment;

public interface CommentMapper {

	
	@Select("SELECT * FROM COMMENTS")
	List<Comment> selectComments(Map<String, Object> paramMap);
}
