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
		
		String returnString = "" ;
		Guestlist Vgl = new Guestlist();
		Vgl.setElidx(elidx);
		Vgl.setGuest(mid);

		guestlistDao.callApplyProcedure(Vgl);
		
		System.out.println("result : "+Vgl.getResult());
		
		
		if(Vgl.getResult().equals("0")){
			/* 성공 */
			returnString = "성공하였습니다.";
		}
		else if(Vgl.getResult().equals("1")){
			/* 자리가 없음 */
			returnString = "빈자리가 없습니다.";
		}
		else if(Vgl.getResult().equals("2")){
			/* 이미 참여한 경우*/
			returnString = "이미 참석 하셨습니다.";
		}
		
		return returnString;
		
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
