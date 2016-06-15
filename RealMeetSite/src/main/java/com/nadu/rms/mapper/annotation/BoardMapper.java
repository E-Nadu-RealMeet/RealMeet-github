package com.nadu.rms.mapper.annotation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Board;

public interface BoardMapper {

	@Select("SELECT * FROM (SELECT ROWNUM NUM, B.* FROM (SELECT * FROM BOARDS WHERE	${key} LIKE '%${query, jdbcType=VARCHAR}%' AND TYPE = #{type, jdbcType=VARCHAR} ORDER BY REGDATE DESC) B) WHERE NUM BETWEEN #{startNum, jdbcType=INTEGER} AND #{endNum, jdbcType=INTEGER}")
	List<Board> selectBoards(Map<String, Object> paramMap);

	@Select("SELECT COUNT(BIDX) FROM BOARDS WHERE TYPE = #{type, jdbcType=VARCHAR}")
	int getCountByType(@Param("type")String type);
	
}
