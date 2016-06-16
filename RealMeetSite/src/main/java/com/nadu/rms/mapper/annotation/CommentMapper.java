package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Comment;

public interface CommentMapper {

	
	@Select("SELECT * FROM COMMENTS")
	List<Comment> selectComments(@Param("bidx")int bidx);
}
