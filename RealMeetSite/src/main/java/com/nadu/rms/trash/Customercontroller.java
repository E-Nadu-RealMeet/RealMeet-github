package com.nadu.rms.trash;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer/*")
public class Customercontroller {
	
	/*CustomerDAO customersDao;

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
	
	@RequestMapping(value="#NoticesModal", method=RequestMethod.GET)
	public String Notices(Model model){
		//model.addAttribute("Notices", customersDao.selectNotices());
		return "#NoticesModal";	
	}
	@RequestMapping(value="Notices", method=RequestMethod.POST)
	public String searchNotices(Model model, Notices n){
		String title = n.getTitle();
		model.addAttribute("Notices", customersDao.selectNotices(title));
		System.out.println(title);
		return "customer/Notices";	
	}
	@RequestMapping(value="NoticesDetail/{nidx}", method=RequestMethod.GET)
	public String NoticesDetail(HttpServletRequest request, Model model, @PathVariable String nidx){
		model.addAttribute("NoticesDetail", customersDao.selectNoticeByNidx(nidx));
		return "customer/NoticesDetail";
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
		model.addAttribute("QNA", customersDao.selectQNAs(title));
		System.out.println(title);
		return "customer/QNA";	
	}
	@RequestMapping(value="QNADetail/{qidx}", method=RequestMethod.GET)
	public String QNADetail(HttpServletRequest request, Model model, @PathVariable String qidx){
		model.addAttribute("QNADetail", customersDao.selectQNAByQidx(qidx));
		return "customer/QNADetail";
	}
	*/
	
}
