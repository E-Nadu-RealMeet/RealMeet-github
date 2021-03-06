package com.nadu.rms.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.vo.Users;

@Controller
public class LoginController {

	static final Logger log = LoggerFactory.getLogger(EventController.class);

	
	 @RequestMapping(value = "/login", method = RequestMethod.GET) 
	 public String login(HttpServletRequest request, Model model) {
		 String error = (String) request.getAttribute("error");
		 log.debug("error : ["+error+"]");
		 if(error == null || error.length()==0){
			 return "redirect:/";
		 }else{
			 return "login";
		 }
	 }
	 

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String home(RedirectAttributes redirectAttr, HttpServletRequest request, HttpServletResponse response, String mid, String pwd, String type,
			String checkBoxMid, Model model) {
		// 페이지 계산
		// 이전 페이지 http://localhost/~
		String beforePageAll = request.getHeader("referer");

		// 현재 페이지 /test/index.jsp
		int requestURIsize = request.getRequestURI().length();
		// 현재 페이지 http://localhost:8080/test/index.jsp
		int requestURLsize = request.getRequestURL().length();

		// localhost까지 길이 계산
		int extrasize = requestURLsize - requestURIsize;

		// 프로젝트 이름 길이
		int projsize = request.getContextPath().length();

		// 필요한 페이지
		String beforePage = beforePageAll.substring(extrasize + projsize);
		log.info("beforePage : " + beforePage);
		UsersDao dao = new UsersDao();
		Users u = dao.selectUser(mid, pwd);
		Cookie coo = null;
		if (u == null || !u.getId().equals(mid)) {
			redirectAttr.addFlashAttribute("error", "loginError");
			return "redirect:" + beforePage;
		} else {
			request.getSession().setAttribute("mid", mid);
			request.getSession().setAttribute("pwd", pwd);
			request.getSession().setAttribute("type", type);
			request.getSession().setAttribute("checkBoxMid", checkBoxMid);
			
			//로그인 포인트 업 관련 코드
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String date = df.format(cal.getTime());
			if(u.getFlogdate()==null||u.getFlogdate().length()==0){
				//정보를 현재 시간으로.
				dao.updateFlocdateUser(mid, date);
				dao.updateRatingUser(u.getId(), "+1");
			}else if(!u.getFlogdate().split(" ")[0].equals(date)){
				log.info("포인트를 업합니다.");
				dao.updateFlocdateUser(mid, date);
				dao.updateRatingUser(u.getId(), "+1");
			}else{
				log.info("포인트를 업하지 않습니다.");
			}
			
			
			String savePage = (String) request.getSession().getAttribute("savePage");
			if (checkBoxMid != null && !checkBoxMid.equals("")) {
				// 체크박스가 체크되어 있으면 쿠키 생성
				coo = new Cookie("mid", mid);
				coo.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(coo);
			} else {
				// 체크박스가 체크되어 있지않으면 쿠키 삭제

				coo = new Cookie("mid", null);
				coo.setMaxAge(0);
				response.addCookie(coo);
			}

			if (savePage != null && savePage.length() != 0) {
				log.info("savePage: " + savePage);
				request.getSession().setAttribute("savePage", "");

				return "redirect:" + savePage;
			} else {
				log.info("savePage: 없음");
				return "redirect:" + beforePage;
			}
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		String mid = (String) request.getSession().getAttribute("mid");
		if(mid==null||mid.length()==0){
			return "redirect:/";
		}else{
			// 페이지 계산
			// 이전 페이지 http://localhost/~
			String beforePageAll = request.getHeader("referer");
	
			// 현재 페이지 /test/index.jsp
			int requestURIsize = request.getRequestURI().length();
			// 현재 페이지 http://localhost:8080/test/index.jsp
			int requestURLsize = request.getRequestURL().length();
	
			// localhost까지 길이 계산
			int extrasize = requestURLsize - requestURIsize;
	
			// 프로젝트 이름 길이
			int projsize = request.getContextPath().length();
	
			// 필요한 페이지
			String beforePage = beforePageAll.substring(extrasize + projsize);
			log.info("beforePage : " + beforePage);
			
			mid = "";
			request.getSession().setAttribute("mid", mid);
			
			return "redirect:"+beforePage;
		}
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
	public static String getCookie(Cookie[] coos, String key) {
		if (coos != null) {
			for (Cookie coo : coos) {
				if (coo.getName().equals(key)) {
					return coo.getValue();
				}
			}
		}
		return "";
	}
}
