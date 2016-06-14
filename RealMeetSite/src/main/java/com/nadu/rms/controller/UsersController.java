package com.nadu.rms.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.Users;

@Controller
@RequestMapping("users/*")
public class UsersController {
	
	UsersDao usersDao;
	EventsDao eventsDao;
	static final Logger log = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	public void setUserDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
	
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDao = eventsDao;
	}
	
	//회원정보수정
	@RequestMapping(value="edit", method = RequestMethod.GET)
	public String usersedit(Model model, HttpServletRequest req){

		String id = req.getParameter("id");
		Users users = null;
		
		users = usersDao.selectUsers(id);
		model.addAttribute("users", users);
		model.addAttribute("id", id);
		model.addAttribute("page","users/usersEdit");
		
		return "users/usersEdit";
	}
	
	//회원정보수정 proc
	@RequestMapping(value="edit", method = RequestMethod.POST)
	public String usersedit(Model model, Users users){
		

		System.out.println("회원정보수정시작");
		int af = usersDao.updateUsers(users);
		model.addAttribute("id", users.getId());
		
		if(af>0){
			System.out.println("회원정보수정 성공");
			return "redirect:../users/info";
		}else{
			System.out.println("회원정보수정 실패");
			return "redirect:../"; 
		}
	}

	//회원가입
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String usersJoin(Model model){
		
		model.addAttribute("page","users/usersJoin");
		return "users/usersJoin";		
	}
	
	//회원가입 proc
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String usersJoin(Users u, String interest, Model model, HttpServletRequest request){
		
		u.setInterest(interest);
		int af = usersDao.insertUsers(u);
		model.addAttribute("id", u.getId());
		
		
		if(af>0){
			System.out.println("회원추가 성공");
			request.getSession().setAttribute("mid", u.getId());
			return "redirect:../users/info";
		}else{
			System.out.println("회원추가 실패");
			return "redirect:join";	
		}
	}
	
	//회원정보
	@RequestMapping(value="info", method = RequestMethod.GET)
	public String usersInfo(Model model, HttpServletRequest request){
		
		String mid = (String)request.getSession().getAttribute("mid");
		if(mid == null || mid == ""){
			model.addAttribute("error","notLoginError");
			log.info("contextPath"+request.getContextPath()+"+"+request.getContextPath().length());
			String savePage = request.getRequestURI().substring(request.getContextPath().length()+1);
			log.info("현재 페이지"+savePage);
			request.getSession().setAttribute("savePage", savePage);
			return "redirect:../login";
		}

		Users users = null;
		users = usersDao.selectUsers(mid);
		model.addAttribute("users", users);
		model.addAttribute("id", mid);
		
		return "users/usersInfo";		
	}
	
	//회원탈퇴
	@RequestMapping(value="check", method = RequestMethod.GET)
	public String usersCheck(Model model, HttpServletRequest req){
		
		String id = req.getParameter("id");
		model.addAttribute("id", id);
		
		return "users/usersCheck";
	}
	
	//회원탈퇴 proc
	@RequestMapping(value="check", method = RequestMethod.POST)
	public String usersCheck(String id, HttpServletRequest request, String mid){
		
		System.out.println(id);
		request.getSession().setAttribute("mid", mid);
		System.out.println("회원정보삭제시작");
		int af = usersDao.delUsers(id);
		
		if(af>0){
			System.out.println("회원삭제 성공");
			mid = "";
			return "redirect:../";
		}else{
			System.out.println("회원정보수정 실패");
			return "redirect:../"; 
		}
	}
	
	//아이디중복체크
	@RequestMapping(value="idcheck")
	public void checkid(String id, HttpServletResponse res, Model model) throws Exception { 
		PrintWriter out = res.getWriter();
		System.out.println(id);
		Users users = null;
		users = usersDao.selectUsers(id);
		
		if(users == null){
			System.out.println(users);
			out.write("YES");
		}else{
			System.out.println(users);
			out.write("NO");
		}
	}
	
	//회원탈퇴 비번체크
	@RequestMapping(value="pwdcheck")
	public void checkpwd(String id, String pwd, HttpServletResponse res, Model model) throws Exception { 
		PrintWriter out = res.getWriter();
		System.out.println("pwdcheck="+id);
		System.out.println("pwdcheck="+pwd);
		Users users = null;
		users = usersDao.selectUsers(id);
		
		if(users.getPwd().equals(pwd)){
			System.out.println("yes");
			out.write("YES");
		}else{
			System.out.println("no");
			out.write("NO");
		}
	}
	
	//회원정보, 내가만든이벤트리스트, 참여한 리스트 목록
	@RequestMapping(value="home")
	public String home(HttpServletRequest request, Model model){ 
		String mid = (String) request.getSession().getAttribute("mid");
		Users users = null;
		List<Event_Eventlist> my_list = null;
		List<Event_Eventlist> join_list = null;
		if(mid == null || mid == ""){
			model.addAttribute("error","notLoginError");
			log.info("contextPath"+request.getContextPath()+"+"+request.getContextPath().length());
			String savePage = request.getRequestURI().substring(request.getContextPath().length()+1);
			log.info("현재 페이지"+savePage);
			request.getSession().setAttribute("savePage", savePage);
			return "redirect:../login";
		}else{
			
			users = usersDao.selectUsers(mid);
			my_list = eventsDao.selectMyEvents(mid);
			join_list = eventsDao.selectJoinEvents(mid);
			System.out.println("home_users = "+mid);
			System.out.println("home_my_list ="+my_list);
			System.out.println("home_join_list ="+join_list);
			
			model.addAttribute("users", users);
			model.addAttribute("my_list", my_list);
			model.addAttribute("join_list", join_list);
			model.addAttribute("id", mid);
			return "users/usersHome";
		}
	}
}