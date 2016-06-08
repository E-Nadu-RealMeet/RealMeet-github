package com.nadu.rms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.vo.Event_Eventlist;

public class EventEditService {

	EventsDao eventsDAO;
	
	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}
	
	public List<Event_Eventlist> eventEdit(HttpServletRequest req,String esidx, Model model){
		
		
		return null;
		
	}
}
