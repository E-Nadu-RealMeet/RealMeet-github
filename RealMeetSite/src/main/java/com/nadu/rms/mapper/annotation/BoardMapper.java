package com.nadu.rms.mapper.annotation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.nadu.rms.vo.Board;

public interface BoardMapper {

	@Select("SELECT * FROM (SELECT ROWNUM NUM, B.* FROM (SELECT * FROM BOARDS WHERE	${key} LIKE '%${query, jdbcType=VARCHAR}%' AND TYPE = #{type, jdbcType=VARCHAR} ORDER BY REGDATE DESC) B) WHERE NUM BETWEEN #{startNum, jdbcType=INTEGER} AND #{endNum, jdbcType=INTEGER}")
	List<Board> selectBoards(Map<String, Object> paramMap);

	@Select("SELECT COUNT(BIDX) FROM BOARDS WHERE TYPE = #{type, jdbcType=VARCHAR}")
	int getCountByType(@Param("type")String type);
	
	@Select("SELECT * FROM BOARDS WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	Board selectBoardDetail(@Param("bidx")int bidx);

	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE)")
	int insertBoard(Board fb);
	
	@Update("UPDATE BOARDS SET TITLE=#{title, jdbcType=VARCHAR}, CONTENT=#{content, jdbcType=VARCHAR}, REGDATE=SYSDATE WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	int updateBoard(Board fb);
	
	@Delete("DELETE FROM BOARDS WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	int delBoard(@Param("bidx")String bidx);
	
}
