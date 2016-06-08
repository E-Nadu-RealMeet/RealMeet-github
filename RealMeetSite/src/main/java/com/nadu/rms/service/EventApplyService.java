package com.nadu.rms.service;

import org.eclipse.jetty.util.log.Log;
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
		Vgl.setElidx(elidx);
		Vgl.setGuest(mid);
		String result = "";
		int ret = guestlistDao.callApplyProcedure(Vgl);
		
		System.out.println("result : " + result);
		return ret;
		
	}
}
