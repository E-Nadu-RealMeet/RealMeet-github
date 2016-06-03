package com.nadu.rms.mapper.annotation;

import java.util.List;
import java.util.Map;

import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;

public interface EventsMapper {
	public List<Event_Eventlist> selectEvents();
	public List<Event_Eventlist> selectEventsDetailByESIDX(String esidx);
	public List<Event_User> selectEventsNUser(Map<String, Integer> paramMap);
	public int insertEvents(Event_Eventlist e);
	public int getCntFromEvents();
	public List<String> getCategories();
}
