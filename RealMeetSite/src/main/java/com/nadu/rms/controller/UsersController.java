package com.nadu.rms.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.PasswordAuthentication;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.websocket.Transformation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Users;

@Controller
@RequestMapping("/users/*")
public class UsersController {

	UsersDao usersDao;
	EventsDao eventsDao;
	static final Logger log = LoggerFactory.getLogger(EventController.class);
	private String uploadRepository;
	
	
	
	@Autowired
	public void setUploadRepository(String uploadRepository) {
		this.uploadRepository = uploadRepository;
	}

	@Autowired
	public void setUserDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDao = eventsDao;
	}

	// 회원정보수정
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String usersedit(Model model, HttpServletRequest request) {

		String id = request.getParameter("id");
		Users users = null;
		String introValue = "정보를 수정해주세요.";

		model.addAttribute("introValue", introValue);
		users = usersDao.selectUsers(id);
		model.addAttribute("users", users);
		model.addAttribute("id", id);
		model.addAttribute("page", "users/usersEdit");

		return "users/usersEdit";
	}

	// 회원정보수정 proc
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String usersedit(Model model, Users users) {

		log.info("회원정보수정시작");
		int af = usersDao.updateUsers(users);
		model.addAttribute("id", users.getId());

		if (af > 0) {
			log.info("회원정보수정 성공");
			return "redirect:../users/home";
		} else {
			log.info("회원정보수정 실패");
			return "redirect:../users/edit";
		}
	}

	// 회원가입
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String usersJoin(Model model) {
		String introValue = "회원가입페이지입니다.";
		model.addAttribute("introValue", introValue);
		model.addAttribute("page", "users/usersJoin");
		return "users/usersJoin";
	}

	// 회원가입 proc
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String usersJoin(Users u, String interest, Model model, HttpServletRequest request) {

		u.setInterest(interest);
		int af = usersDao.insertUsers(u);
		model.addAttribute("id", u.getId());
		/*---------------------이메일 전송----------------------------*/
		String email = request.getParameter("email");
		sendEmail(email);		
		/*---------------------------------------------------------*/

		if (af > 0) {
			log.info("회원추가 성공");
			request.getSession().setAttribute("mid", u.getId());
			return "redirect:../users/info";
		} else {
			log.info("회원추가 실패");
			return "redirect:join";
		}
	}

	// 회원정보
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String usersInfo(RedirectAttributes redirectAttr, Model model, HttpServletRequest request) {

		String mid = (String) request.getSession().getAttribute("mid");
		
		if (mid == null || mid == "") {
			redirectAttr.addFlashAttribute("error", "notLoginError");
			log.info("contextPath" + request.getContextPath() + "+" + request.getContextPath().length());
			String savePage = request.getRequestURI().substring(request.getContextPath().length() + 1);
			log.info("현재 페이지" + savePage);
			request.getSession().setAttribute("savePage", savePage);
			return "redirect:" + BeforePageChk(request);
		}else{
			Users users = null;
			users = usersDao.selectUsers(mid);
			model.addAttribute("users", users);
			request.getSession().removeAttribute("savaPage");
			return "users/usersInfo";
		}
	}

	// 회원탈퇴
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String usersCheck(Model model, HttpServletRequest request) {

		String id = (String) request.getSession().getAttribute("mid");
		model.addAttribute("id", id);

		return "users/usersCheck";
	}

	// 회원탈퇴 proc
	@RequestMapping(value = "check", method = RequestMethod.POST)
	public String usersCheck(Model model, HttpServletRequest request, HttpServletResponse res) {

		
		String mid = (String) request.getSession().getAttribute("mid");
		log.info(mid);
		log.info("회원정보삭제시작");

		String introValue = "모임 목록입니다.";
		model.addAttribute("introValue", introValue);
		int af = usersDao.delUsers(mid);

		if (af > 0) {
			log.info("회원삭제 성공");
			request.getSession().removeAttribute("mid");
			return "redirect:../";
		} else {
			log.info("회원삭제 실패");
			// 실패해도 메인페이지로 가면 실패 메세지는 따로 띄우나요?
			return "redirect:../users/check";
		}
	}

	// 아이디중복체크
	@RequestMapping(value = "idcheck")
	public void checkid(String id, HttpServletResponse res, Model model) throws Exception {
		PrintWriter out = res.getWriter();
		log.info("아이디중복체크 " +id);
		Users users = null;
		users = usersDao.selectUsers(id);

		if (users == null) {
			log.info("아이디가 존재하지 않습니다. " +users);
			out.write("YES");
		} else {
			log.info("아이디가 존재합니다. " +users);
			out.write("NO");
		}
	}

	// 회원탈퇴 비번체크
	@RequestMapping(value = "pwdcheck")
	public void checkpwd(String pwd, HttpServletRequest request, HttpServletResponse res, Model model) throws Exception {
		PrintWriter out = res.getWriter();
		String id = (String) request.getSession().getAttribute("mid");
		log.info("pwdcheck=" + id);
		log.info("pwdcheck=" + pwd);
		Users users = null;
		users = usersDao.selectUsers(id);

		if (users.getPwd().equals(pwd)) {
			log.info("yes");
			out.write("YES");
		} else {
			log.info("no");
			out.write("NO");
		}
	}
	
	//회원이미지 업로드
	@RequestMapping(value="uploadfile", method=RequestMethod.POST)
	public String imageupload(HttpServletRequest request, MultipartHttpServletRequest multipartRequest, ModelMap model){
		
		String mid = (String) request.getSession().getAttribute("mid");
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		MultipartFile cmf = (MultipartFile)files.get("uploadfile");
		
		String now = new SimpleDateFormat("yyyy.MMddHmsS").format(new Date());
		String newFileName=null;
		newFileName = now+cmf.getOriginalFilename();
		log.info(newFileName);
		String uploadDir = uploadRepository;
		log.info(uploadDir);
		
		// 파일 업로드 처리 완료.
		try {
			new File(uploadDir).mkdir();
			cmf.transferTo(new File(uploadDir + newFileName));
			
			if(cmf.getName()==null){
				log.error("업로드에 실패하였습니다.!!!!!!!!!!!!!!!!!");
			}else{
				log.error("업로드에 성공하였습니다.!!!!!!!!!!!!!");
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info("실패하였습니다.");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info("실패하였습니다.");
		}
		int af = usersDao.uploadfile(newFileName, mid);
		
		if(af>0){
			return "redirect:../users/home";
		}else{
			log.error("업로드에 실패하였습니다.!!!!!!!!!!!!!!!!!");
			return "error";
		}
		
	}

	// 회원정보, 내가만든이벤트리스트, 참여한 리스트 목록
	@RequestMapping(value = "home")
	public String home(RedirectAttributes redirectAttr, HttpServletRequest request, Model model) {
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
		log.info("beforePageAll : "+beforePageAll);
		String beforePage="/";
		if(beforePageAll!=null&&beforePageAll.length()!=0)
		{
			beforePage = beforePageAll.substring(extrasize + projsize);
		}
		log.info("beforePage : " + beforePage);

		String mid = (String) request.getSession().getAttribute("mid");
		Users users = null;
		List<Event_Eventlist> my_list = null;
		List<Event_Eventlist> join_list = null;

		
		if (mid == null || mid.length()==0) {
			redirectAttr.addFlashAttribute("error", "notLoginError");
			log.info("contextPath:" + request.getContextPath() + "+" + request.getContextPath().length());
			String savePage = request.getRequestURI().substring(request.getContextPath().length() + 1);
			log.info("현재 페이지:" + savePage);
			request.getSession().setAttribute("savePage", savePage);
			return "redirect:/";
		} else {
			log.info("mid : ["+mid.length()+"]");
			model.addAttribute("introValue", "내 정보 홈페이지입니다.");
			users = usersDao.selectUsers(mid);
			my_list = eventsDao.selectMyEvents(mid);
			join_list = eventsDao.selectJoinEvents(mid);

			request.getSession().removeAttribute("savePage");
			
			model.addAttribute("users", users);
			model.addAttribute("my_list", my_list);
			model.addAttribute("join_list", join_list);
			model.addAttribute("id", mid);
			return "users/usersHome";
		}
	}

	public String BeforePageChk(HttpServletRequest request) {
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

		return beforePage;
	}
	
	public void sendEmail(String email){
		String host = "smtp.gmail.com";
		String subject = "이메일 인증";
		String fromName = "관리자";
		String from = "thephm89@gmail.com";
		String to = email;
		
		String content = "<a href='http://www.naver.com'>http://www.naver.com</a>";
		
		try {
			Properties props = new Properties();
			props.put("mail.smtp.statttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth","true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator(){
				String un= "thephm89@gmail.com"; //보내는 사람의 이메일
				String pwd= "dhk1dl2xm3"; //이메일 비밀번호
				protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
					return new javax.mail.PasswordAuthentication(un, pwd);
					
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));
			
			InternetAddress[] address = {new InternetAddress(to)};
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Transport.send(msg);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}