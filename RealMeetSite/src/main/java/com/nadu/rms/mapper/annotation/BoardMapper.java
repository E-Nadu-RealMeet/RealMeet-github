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

	@Select("SELECT * FROM (SELECT ROWNUM NUM, B.* FROM (SELECT * FROM BOARDS WHERE	${key} LIKE '%${query}%' AND TYPE = #{type, jdbcType=VARCHAR} ORDER BY REGDATE DESC) B) WHERE NUM BETWEEN #{startNum, jdbcType=INTEGER} AND #{endNum, jdbcType=INTEGER}")
	List<Board> selectBoards(Map<String, Object> paramMap);

	@Select("SELECT COUNT(BIDX) FROM BOARDS WHERE TYPE = #{type, jdbcType=VARCHAR}")
	int getCountByType(@Param("type")String type);
	
	@Select("SELECT * FROM BOARDS WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	Board selectBoardDetail(@Param("bidx")int bidx);

	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'free', 0)")
	int insertBoard(Board fb);
	
	@Update("UPDATE BOARDS SET TITLE=#{title, jdbcType=VARCHAR}, CONTENT=#{content, jdbcType=VARCHAR}, REGDATE=SYSDATE WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	int updateBoard(Board fb);
	
	@Delete("DELETE FROM BOARDS WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	int delBoard(@Param("bidx")String bidx);
	
	@Update("UPDATE BOARDS SET READCOUNT=READCOUNT+1 WHERE BIDX=#{bidx, jdbcType=VARCHAR}")
	int upHitBoard(@Param("bidx")int bidx);

//	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, #{target, jdbcType=VARCHAR}, #{cnt, jdbcType=INTEGER}, #{blevel, jdbcType=}, 'free', 0)")
	int insertRefly(Map<String, Object> paramMap);

	@Select("SELECT COUNT(STEP) FROM BOARDS WHERE TARGET = #{bidx, jdbcType=VARCHAR} AND STEP>0")
	int getCountByStep(@Param("bidx")int bidx);
	
}