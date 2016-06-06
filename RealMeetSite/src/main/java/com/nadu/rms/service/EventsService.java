package com.nadu.rms.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import com.google.gson.Gson;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.GuestlistDao;
import com.nadu.rms.vo.Event_User;
import com.nadu.rms.vo.Eventlist;
import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.Guestlist;

public class EventsService {

	GuestlistDao gl;
	
	@Autowired
	public void setGl(GuestlistDao gl) {
		this.gl = gl;
	}




	public String listLoad(HttpServletRequest req, EventsDao eventsDAO){

		// Json 형태로 변환시켜줄 Gson 객체 생성
		Gson gson = new Gson();


		// 현재 보여줄 page값 받아옴 ( 최초 접근시 page = 1 )
		int page = Integer.parseInt(req.getParameter("page"));

		/*
		 * 필터 적용시 들어가야 할 부분.
		 */
		
		/*Guestlist Vgl = new Guestlist();
		Vgl.setElidx("1");
		Vgl.setGuest("gyu");
		gl.callApplyProcedure(Vgl);
		System.out.println("return value = "+Vgl.getResult());
		*/

		/*
		 *  page값을 사용, dao 접근, 데이터 가져오기
		 */

		// events 총 갯수 = 보여줄 리스트의 최대값
		int cnt = eventsDAO.selectCntEvents();
		
		// 시작번호
		int startNum = (page-1)*5+1;
		int endNum = startNum+4;
		
		if(endNum > cnt) endNum = cnt;
		//수정필요 -> page 이용하여 정해진 갯수만큼 불러오깅 ㅋㅋㅋ
		//List<Map<Object,Object>> datas = eventsDAO.selectEventsNUser();
		List<Event_User> datas = eventsDAO.selectEventsNUser(startNum,endNum);

		// 팩킹할 클래스 객체 선언
		JsonClassForListLoad set = new JsonClassForListLoad();

		set.setCnt(cnt);
		set.setDatas(datas);
		set.setStartNum(startNum);
		set.setEndNum(endNum);


		return gson.toJson(set);
	}




	class JsonClassForListLoad{
		List<Event_User> datas;
		int cnt;
		int startNum;
		int endNum;

		public void setEndNum(int endNum) {
			this.endNum = endNum;
		}
		public void setStartNum(int startNum) {
			this.startNum = startNum;
		}
		public void setDatas(List<Event_User> datas) {
			this.datas = datas;
		}
		public void setCnt(int cnt) {
			this.cnt = cnt;
		}
	}
}
