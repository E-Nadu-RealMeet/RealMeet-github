package com.nadu.rms.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.vo.Users;

@Controller
@RequestMapping("users/*")
public class UsersController {
	
	UsersDao usersDao;
	
	@Autowired
	public void setUserDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
	
	//회원정보수정
	@RequestMapping(value="edit", method = RequestMethod.GET)
	public String usersedit(Model model, HttpServletRequest req){

		String id = req.getParameter("id");
		Users users = null;
		
		users = usersDao.selectUsers(id);
		model.addAttribute("users", users);
		model.addAttribute("id", id);
		
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
	public String usersJoin(){
		
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
	public String usersInfo(Model model, HttpServletRequest req){
		
		String id = req.getParameter("id");

		Users users = null;
		users = usersDao.selectUsers(id);
		model.addAttribute("users", users);
		model.addAttribute("id", id);
		
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
	public String usersCheck(String id){
		
		System.out.println(id);
		
		System.out.println("회원정보삭제시작");
		int af = usersDao.delUsers(id);
		
		if(af>0){
			System.out.println("회원삭제 성공");
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
	public String home(HttpServletRequest request){ 
		String mid = (String) request.getSession().getAttribute("mid");
		if(mid == null){
			return "users/usersHome";
		}else{
			return "users/usersHome";
		}
	}
}