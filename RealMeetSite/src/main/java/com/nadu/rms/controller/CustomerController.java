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
		String introValue = "고객센터";
        model.addAttribute("introValue", introValue );
		return "customer/information";	
	}
	
	@RequestMapping("customer")
	public String customer(HttpServletRequest req, Model model){
		List<Notices> Notices = customersDao.selectNotices();
		model.addAttribute("Notices", Notices);
		List<FAQ> FAQs = customersDao.selectFAQs();
		model.addAttribute("FAQs", FAQs);
		List<QNA> QNA = customersDao.selectQNAs(); 
		model.addAttribute("QNA", QNA);
		List<QNA> QNANoAnswer = customersDao.selectQNAsNoAnswer(); 
		model.addAttribute("QNANoAnswer", QNANoAnswer);
		String introValue = "고객센터";
        model.addAttribute("introValue", introValue );
		return "customer/customer";	
	}
	
//	@RequestMapping(value="Notices", produces="text/plain;charset=UTF-8")
//	@ResponseBody
//	public String Notices(HttpServletRequest req, Notices n, Model model){
//		String returnValue = customerService.NoticesListLoad(req);
//		log.info("gson : " + returnValue);
//		return returnValue;
//	}
	
//	@RequestMapping(value="Notices/{pages}", produces="text/plain;charset=UTF-8")
//	public String Noticespages(Notices n, Model model, @PathVariable int pages){
//		int startPageNum = pages - (pages -1)%5;
//		int cntNotices = customersDao.countNotices();
//		int endPagesNumNotices = cntNotices/5 + (cntNotices%5==0?0:1);
//	//	List<Notices> Notices = customersDao.selectNotices();
//	//	model.addAttribute("Notices", Notices);
//		model.addAttribute("Notices", customersDao.selectNotices(pages));
//		model.addAttribute("pages", pages);
//		model.addAttribute("startPageNum", startPageNum);
//		model.addAttribute("endPagesNumNotices", endPagesNumNotices);
//		return "customer/Notices";
//	}
//	@RequestMapping(value="Notices", method=RequestMethod.GET)
////	@ResponseBody
//	public String searchNotices(Model model, Notices n){
//		String title = n.getTitle();
//		model.addAttribute("Notices", customersDao.selectNoticesByTitle(title));
//		System.out.println(title);
//		return "Notices";	
//	}
	@RequestMapping(value="NoticesDetail/{nidx}", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String NoticesDetail(HttpServletRequest req, Model model, @PathVariable String nidx){
		
	//	String returnValue = customerService.NoticesDetailLoad(req, nidx);
		model.addAttribute("NoticesDetail", customersDao.selectNoticeByNidx(nidx));
		return "customer/NoticesDetail";

	}
//	@RequestMapping(value="FAQsModal", method=RequestMethod.GET)
//	@ResponseBody
//	public String FAQs(Model model){
//		List<FAQ> FAQs = customersDao.selectFAQs();
//		model.addAttribute("FAQs", FAQs);
//		return "customer/FAQs";	
//	}
//	@RequestMapping(value="FAQs", method=RequestMethod.POST)
//	public String searchFAQs(Model model, FAQ f){
//		String title = f.getTitle();
//		model.addAttribute("FAQs", customersDao.selectFAQsByTitle(title));
//		System.out.println(title);
//		return "customer/FAQs";	
//	}
	@RequestMapping(value="FAQsDetail/{fidx}", method=RequestMethod.GET)
	public String FAQsDetail(HttpServletRequest request, Model model, @PathVariable String fidx){
		model.addAttribute("FAQsDetail", customersDao.selectFAQByFidx(fidx));
		return "customer/FAQsDetail";
	}
	
	
	@RequestMapping("Call")
	public String Call(Model model){
		
		return "customer/Call";	
	}

//	@RequestMapping(value="QNA", method=RequestMethod.GET)
//	public String QNA(Model model){
//		List<QNA> QNA = customersDao.selectQNAs(); 
//		model.addAttribute("QNA", QNA);
//		return "#QNAsModal";	
//	}

	
	@RequestMapping(value = "insertQNA", method = RequestMethod.POST)
	public String insertQNAs(Model model, QNA q) {
		q.setTitle(q.getTitle());
		q.setContent(q.getContent());
		
		int iv = customersDao.insertQNAs(q);
		if(iv>0){
			
			return "redirect:../customer/customer";
		}else{
			return "redirect:../customer/customer";
		}
	}
	
	@RequestMapping(value = "addAnswer", method = RequestMethod.POST)
	public String addAnswer(Model model, QNA q) {
		q.setAnswer(q.getAnswer());
//		q.setQidx(q.getQidx());
		int iv = customersDao.addAnswer(q);
		if(iv>0){
			
			return "redirect:../customer/customer";
		}else{
			return "redirect:../customer/customer";
		}
	}

//	@RequestMapping(value="QNAModal", method=RequestMethod.POST)
//
//	public String searchQNAs(Model model, QNA q){
//		String title = q.getTitle();
//		model.addAttribute("QNA", customersDao.selectQNAsByTitle(title));
//		System.out.println(title);
//		return "customer/QNA";	
//	}
	@RequestMapping(value="QNADetail/{qidx}", method=RequestMethod.GET)
	public String QNADetail(HttpServletRequest request, Model model, @PathVariable String qidx){
		model.addAttribute("QNADetail", customersDao.selectQNAByQidx(qidx));
		return "customer/QNADetail";
	}
	
	@RequestMapping(value="Answer/{qidx}", method=RequestMethod.GET)
	public String Answer(HttpServletRequest request, Model model, @PathVariable String qidx){
		String introValue = "고객센터";
        model.addAttribute("introValue", introValue );
		model.addAttribute("QNADetail", customersDao.selectQNAByQidx(qidx));
		return "customer/Answer";
	}
}
