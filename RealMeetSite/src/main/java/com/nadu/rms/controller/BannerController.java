package com.nadu.rms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.BannerDao;
import com.nadu.rms.vo.Events;

@Controller
public class BannerController {
	
	BannerDao bannerDao;
	
	@Autowired
	public void setBannerDao(BannerDao bannerDao){
		this.bannerDao = bannerDao;
	}


    @RequestMapping(value="/slideBanner", method= RequestMethod.GET)
	public String slideBanner(Model model, HttpServletRequest req){
    	
    	List<Events> list = bannerDao.selectEvents();
    	
    	model.addAttribute("list", list);
    	
    	
		return "modules/commons/slideBanner";
	}
    @RequestMapping(value="/test", method= RequestMethod.GET)
   	public String test(Model model, HttpServletRequest req){
List<Events> list = bannerDao.selectEvents();
    	
    	model.addAttribute("list", list);
   		return "modules/commons/test";
   	}
}
