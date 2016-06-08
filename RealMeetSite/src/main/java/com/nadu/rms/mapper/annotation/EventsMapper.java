package com.nadu.rms.mapper.annotation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;

public interface EventsMapper {
	@Select("SELECT * FROM EVENTS")
	public List<Event_Eventlist> selectEvents();
	
	@Select("SELECT * FROM VIEW_JOIN_ES_EL WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public List<Event_Eventlist> selectEventsDetailByESIDX(@Param("esidx")String esidx);
	
	@Select("SELECT * FROM (SELECT ROWNUM RNUM, RT.* FROM (SELECT * FROM VIEW_JOIN_ES_USERS) RT ) WHERE RNUM BETWEEN #{startNum, jdbcType=VARCHAR} AND #{endNum, jdbcType=VARCHAR} ORDER BY ESIDX DESC")
	public List<Event_User> selectEventsNUser(Map<String, Integer> paramMap);
	
	@Select("UPDATE EVENTS SET EVENTNAME = #{eventname, jdbcType=VARCHAR}, HOLDER = #{holder, jdbcType=VARCHAR}, DESCRIPTION = #{description, jdbcType=VARCHAR}, IMGSRC = #{imgsrc, jdbcType=VARCHAR}, ABSTRACT = #{abstract, jdbcType=VARCHAR} WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public List<Event_Eventlist> updateEventsDetailByESIDX(@Param("esidx")String esidx);
	
	public int insertEvents(Event_Eventlist e);
	
	@Select("SELECT COUNT(ESIDX) FROM EVENTS")
	public int selectCntEvents();
	
	@Select("SELECT CNAME FROM CATEGORIES")
	public List<String> getCategories();
}
