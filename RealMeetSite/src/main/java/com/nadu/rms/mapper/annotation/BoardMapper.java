package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Board;

public interface BoardMapper {

	@Select("SELECT * FROM (SELECT ROWNUM NUM, B.* FROM (SELECT * FROM BOARDS WHERE	#{key, jdbcType=VARCHAR} LIKE '%#{query, jdbcType=VARCHAR}%' AND TYPE = #{type, jdbcType=VARCHAR} ORDER BY REGDATE DESC) B) WHERE NUM	BETWEEN #{startNum, jdbcType=VARCHAR} AND #{endNum, jdbcType=VARCHAR}")
	List<Board> selectBoards(@Param("startNum")int startNum, @Param("endNum")int endNum, @Param("key")String key,@Param("query")String query, @Param("type")String type);

	@Select("SELECT COUNT(BIDX) FROM BOARDS WHERE TYPE = #{type, jdbcType=VARCHAR}")
	int getCountByType(@Param("type")String type);
	
}
