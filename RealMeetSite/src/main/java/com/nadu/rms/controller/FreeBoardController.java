package com.nadu.rms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.BoardDao;
import com.nadu.rms.dao.CommentDao;
import com.nadu.rms.vo.Board;
import com.nadu.rms.vo.Comment;

@Controller
@RequestMapping("board/*")
public class FreeBoardController {

	BoardDao boardDao;
	CommentDao commentDao;

	@Autowired
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Autowired
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	static final Logger log = LoggerFactory.getLogger(FreeBoardController.class);

	@RequestMapping(value = "/freeBoard", method = RequestMethod.GET)
	public String freeBoard(Model model, HttpServletRequest req) {
		String mid = (String) req.getSession().getAttribute("mid");

		int pages = 1;
		String tmpPages = req.getParameter("pages");
		/* 검색 필터 */
		String key = req.getParameter("key");
		/* 검색어 */
		String query = req.getParameter("query");

		if (tmpPages != null && !tmpPages.equals("")) {
			pages = Integer.parseInt(tmpPages);
		}
		if (key == null || key.equals("")) {
			key = "TITLE";
		}
		if (query == null || query.equals("")) {
			query = "";
		}

		// startPageNum, endPageNum 생성
		int cnt = boardDao.getCountByType("free");
		int startPageNum = pages - (pages - 1) % 10;
		int endPageNum = cnt / 10 + (cnt % 10 == 0 ? 0 : 1);

		// startNum, endNum 생성
		int startNum = (pages - 1) * 10 + 1;
		int endNum = startNum + 9;

		// 만약 전체 갯수보다 예상한 endNum의 수가 큰 경우 글 전체갯수로 변경.
		if (endNum >= cnt)
			endNum = cnt;
		System.out.println(endNum);
		// 수정필요

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startNum", startNum);
		paramMap.put("endNum", endNum);
		paramMap.put("key", key);
		paramMap.put("query", query);
		paramMap.put("type", "free");
		List<Board> list = boardDao.selectBoards(paramMap);
		/* 리턴 값 */
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("introValue", "자유 게시판");
		model.addAttribute("list", list);
		model.addAttribute("mid", mid);
		model.addAttribute("page", "board/freeBoard");

		return "board/freeBoard";

	}
	/*
	 * @RequestMapping(value="/freeBoard", method = RequestMethod.POST) public
	 * String freeBoard(Model model, HttpServletRequest req){
	 * 
	 * String introValue="자유 게시판"; model.addAttribute("introValue", introValue
	 * ); List<FreeBoard> list = boardDao.selectFreeBoards();
	 * 
	 * model.addAttribute("list", list); model.addAttribute("page",
	 * "board/freeBoard"); return "redirect:board/freeBoard"; }
	 */

	@RequestMapping(value = "/freeDetail/{bidx}", method = RequestMethod.GET)
	public String freeDetail(@PathVariable int bidx, Model model, HttpServletRequest req) {
		log.info("freeDetail 시작");
		Map<String, Object> paramMap = new HashMap<String, Object>();

		// boardDao.upHitBoard(bidx);
		log.info("freeDetail 1");
		model.addAttribute("aa", boardDao.selectFreeDetail(bidx));
		log.info("freeDetail 2");
		model.addAttribute("bb", commentDao.selectComments(paramMap));
		log.info("freeDetail 3");
		model.addAttribute("introValue", "자유 게시판");

		String cwriter = (String) req.getSession().getAttribute("mid");
		model.addAttribute("cwriter", cwriter);
		log.info("freeDetail 끝");
		return "board/freeDetail";
	}

	// 게시물등록
	@RequestMapping(value = "/freeReg", method = RequestMethod.GET)
	public String freeReg(HttpServletRequest request, Model model) {
		String mid = (String) request.getSession().getAttribute("mid");
		if (mid == null || mid.length() == 0) {
			model.addAttribute("error", "notLoginError");
			String savePage = request.getRequestURI().substring(request.getContextPath().length() + 1);
			request.getSession().setAttribute("savePage", savePage);
			return "redirect:../board/freeBoard";
		}else{
			model.addAttribute("mid", mid);
			model.addAttribute("introValue", "글 쓰기");
			request.getSession().setAttribute("savePage", null);
			return "board/freeBoardReg";
		}
	}

	// 게시물등록proc
	@RequestMapping(value = "/freeReg", method = RequestMethod.POST)
	public String freeReg(Board board) {

		System.out.println(board.getBidx());
		System.out.println(board.getContent());
		System.out.println(board.getTitle());
		boardDao.insertBoard(board);
		return "redirect:freeBoard";

	}

	@RequestMapping(value = "/commentReg", method = RequestMethod.POST)
	public String commentReg(Comment comment, HttpServletRequest req) {

		String bidx = req.getParameter("bidx");
		System.out.println(bidx);

		return "redirect:../freeDetail" + bidx;
	}

	@RequestMapping(value = "/freeUpdate/{nidx}", method = RequestMethod.GET)
	public String freeUpate(@PathVariable int nidx, Model model) {
		model.addAttribute("aa", boardDao.selectFreeDetail(nidx));
		model.addAttribute("introValue", "게시글 수정");
		return "board/freeBoardUp";
	}

	@RequestMapping(value = "/freeUpdate/{nidx}", method = RequestMethod.POST)
	public String freeUpdate(Board board, @PathVariable String nidx) {

		boardDao.updateBoard(board);
		return "redirect:../freeDetail/" + nidx;

	}

	@RequestMapping(value = "/freeDel/{nidx}")
	public String freeDel(@PathVariable String nidx) {
		boardDao.delBoard(nidx);
		return "redirect:../freeBoard";
	}

	@RequestMapping(value = "/gmap", method = RequestMethod.GET)
	public String gmap() {
		return "board/gmap";
	}

}
