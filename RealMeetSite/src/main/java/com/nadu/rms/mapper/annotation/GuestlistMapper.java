package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Guestlist;

public interface GuestlistMapper {

	@Delete("DELETE FROM GUESTLIST WHERE GUEST = #{mid, jdbcType=VARCHAR}")
	public int deleteGuestlist(@Param("mid")String mid);
	
	@Select("SELECT * FROM GUESTLIST WHERE GUEST = #{mid, jdbcType=VARCHAR} ORDER BY TO_NUMBER(ELIDX) DESC")
	public List<Guestlist> searchGuestlistById(@Param("mid")String mid);
}
