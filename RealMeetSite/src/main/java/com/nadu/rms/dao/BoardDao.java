package com.nadu.rms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.mapper.annotation.BoardMapper;
import com.nadu.rms.vo.Board;

public class BoardDao {

	public List<Board> selectBoards(Map<String, Object> paramMap){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		List<Board> list = mapper.selectBoards(paramMap); 
		session.close();
		return list;
		
	}

	
	public Board selectFreeDetail(int bidx){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		Board board = mapper.selectBoardDetail(bidx); 
		session.close();
		return board;
		
	}
	
	public int insertBoard(Board fb){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int ret = mapper.insertBoard(fb); 
		session.commit();
		session.close();
		return ret;
		
	}
	
	public int updateBoard(Board fb){
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int ret = mapper.updateBoard(fb); 
		session.commit();
		session.close();
		return ret;
		
	}

	public void delBoard(String bidx) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int ret = mapper.delBoard(bidx); 
		session.commit();
		session.close();
				
	}

	public int getCountByType(String type) {

		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int cnt = mapper.getCountByType(type);
		session.close();
		return cnt;
		/*try{
			
			
			String statement = "com.nadu.rms.mapper.annotation.BoardMapper.getCountByType";
			return sqlSession.selectOne(statement, type);

		}finally {
			sqlSession.close();
		}*/
		
	}




	public void upHitBoard(int bidx) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		mapper.upHitBoard(bidx);
		session.commit();
		session.close();
		
	}




	public int insertRefly(Map<String, Object> paramMap) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			return mapper.insertRefly(paramMap); 
			
		} finally {

			session.commit();
			session.close();
		}
		
	}




	public int selectReflyStepNum(int bidx) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int cnt = mapper.getCountByStep(bidx);
		session.close();
		return cnt;
		
	}




	public List<Board> selectReplyBoardsFromBidx(Map<String, Object> paramMap) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		List<Board> boardList = mapper.getReplyBoardsFromBidx(paramMap);
		session.close();
		return boardList;
	}
}
