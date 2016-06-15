package com.nadu.rms.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.vo.Users;

@Controller
public class LoginController {
	
	static final Logger log = LoggerFactory.getLogger(EventController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		Cookie[] coos = request.getCookies();
		String cookieMid = CookieSearch.getCookie(coos, "mid");
		model.addAttribute("cookieMid", cookieMid);
		return "modules/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String home(HttpServletRequest request, HttpServletResponse response, String mid, String pwd,String checkBoxMid, Model model) {

		UsersDao dao = new UsersDao();
		Users m = dao.selectUsers(mid);
		
		Cookie coo = null;
		if (m == null || !m.getId().equals(mid)) {
			model.addAttribute("error","loginError");
			return "redirect:/login";
		} else {
			request.getSession().setAttribute("mid", mid);
			request.getSession().setAttribute("pwd", pwd);
			request.getSession().setAttribute("checkBoxMid", checkBoxMid);
			String savePage = (String) request.getSession().getAttribute("savePage");
			if(checkBoxMid != null  && !checkBoxMid.equals("")){
				//체크박스가 체크되어 있으면 쿠키 생성
				coo = new Cookie("mid", mid);
				coo.setMaxAge(60*60*24*30);
				response.addCookie(coo);
			}else{
				//체크박스가 체크되어 있지않으면 쿠키 삭제
				
				coo = new Cookie("mid", null);
				coo.setMaxAge(0);
				response.addCookie(coo);
			}
			
			if (savePage != null && savePage.length()!=0) {
				log.info("savePage: "+savePage);
				request.getSession().setAttribute("savePage", "");
				
				return "redirect:" + savePage;
			} else {
				log.info("savePage: 없음");
				return "redirect:" + "/";
			}
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, String mid) {
		String referrer = request.getHeader("Referer");
		log.info("이전 페이지 : "+referrer);
		request.getSession().setAttribute("mid", mid);
		mid = "";
		return "redirect:/";
	}

	@RequestMapping(value = "/midCheck", method = RequestMethod.POST)
	@ResponseBody
	public String midCheck(HttpServletRequest request) {
		String mid = (String) request.getSession().getAttribute("mid");
		if (mid != null) {
			return "true";
		} else {
			return "false";
		}
	}
}

class CookieSearch {
	public static String getCookie(Cookie[] coos, String key){
		if(coos != null){
			for(Cookie coo : coos){
				if(coo.getName().equals(key)){
					return coo.getValue();
				}
			}
		}
		return "";
	}
}
