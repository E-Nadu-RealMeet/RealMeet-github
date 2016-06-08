package com.nadu.rms.mapper.annotation;

import org.apache.ibatis.annotations.SelectKey;

import com.nadu.rms.vo.Event_Eventlist;

public interface EventlistMapper {
	
	public int insertEventlist(Event_Eventlist ee);
	
}
