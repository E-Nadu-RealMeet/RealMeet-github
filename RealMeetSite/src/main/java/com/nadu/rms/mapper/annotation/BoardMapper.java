package com.nadu.rms.mapper.annotation;

import java.util.List;

import com.nadu.rms.vo.Board;

public interface BoardMapper {

	List<Board> selectBoards(int startNum, int endNum, String key, String query);

	
	
}