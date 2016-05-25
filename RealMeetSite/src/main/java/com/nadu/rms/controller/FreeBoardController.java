package com.nadu.rms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.BoardDao;
import com.nadu.rms.vo.FreeBoard;

@Controller
public class FreeBoardController {
	
	BoardDao boardDao;
	
	@Autowired
	public void setBoardDao(BoardDao boardDao){
		this.boardDao = boardDao;
	}
	
	@RequestMapping(value="/freeBoard", method = RequestMethod.GET)
	public String freeBoard(Model model, HttpServletRequest req){
		
		List<FreeBoard> list = boardDao.selectFreeBoards();
		
		model.addAttribute("list", list);
		return "board/freeBoard";
	}
	@RequestMapping(value="/freeDetail", method = RequestMethod.GET)
	public String freeDetail(Model model, HttpServletRequest req){
		/*String list = boardDao.selectFreeDetail()
		 
		model.addAttribute("list", list);*/
		
		return "board/freeDetail";
	}
	
	@RequestMapping(value="/freeDetail/{nidx}", method = RequestMethod.GET)
	public String freeDetail(@PathVariable String nidx, Model model){
		
		model.addAttribute("aa", boardDao.selectFreeDetail(nidx));
		
		return "board/freeDetail";
	}
	
	//게시물등록
	@RequestMapping(value="/freeReg", method = RequestMethod.GET)
	public String freeReg(){
		return "board/freeBoardReg";
	}
	
	//게시물등록proc
	@RequestMapping(value="/freeReg", method = RequestMethod.POST)
	public String freeReg(FreeBoard board ){
		
		boardDao.insertBoard(board);
		return "redirect:freeBoard";
		
		
	}
	
	@RequestMapping(value="/freeUpdate/{nidx}", method = RequestMethod.GET)
	public String freeUpate(@PathVariable String nidx, Model model){
		model.addAttribute("aa", boardDao.selectFreeDetail(nidx));
		return "board/freeBoardUp";
	}
	
	@RequestMapping(value="/freeUpdate/{nidx}", method = RequestMethod.POST)
	public String freeUpdate(FreeBoard board, @PathVariable String nidx){
		
		boardDao.updateBoard(board);
		return "redirect:../freeDetail/"+nidx;
		
		
	}
	@RequestMapping(value="/freeDel/{nidx}")
	public String freeDel(@PathVariable String nidx){
		boardDao.delBoard(nidx);
		return "redirect:../freeBoard";
	}
	
	
	
	

}
