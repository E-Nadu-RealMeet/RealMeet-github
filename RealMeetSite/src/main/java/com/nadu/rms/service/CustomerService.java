package com.nadu.rms.service;
 
import java.util.List;

 import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.nadu.rms.dao.CustomerDAO;
import com.nadu.rms.vo.FAQ;
import com.nadu.rms.vo.Notices;
import com.nadu.rms.vo.QNA;


 public class CustomerService {
 
     CustomerDAO customerDAO;
 
     @Autowired
     public void setCustomerDAO(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
     }
      
      public String NoticesListLoad(HttpServletRequest req){
          Gson gson = new Gson();
          List<Notices> notices = customerDAO.selectNotices();
          JsonClassForNoticesListLoad set = new JsonClassForNoticesListLoad(); 
          set.setNotices(notices);
          System.out.println(notices);
          return gson.toJson(set);
          
      }
  
  
  class JsonClassForNoticesListLoad{
      List<Notices> notices;
  
      public void setNotices(List<Notices> notices) {
          this.notices = notices;
      }
  
      
  }
  
  
  class JsonClassForFAQListLoad{
      List<FAQ> faq;
  
      public void setFAQs(List<FAQ> faq) {
          this.faq = faq;
      }
  
      
  }
  
  
  class JsonClassForQNAsListLoad{
      List<QNA> qna;
  
      public void setNotices(List<QNA> qna) {
          this.qna = qna;
      }
  
      
  }
  
  
 }