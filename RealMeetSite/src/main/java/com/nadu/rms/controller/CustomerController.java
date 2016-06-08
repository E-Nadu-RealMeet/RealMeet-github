package com.nadu.rms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadu.rms.dao.CustomerDAO;
import com.nadu.rms.service.CustomerService;
import com.nadu.rms.vo.FAQ;
import com.nadu.rms.vo.Notices;
import com.nadu.rms.vo.QNA;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	CustomerService customerService;
	
	CustomerDAO customersDao;
	
	

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	static final Logger log = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	public void setCustomersDao(CustomerDAO customersDao) {
		this.customersDao = customersDao;
	}
	
	@RequestMapping("information")
	public String information(Model model){
		
		return "customer/information";	
	}
	
	@RequestMapping("customer")
	public String customer(Model model){
		
		return "customer/customer";	
	}
	
	@RequestMapping(value="NoticesModal", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String Notices(HttpServletRequest req, Model model){
//		List<Notices> Notices = customersDao.selectNotices();
//		model.addAttribute("Notices", customersDao.selectNotices());
		String returnValue = customerService.NoticesListLoad(req);
		log.info("gson : " + returnValue);
		return returnValue;
	}
	@RequestMapping(value="NoticesModal", method=RequestMethod.POST)
	public String searchNotices(Model model, Notices n){
		String title = n.getTitle();
		model.addAttribute("Notices", customersDao.selectNotices(title));
		System.out.println(title);
		return "#NoticesModal";	
	}
	@RequestMapping(value="NoticesDetail/{nidx}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String NoticesDetail(HttpServletRequest req, Model model, @PathVariable String nidx){
		
		String returnValue = customerService.NoticesDetailLoad(req, nidx);
//		model.addAttribute("NoticesDetail", customersDao.selectNoticeByNidx(nidx));
		return returnValue;
	}
	@RequestMapping(value="FAQs", method=RequestMethod.GET)
	public String FAQs(Model model){
		List<FAQ> FAQs = customersDao.selectFAQs();
		model.addAttribute("FAQs", FAQs);
		return "customer/FAQs";	
	}
	@RequestMapping(value="FAQs", method=RequestMethod.POST)
	public String searchFAQs(Model model, FAQ f){
		String title = f.getTitle();
		model.addAttribute("FAQs", customersDao.selectFAQs(title));
		System.out.println(title);
		return "customer/FAQs";	
	}
	@RequestMapping(value="FAQsDetail/{fidx}", method=RequestMethod.GET)
	public String FAQsDetail(HttpServletRequest request, Model model, @PathVariable String fidx){
		model.addAttribute("FAQsDetail", customersDao.selectFAQByFidx(fidx));
		return "customer/FAQsDetail";
	}
	
	
	@RequestMapping("Call")
	public String Call(Model model){
		
		return "customer/Call";	
	}
	@RequestMapping(value="QNA", method=RequestMethod.GET)
	public String QNA(Model model){
		List<QNA> QNA = customersDao.selectQNAs(); 
		model.addAttribute("QNA", QNA);
		return "#QNAsModal";	
	}
	
	@RequestMapping(value = "insertQNA", method = RequestMethod.POST)
	public String insertQNAs(Model model, QNA q) {
		q.setTitle(q.getTitle());
		q.setContent(q.getContent());
		
		int iv = customersDao.insertQNAs(q);
		if(iv>0){
			return "redirect:../customer/QNA";
		}else{
			return "redirect:../customer";
		}
	}
	
	@RequestMapping(value="QNA", method=RequestMethod.POST)
	public String searchQNAs(Model model, QNA q){
		String title = q.getTitle();
		model.addAttribute("QNA", customersDao.selectQNAs(title));
		System.out.println(title);
		return "customer/QNA";	
	}
	@RequestMapping(value="QNADetail/{qidx}", method=RequestMethod.GET)
	public String QNADetail(HttpServletRequest request, Model model, @PathVariable String qidx){
		model.addAttribute("QNADetail", customersDao.selectQNAByQidx(qidx));
		return "customer/QNADetail";
	}
	
	
}
