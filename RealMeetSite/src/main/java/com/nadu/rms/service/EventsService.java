package com.nadu.rms.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;

import com.google.gson.Gson;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.vo.Eventlist;
import com.nadu.rms.vo.Events;

public class EventsService {

	public String listLoad(HttpServletRequest req, EventsDao eventsDAO){

		// Json 형태로 변환시켜줄 Gson 객체 생성
		Gson gson = new Gson();


		// 현재 보여줄 page값 받아옴 ( 최초 접근시 page = 1 )
		int page = Integer.parseInt(req.getParameter("page"));

		/*
		 * 필터 적용시 들어가야 할 부분.
		 */
		



		/*
		 *  page값을 사용, dao 접근, 데이터 가져오기
		 */

		// events 총 갯수 = 보여줄 리스트의 최대값
		int cnt = eventsDAO.getCntEvents();
		
		// 시작번호
		int startNum = (page-1)*10;

		//수정필요 -> page 이용하여 정해진 갯수만큼 불러오깅 ㅋㅋㅋ
		List<Map<Object,Object>> datas = eventsDAO.selectEventsNUser();


		
		// 팩킹할 클래스 객체 선언
		JsonClassForListLoad set = new JsonClassForListLoad();

		set.setCnt(cnt);
		set.setDatas(datas);
		set.setStartNum(startNum);


		return gson.toJson(set);
	}




	class JsonClassForListLoad{
		List<Map<Object,Object>> datas;
		int cnt;
		int startNum;


		public void setStartNum(int startNum) {
			this.startNum = startNum;
		}
		public void setDatas(List<Map<Object,Object>> datas) {
			this.datas = datas;
		}
		public void setCnt(int cnt) {
			this.cnt = cnt;
		}
	}
}
