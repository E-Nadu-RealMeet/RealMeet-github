package com.nadu.rms.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.BoardDao;
import com.nadu.rms.dao.CommentDAO;
import com.nadu.rms.service.BoardService;
import com.nadu.rms.vo.Board;
import com.nadu.rms.vo.Comment;

@Controller
@RequestMapping("board/*")
public class FreeBoardController {

	BoardDao boardDao;
	CommentDAO commentDAO;
	BoardService BoardService;
	
	@Autowired
	public void setBoardService(BoardService boardService) {
		BoardService = boardService;
	}

	@Autowired
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Autowired
	public void setCommentDao(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	static final Logger log = LoggerFactory.getLogger(FreeBoardController.class);

	@RequestMapping(value = "/freeBoard", method = RequestMethod.GET)
	public String freeBoard(Model model, HttpServletRequest req) {

		String mid = (String) req.getSession().getAttribute("mid");

		int pages = 1;
		String tmpPages = req.getParameter("pages");

		/*검색 필터*/
		String key= req.getParameter("key");
		/*검색어*/

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
		System.out.println(query+"쿼리문");
		paramMap.put("type", "free");
		List<Board> list = boardDao.selectBoards(paramMap);
		
//		sortBoardList(list);
		
		/* 리턴 값 */
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("introValue", "자유 게시판");
		model.addAttribute("list", sortBoardList(list));
		model.addAttribute("mid", mid);
		model.addAttribute("page", "board/freeBoard");

		return "board/freeBoard";

	}
	
	
	
	private List<Board> sortBoardList(List<Board> list) {
		Set<Integer> bidxSet = new HashSet<Integer>();
		List<Board> resultList = new ArrayList<Board>();
		
		for (Board board : list) {
			bidxSet.add(Integer.parseInt(board.getBidx()));
		}
		resultList.addAll(list);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bidxSet", bidxSet);
		
		if (!CollectionUtils.isEmpty(bidxSet)) {
			
			// replyBoardList: 답글만 가져옴
			List<Board> replyBoardList = boardDao.selectReplyBoardsFromBidx(paramMap);
			
			// 답글의 최대 뎁스를 구함 (대대대댓글이 얼마나 있는지)
			int maxBlevel = 0;
			for (Board replyBoard : replyBoardList) {
				int currentBoardBlevel = replyBoard.getBlevel();
				
				if (maxBlevel < currentBoardBlevel) {
					maxBlevel = currentBoardBlevel;
				}
			}
			
			// 답글이 있을 경우 밑의 로직 실행
			if (maxBlevel >= 1) {
				for (int j = 1; j <= maxBlevel; j++) {
					
					List<Board> iteratorList = new ArrayList<Board>();
					
					// iteratorList: blevel이 for문 1바퀴당 1단계씩 추가되는 리스트
					for (Board b : resultList) {
						iteratorList.add(b);
					}
					
					int i = 0;
					for (Board board : iteratorList) {
						List<Board> tmp = new ArrayList<Board>();
						
						for (Board replyBoard : replyBoardList) {
							if (replyBoard.getBlevel() == j && Integer.parseInt(board.getBidx()) == Integer.parseInt(replyBoard.getTarget())) {
								// tmp: 끼워 넣을 답글 목록을 담음
								tmp.add(replyBoard);
							}
						}
						
						// tmp로 가져온 것들을 step 오름차순으로(작은 것부터) 정렬
						Collections.sort(tmp, sort);
						
						// tmp를 원글 다음칸에 끼워넣음
						resultList.addAll(i + 1, tmp);
						System.out.println(board.getBidx());
						i++;
					}
				}
			}
		}
		
		return resultList;
	}

	Comparator<Board> sort = new Comparator<Board>() {
		public int compare(Board o1, Board o2) {
			// 앞에 있는 보드가 뒤에 있는 보드보다 스텝이 앞서게 정렬
			return o1.getStep() > o2.getStep() ? 1 : -1;
		}
	};

	@RequestMapping(value="/freeDetail/{bidx}", method = RequestMethod.GET)
	public String freeDetail(@PathVariable int bidx, Model model, HttpServletRequest request){
		
		/* 조회수 증가 */
		boardDao.upHitBoard(bidx);
		Board thisBoard = boardDao.selectFreeDetail(bidx);
		model.addAttribute("aa", thisBoard);
		//model.addAttribute("bb", commentDao.selectComments(bidx));
		
		BoardService.getAroundBoard(bidx, request);

		
		log.info("freeDetail 시작");
		int cStartNum = 1;
		
		if(request.getParameter("cStartNum")==null||request.getParameter("cStartNum").length()==0){
			cStartNum=1;
		}else{
			cStartNum = Integer.parseInt(request.getParameter("startNum"));
		}
		log.info("freeDetail 1");
		int cCurrPage;
		if(request.getParameter("cCurrPage")==null||request.getParameter("cCurrPage").length()==0){
			cCurrPage=1;
		}else{
			cCurrPage=Integer.parseInt(request.getParameter("cCurrPage"));
		}
		log.info("freeDetail 2");
		List<Comment> clist = commentDAO.selectComments(bidx, (cCurrPage-1)*10+1, cCurrPage*10);
		// boardDao.upHitBoard(bidx);
		log.info("freeDetail 3");
		model.addAttribute("aa", boardDao.selectFreeDetail(bidx));
		model.addAttribute("clist", clist);

		//model.addAttribute("bb", commentDao.selectComments(paramMap));
		model.addAttribute("cStartNum", cStartNum);
		model.addAttribute("cCurrPage", cCurrPage);
		model.addAttribute("introValue", "자유 게시판");
		//model.addAttribute("cwriter", cwriter);
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

	//댓글 등록
	@RequestMapping(value="/commentReg", method = RequestMethod.POST)
	public String commentReg(Comment comment, HttpServletRequest request){
		String bidx = comment.getBidx();
		int iv = commentDAO.insertComment(comment);
		if(iv==0){
			log.debug("댓글 등록 에러 발생");
		}
		return "redirect:freeDetail/" + bidx;
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

	
	//답글 등록
	@RequestMapping(value="/freeReflyReg/{bidx}", method = RequestMethod.GET)
	public String freeRefly(@PathVariable int bidx, Model model, HttpServletRequest req){
		
		String mid=(String) req.getSession().getAttribute("mid");
		model.addAttribute("aa",boardDao.selectFreeDetail(bidx));
		model.addAttribute("mid",mid);
		return "board/freeReflyReg";
	}
	//답글 등록Proc
	@RequestMapping(value="/freeReflyReg/{bidx}", method = RequestMethod.POST)
	public String freeRefly(Board board,@PathVariable int bidx){

		Map<String, Object> paramMap = new HashMap<String, Object>();
		int cnt = boardDao.selectReflyStepNum(bidx);
		cnt = cnt+1;
		board.setBlevel(board.getBlevel()+1);
		
		paramMap.put("bidx", board.getBidx());
		paramMap.put("writer", board.getWriter());
		paramMap.put("title", board.getTitle());
		paramMap.put("content", board.getContent());
		paramMap.put("target", board.getTarget());
		paramMap.put("step", cnt);
		paramMap.put("blevel", board.getBlevel());
		boardDao.insertRefly(paramMap);
		int bidx2=(Integer) paramMap.get("bidx");
		return "redirect:../freeDetail/"+bidx2;
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
