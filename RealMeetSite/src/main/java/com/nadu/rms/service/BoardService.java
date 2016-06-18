package com.nadu.rms.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.dao.BoardDao;
import com.nadu.rms.mapper.annotation.BoardMapper;
import com.nadu.rms.vo.Board;

public class BoardService {

	BoardDao boardDAO;

	public BoardDao getBoardDAO() {
		return boardDAO;
	}

	public void setBoardDAO(BoardDao boardDAO) {
		this.boardDAO = boardDAO;
	}
	
	public void getAroundBoard(int bidx, HttpServletRequest req){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		Board prev = mapper.selectPrevBoardIdx(bidx);
		Board next = mapper.selectNextBoardIdx(bidx);
		
		session.close();
		
		req.setAttribute("prev", prev);
		req.setAttribute("next", next);
		
	}
	
}
