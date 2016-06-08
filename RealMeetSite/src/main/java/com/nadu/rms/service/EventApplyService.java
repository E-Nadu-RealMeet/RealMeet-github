package com.nadu.rms.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.nadu.rms.dao.GuestlistDao;
import com.nadu.rms.vo.Guestlist;

public class EventApplyService {

	GuestlistDao guestlistDao;
	
	@Autowired
	public void setGuestlistDao(GuestlistDao guestlistDao) {
		this.guestlistDao = guestlistDao;
	}

	public int applyEvent(String mid, String elidx){
		
		Guestlist Vgl = new Guestlist();
		Vgl.setElidx(mid);
		Vgl.setGuest(elidx);
		int result = guestlistDao.callApplyProcedure(Vgl);
		return result;
		
	}
}
