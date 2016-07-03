package com.nadu.rms.mapper.annotation;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface GoodUsersMapper {
	
	public int selectGoodUserCnt(@Param("id")String id);
	
	@Insert("INSERT INTO GOODUSERS(ESIDX, ID) VALUES (#{esidx},#{id})")
	public int insertGoodUser(@Param("id")String id, @Param("esidx")String esidx);
}
