package com.nadu.rms.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	//회원정보
	@RequestMapping(value="{id}", method = RequestMethod.GET)
	public String usersinfo(Model model, @PathVariable String id){

		Users users = null;
		users = usersDao.selectUsers(id);
		model.addAttribute("users", users);
		model.addAttribute("id", id);
		return "users/usersinfo";
		
	}
	
	//회원정보수정
	@RequestMapping(value="{id}", method = RequestMethod.POST)
	public String usersinfo(Users u, Model model, @PathVariable String id){
		
		System.out.println("회원정보수정시작");
		int user = usersDao.updateUsers(u);
		model.addAttribute(id);
		if(user>0){
			System.out.println("회원정보수정 성공");
			return "redirect:../";
		}else{
			System.out.println("회원정보수정 실패");
			return "redirect:../users/"+u.getId(); 
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


		
		int user = usersDao.insertUsers(u);
		if(user>0){
			System.out.println("회원추가 성공");
			return "redirect:../"+u.getId();
		}else{
			System.out.println("회원추가 실패");
			return "redirect:join";	
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
}