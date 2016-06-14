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
          return gson.toJson(set);
          
      }
      
      public String NoticesDetailLoad(HttpServletRequest req, String nidx){
          Gson gson = new Gson();
          Notices noticesdetail = customerDAO.selectNoticeByNidx(nidx);
          JsonClassForNoticesDetailLoad set = new JsonClassForNoticesDetailLoad();
          set.setNotices(noticesdetail);
          String noticesDetail = gson.toJson(set);
          return noticesDetail;
          
      }
  
  
  class JsonClassForNoticesListLoad{
      List<Notices> notices;
  
      public void setNotices(List<Notices> notices) {
          this.notices = notices;
      }
  
      
  }
  
  class JsonClassForNoticesDetailLoad{
      Notices notices;
  
      public void setNotices(Notices noticesdetail) {
          this.notices = noticesdetail;
      }

}
  
  class JsonClassForFAQListLoad{
      List<FAQ> faq;
  
      public void setFAQs(List<FAQ> faq) {
          this.faq = faq;
      }
  
      
  }
  
  class JsonClassForFAQDetailLoad{
      FAQ faq;
  
      public void setFAQs(FAQ faqDetail) {
          this.faq = faqDetail;
      }
}
  
  class JsonClassForQNAsListLoad{
      List<QNA> qna;
  
      public void setNotices(List<QNA> qna) {
          this.qna = qna;
      }
  
      
  }
  
  class JsonClassForQNAsDetailLoad{
      QNA qna;
  
      public void setNotices(QNA qnaDetail) {
          this.qna = qnaDetail;
      }

}
  
 }