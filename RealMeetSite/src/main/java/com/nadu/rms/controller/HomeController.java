package com.nadu.rms.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.BannerDAO;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;
import com.nadu.rms.vo.Events;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BannerDAO bannerDAO;
	static final Logger log = LoggerFactory.getLogger(HomeController.class);

	/**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
       
    	String introValue = "DadleMoyeo에 오신 것을 환영합니다.";
        model.addAttribute("introValue", introValue );
       
        List<Event_User> list = bannerDAO.selectEvents();
        //리스트의 모든 imgsrc를 :로 스플릿해서 첫번째 사진만 다시 setting
        for (Event_User ee : list) {
			ee.setImgsrc(ee.getImgsrc().split(":")[0]);
		}
		model.addAttribute("list", list);    
		model.addAttribute("page","index");
         
        return "index";
    }
}

