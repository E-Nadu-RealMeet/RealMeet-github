package com.nadu.rms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.CustomersDao;
import com.nadu.rms.vo.Notices;
import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.FAQ;
import com.nadu.rms.vo.QNA;

@Controller
@RequestMapping("/customer/*")
public class Customercontroller {
	
	CustomersDao customersDao;

	@Autowired
	public void setCustomersDao(CustomersDao customersDao) {
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
	
	@RequestMapping(value="Notices", method=RequestMethod.GET)
	public String Notices(Model model){
		model.addAttribute("Notices", customersDao.selectAllNotices());
		return "customer/Notices";	
	}
	@RequestMapping(value="Notices", method=RequestMethod.POST)
	public String searchNotices(Model model, Notices n){
		String title = n.getTitle();
		model.addAttribute("Notices", customersDao.searchNotices(title));
		System.out.println(title);
		return "customer/Notices";	
	}
	@RequestMapping(value="NoticesDetail/{nidx}", method=RequestMethod.GET)
	public String NoticesDetail(HttpServletRequest request, Model model, @PathVariable String nidx){
		model.addAttribute("NoticesDetail", customersDao.selectNoticesDetail(nidx));
		return "customer/NoticesDetail";
	}
	@RequestMapping(value="FAQs", method=RequestMethod.GET)
	public String FAQs(Model model){
		List<FAQ> FAQs = customersDao.selectAllFAQs();
		model.addAttribute("FAQs", FAQs);
		return "customer/FAQs";	
	}
	@RequestMapping(value="FAQs", method=RequestMethod.POST)
	public String searchFAQs(Model model, FAQ f){
		String title = f.getTitle();
		model.addAttribute("FAQs", customersDao.searchFAQs(title));
		System.out.println(title);
		return "customer/FAQs";	
	}
	@RequestMapping(value="FAQsDetail/{fidx}", method=RequestMethod.GET)
	public String FAQsDetail(HttpServletRequest request, Model model, @PathVariable String fidx){
		model.addAttribute("FAQsDetail", customersDao.selectFAQsDetail(fidx));
		return "customer/FAQsDetail";
	}
	
	
	@RequestMapping("Call")
	public String Call(Model model){
		
		return "customer/Call";	
	}
	@RequestMapping(value="QNA", method=RequestMethod.GET)
	public String QNA(Model model){
		List<QNA> QNA = customersDao.selectAllQNAs(); 
		model.addAttribute("QNA", QNA);
		return "customer/QNA";	
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
		model.addAttribute("QNA", customersDao.searchQNAs(title));
		System.out.println(title);
		return "customer/QNA";	
	}
	@RequestMapping(value="QNADetail/{qidx}", method=RequestMethod.GET)
	public String QNADetail(HttpServletRequest request, Model model, @PathVariable String qidx){
		model.addAttribute("QNADetail", customersDao.selectQNAsDetail(qidx));
		return "customer/QNADetail";
	}
	
	
}
