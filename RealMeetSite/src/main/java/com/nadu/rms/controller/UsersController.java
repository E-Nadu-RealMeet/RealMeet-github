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
	public String usersJoin(Users u, Model model){

		int af = usersDao.insertUsers(u);
		model.addAttribute("id", u.getId());
		
		if(af>0){
			System.out.println("회원추가 성공");
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
	
	@RequestMapping(value="check", method = RequestMethod.GET)
	public String usersCheck(Model model, HttpServletRequest req){
		
		String id = req.getParameter("id");
		model.addAttribute("id", id);
		
		return "users/usersCheck";
	}
	
	@RequestMapping(value="check", method = RequestMethod.POST)
	public String usersCheck(String id, HttpServletRequest req){
		
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
	
	@RequestMapping(value="idcheck")
	public void checkid(String id, HttpServletRequest req, HttpServletResponse res, Model model) throws Exception { 
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
	
	@RequestMapping(value="pwdcheck")
	public void checkpwd(String id, String pwd, HttpServletRequest req, HttpServletResponse res, Model model) throws Exception { 
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
}