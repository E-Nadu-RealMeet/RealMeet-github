package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Comment;

public interface CommentMapper {
	@Select("SELECT * "
		    + "FROM (SELECT CIDX, BIDX, CWRITER, CCOMMENT, STEP, REF, LEV, REGDATE, ROWNUM RN "
			        + "FROM (SELECT * "
			                + "FROM COMMENTS "
			               + "WHERE BIDX = #{bidx} ORDER BY TO_NUMBER(CIDX) DESC)) "
			       + "WHERE RN BETWEEN #{startNum} AND #{endNum}")
	List<Comment> selectComments(@Param("bidx")int bidx,@Param("startNum") int startNum,@Param("endNum") int endNum);
	
	@Insert("INSERT INTO COMMENTS(CIDX, BIDX, CWRITER, CCOMMENT, REF)"
			+ " VALUES(COMMENT_SEQ.NEXTVAL, #{bidx},#{cwriter},#{ccomment}, COMMENT_SEQ.CURRVAL)")
	public int insertComment(Comment comment);
	
	public int selectCommentCnt(@Param("bidx")int bidx);
}
