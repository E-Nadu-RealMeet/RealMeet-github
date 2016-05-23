package com.nadu.rms.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.vo.Events;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	EventsDao eventsDao;
	static final Logger log = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDao = eventsDao;
	}


	/**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        String name = "Psyken";
        List<Events> list = eventsDao.selectEvents();

		model.addAttribute("list", list);    
        model.addAttribute("name", name );
         
        return "index";
    }
   
}

