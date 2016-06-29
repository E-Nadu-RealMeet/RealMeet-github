package com.nadu.rms.mapper.annotation;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.nadu.rms.vo.Board;

public interface BoardMapper {
	@Select("SELECT * FROM (SELECT ROWNUM NUM, B.* FROM (SELECT * FROM BOARDS WHERE	ORIGIN IS NULL AND ${key} LIKE '%${query}%' AND TYPE = #{type, jdbcType=VARCHAR} ORDER BY REGDATE DESC) B) WHERE NUM BETWEEN #{startNum, jdbcType=INTEGER} AND #{endNum, jdbcType=INTEGER}")
	List<Board> selectBoards(Map<String, Object> paramMap);
	
	@Select("SELECT * FROM (SELECT ROWNUM NUM, B.* FROM (SELECT * FROM BOARDS WHERE	${key} LIKE '%${query}%' AND TYPE = #{type, jdbcType=VARCHAR} ORDER BY REGDATE DESC) B) WHERE NUM BETWEEN #{startNum, jdbcType=INTEGER} AND #{endNum, jdbcType=INTEGER}")
	List<Board> selectBoards_(Map<String, Object> paramMap);

	@Select("SELECT COUNT(BIDX) FROM BOARDS WHERE TYPE = #{type, jdbcType=VARCHAR}")
	int getCountByType(@Param("type")String type);
	
	@Select("SELECT * FROM BOARDS WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	Board selectBoardDetail(@Param("bidx")int bidx);

	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'free', 0)")
	int insertFreeBoard(Board fb);
	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'food', 0)")
	int insertFoodBoard(Board fb);
	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'game', 0)")
	int insertGameBoard(Board fb);
	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'knowledge', 0)")
	int insertKnowledgeBoard(Board fb);
	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'lecture', 0)")
	int insertLectureBoard(Board fb);
	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'meeting', 0)")
	int insertMeetingBoard(Board fb);
	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'rship', 0)")
	int insertRshipBoard(Board fb);
	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, TO_CHAR(BOARDS_SEQ.NEXTVAL), 0, 0, 'travel', 0)")
	int insertTravelBoard(Board fb);
	
	@Update("UPDATE BOARDS SET TITLE=#{title, jdbcType=VARCHAR}, CONTENT=#{content, jdbcType=VARCHAR}, REGDATE=SYSDATE WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	int updateBoard(Board board);
	
	@Delete("DELETE FROM BOARDS WHERE BIDX = #{bidx, jdbcType=VARCHAR}")
	int delBoard(@Param("bidx")String bidx);
	
	@Update("UPDATE BOARDS SET READCOUNT=READCOUNT+1 WHERE BIDX=#{bidx, jdbcType=VARCHAR}")
	int upHitBoard(@Param("bidx")int bidx);

//	@Insert("INSERT INTO BOARDS(BIDX, WRITER, TITLE, CONTENT, REGDATE, TARGET, STEP, BLEVEL, TYPE, READCOUNT) VALUES(TO_CHAR(BOARDS_SEQ.NEXTVAL), #{writer, jdbcType=NVARCHAR}, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, SYSDATE, #{target, jdbcType=VARCHAR}, #{cnt, jdbcType=INTEGER}, #{blevel, jdbcType=}, 'free', 0)")
	int insertRefly(Map<String, Object> paramMap);

	@Select("SELECT COUNT(STEP) FROM BOARDS WHERE TARGET = #{bidx, jdbcType=VARCHAR} AND STEP>0")
	int getCountByStep(@Param("bidx")int bidx);
	
	//@Select("SELECT * FROM (SELECT ROWNUM NUM, BOARD FROM WHERE ")
	List<Board> getReplyBoardsFromBidx(Map<String, Object> paramMap);
	
	@Select("SELECT * FROM BOARDS WHERE BIDX = (SELECT MAX(BIDX) FROM BOARDS WHERE TO_NUMBER(BIDX) < TO_NUMBER(#{bidx, jdbcType=INTEGER}))")
	Board selectNextBoardIdx(@Param("bidx")int bidx);
	
	@Select("SELECT * FROM BOARDS WHERE BIDX = (SELECT MIN(BIDX) FROM BOARDS WHERE TO_NUMBER(BIDX) > TO_NUMBER(#{bidx, jdbcType=INTEGER}))")
	Board selectPrevBoardIdx(@Param("bidx")int bidx);
	
	
	
}