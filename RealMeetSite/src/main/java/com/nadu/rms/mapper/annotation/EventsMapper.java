package com.nadu.rms.mapper.annotation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.nadu.rms.vo.Event_Eventlist;
import com.nadu.rms.vo.Event_User;
import com.nadu.rms.vo.Events;
import com.nadu.rms.vo.Review;

public interface EventsMapper {
	@Select("SELECT * FROM EVENTS")
	public List<Event_Eventlist> selectEvents();
	
	@Select("SELECT * FROM VIEW_JOIN_ES_EL WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public List<Event_Eventlist> selectEventsDetailByESIDX(@Param("esidx")String esidx);
	
	@Select("SELECT * FROM VIEW_JOIN_ES_ALL")
	public List<Event_Eventlist> selectEventRelateAll();
	
	@Select("SELECT * FROM (SELECT ROWNUM RNUM, RT.* FROM (SELECT * FROM VIEW_JOIN_ES_MODIFYEL WHERE REGEXP_LIKE(ADDR,#{region, jdbcType=VARCHAR}) AND REGEXP_LIKE(CATEGORY,#{category,jdbcType=VARCHAR})) RT ) WHERE RNUM BETWEEN #{startNum, jdbcType=VARCHAR} AND #{endNum, jdbcType=VARCHAR} ORDER BY ESIDX DESC")
	public List<Event_User> selectEventsNUser(Map<String, Object> paramMap);
	
//	@Select("UPDATE EVENTS SET EVENTNAME = #{eventname, jdbcType=VARCHAR}, HOLDER = #{holder, jdbcType=VARCHAR}, DESCRIPTION = #{description, jdbcType=VARCHAR}, IMGSRC = #{imgsrc, jdbcType=VARCHAR}, ABSTRACT = #{abstract, jdbcType=VARCHAR} WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	@Update("UPDATE EVENTS SET EVENTNAME = #{eventname, jdbcType=VARCHAR} WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public int updateEventsNameByESIDX(@Param("esidx")String esidx, @Param("eventname")String eventName);
	
	@Update("UPDATE EVENTLIST SET ELDATE = TO_DATE(#{eldate, jdbcType=VARCHAR}, 'yyyy/mm/dd hh24:mi') WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public int updateEventsDateByESIDX(@Param("esidx")String esidx, @Param("eldate")String elDate);
	
	@Update("UPDATE EVENTS SET DESCRIPTION = #{description, jdbcType=VARCHAR} WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public int updateEventsDescByESIDX(@Param("esidx")String esidx, @Param("description")String description);

	@Update("UPDATE EVENTS SET CATEGORY = #{category, jdbcType=VARCHAR} WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public int updateEventsCategoryByESIDX(@Param("esidx")String esidx, @Param("category")String category);
	
	@Select("SELECT * FROM VIEW_JOIN_ES_EL WHERE HOLDER = #{holder, jdbcType=VARCHAR}")
	public List<Event_Eventlist> selectMyEvents(@Param("holder")String holder);
	
	@Select("SELECT * FROM VIEW_JOIN_ES_EL WHERE ELIDX IN(SELECT ELIDX FROM GUESTLIST WHERE GUEST LIKE '%'||#{guest, jdbcType=VARCHAR}||'%')")
	public List<Event_Eventlist> selectJoinEvents(@Param("guest")String guest);
	
	@Delete("DELETE FROM EVENTS WHERE ESIDX = #{esidx, jdbcType=VARCHAR} ")
	public int deleteEvent(@Param("esidx")String esidx);
	
	public int insertEvents(Event_Eventlist e);
	
	@Select("SELECT COUNT(*) FROM VIEW_JOIN_ES_MODIFYEL WHERE REGEXP_LIKE(ADDR,#{region, jdbcType=VARCHAR}) AND REGEXP_LIKE(CATEGORY,#{category,jdbcType=VARCHAR})")
	public int selectCntEvents(Map<String,Object> paramMap);
	
	@Select("SELECT CNAME FROM CATEGORIES")
	public List<String> getCategories();
	
	@Select("SELECT * FROM EVENTS WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public Events selectEvent(@Param("esidx")String esidx);
	
	@Select("SELECT IMGSRC FROM EVENTS WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public String selectEventsImg(@Param("esidx")String esidx);
	
	@Insert("INSERT INTO REVIEWS(RIDX, WRITER, REGDATE, TITLE, CONTENT, ESIDX) VALUES(TO_CHAR(REVIEW_SEQ.NEXTVAL),#{mid, jdbcType=VARCHAR}, SYSDATE, #{title, jdbcType=VARCHAR},#{content, jdbcType=VARCHAR},#{esidx, jdbcType=VARCHAR})")
	public int ReviewInsert(@Param("title")String title, @Param("content")String content, @Param("mid")String mid, @Param("esidx")String esidx);
}
