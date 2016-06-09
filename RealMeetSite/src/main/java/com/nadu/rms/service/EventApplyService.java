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

	public String applyEvent(String mid, String elidx){
		
		Guestlist Vgl = new Guestlist();
		Vgl.setElidx(elidx);
		Vgl.setGuest(mid);

		guestlistDao.callApplyProcedure(Vgl);
		
		
		return Vgl.getResult();
		
	}
	public String cancleEvent(String mid, String elidx){
		
		int af = guestlistDao.deleteGuestlist(mid, elidx);

		if(af > 0){
			return "true";
		}
		else{
			return "false";
		}

	}
}
