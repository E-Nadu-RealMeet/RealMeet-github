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
public class customercontroller {
	
	CustomersDao customersDao;

	@Autowired
	public void setCustomersDao(CustomersDao customersDao) {
		this.customersDao = customersDao;
	}
	
	@RequestMapping("information")
	public String information(HttpServletRequest request, HttpServletResponse response, Model model){
		
		return "customer/information";	
	}
	
	@RequestMapping("customer")
	public String customer(HttpServletRequest request, HttpServletResponse response, Model model){
		
		return "customer/customer";	
	}
	@RequestMapping(value="FAQs", method=RequestMethod.GET)
	public String FAQs(HttpServletRequest request, HttpServletResponse response, Model model){
		List<FAQ> FAQs = customersDao.selectAllFAQs();
		model.addAttribute("FAQs", FAQs);
		return "customer/FAQs";	
	}
	@RequestMapping(value="Notices", method=RequestMethod.GET)
	public String Notices(HttpServletRequest request, HttpServletResponse response, Model model){
		List<Notices> Notices = customersDao.selectAllNotices();
		model.addAttribute("Notices", Notices);
		return "customer/Notices";	
	}
	@RequestMapping(value="NoticesDetail", method=RequestMethod.GET)
	public String NoticesDetail(HttpServletRequest request, HttpServletResponse response, Model model, Notices n){
		n.setTitle(n.getTitle());
		List<Notices> NoticesDetail = customersDao.selectNoticesDetail();
		model.addAttribute("NoticesDetail", NoticesDetail);
		return "customer/NoticesDetail";	
	}
	@RequestMapping("Call")
	public String Call(HttpServletRequest request, HttpServletResponse response, Model model){
		
		return "customer/Call";	
	}
	@RequestMapping(value="QNA", method=RequestMethod.GET)
	public String QNA(HttpServletRequest request, HttpServletResponse response, Model model){
		List<QNA> QNA = customersDao.selectAllQNAs(); 
		model.addAttribute("QNA", QNA);
		return "customer/QNA";	
	}
	
	@RequestMapping(value = "QNA", method = RequestMethod.POST)
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
	
}
