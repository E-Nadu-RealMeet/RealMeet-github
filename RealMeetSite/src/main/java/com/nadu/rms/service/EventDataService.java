package com.nadu.rms.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nadu.rms.config.MyBatisUtil;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.GuestlistDao;
import com.nadu.rms.mapper.annotation.EventsMapper;
import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;
import com.nadu.rms.vo.Eventlist;
import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.Guestlist;

public class EventDataService {

	EventsDao eventsDAO;

	@Autowired
	public void setEventsDao(EventsDao eventsDao) {
		this.eventsDAO = eventsDao;
	}

	public String listLoad(HttpServletRequest req, Map< String, Object> query) {


		// Json 형태로 변환시켜줄 Gson 객체 생성
		Gson gson = new Gson();
		
		// 현재 보여줄 page값 받아옴 ( 최초 접근시 page = 1 )
		int page = (Integer) query.get("page");
		/*
		 * 필터 적용시 들어가야 할 부분.
		 */
		System.out.println(query.get("region"));
		System.out.println(query.get("category"));

		//문자열 처리 해줄것이 있음 ex( 서울|| )이런식으로 들어오는 마지막 ||을 없애줌.
		Iterator<String> keys = query.keySet().iterator();
		while(keys.hasNext()){
			
			String key = keys.next();
			System.out.println("key :"+key);
			if(!key.equals("page") && query.get(key).toString().length() != 0){
				query.replace(key, query.get(key).toString().substring(0, query.get(key).toString().length()-1));
			}
			// 아무것도 없을시, 전체 검색을 위해 문자 '^' 추가.(정규식)
			if(query.get(key).toString().length() == 0){
				query.replace(key, "^");
			}
			
		}
 		/*
		 * page값을 사용, dao 접근, 데이터 가져오기
		 */
		int cnt = eventsDAO.selectCntEvents(query);
		System.out.println(cnt);
		// 시작번호
		int startNum = (page - 1) * 5 + 1;
		int endNum = startNum + 4;

		if (endNum > cnt) endNum = cnt;
		// 수정필요 -> page 이용하여 정해진 갯수만큼 불러오깅 ㅋㅋㅋ
		// List<Map<Object,Object>> datas = eventsDAO.selectEventsNUser();
		query.put("startNum", startNum);
		query.put("endNum", endNum);
		
		List<Event_User> datas = eventsDAO.selectEventsNUser(query);

		// 팩킹할 클래스 객체 선언
		JsonClassForListLoad set = new JsonClassForListLoad();

		set.setCnt(cnt);
		set.setDatas(datas);
		set.setStartNum(startNum);
		set.setEndNum(endNum);

		return gson.toJson(set);
	}

	//
	public String DataloadForMap() {
		// Json 형태로 변환시켜줄 Gson 객체 생성
		Gson gson = new Gson();
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		EventsMapper mapper = session.getMapper(EventsMapper.class);
		List<Event_Eventlist> list = mapper.selectEventRelateAll();
		
		//vo만 쓸꺼면 class 선언 안해도 되네요
		String datas = gson.toJson(list);
		return datas;
	}
	
	class JsonClassForListLoad {
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
