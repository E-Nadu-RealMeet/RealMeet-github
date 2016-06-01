package com.nadu.rms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.vo.Users;

@Controller
public class LoginController {

     @RequestMapping(value = "/login", method = RequestMethod.GET )
     public String home(){
           return "modules/login" ;
     }
     
     @RequestMapping(value = "/logout", method = RequestMethod.GET )
     public String logout(HttpServletRequest request,String mid){
    	 request.getSession().setAttribute( "mid", mid);
    	 mid="";
           return "index" ;
     }
     
     
     @RequestMapping(value = "/login", method = RequestMethod.POST )
     public String home(HttpServletRequest request, String mid, String pwd , Model model ){
     
          
          UsersDao dao = new UsersDao();
          Users m = dao.selectUsers( mid);
          
          
           if(m ==null){
               return "redirect:../src/WEB-INF/login" ;
          } else if (!m .getId().equals(mid)){
               return "redirect:../src/WEB-INF/login" ;
          } else{
               request.getSession().setAttribute( "mid", mid);
               request.getSession().setAttribute( "pwd", pwd);
               return "index" ;
          }
          
          
     
          
     }
     
}
