package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Event_User;

public interface BannerMapper{
	@Select("SELECT * FROM (SELECT * FROM VIEW_JOIN_ES_USERS WHERE IMGSRC LIKE '%.%' ORDER BY GOOD DESC) WHERE ROWNUM BETWEEN 1 AND 5")
	List<Event_User> selectBanners();
}
