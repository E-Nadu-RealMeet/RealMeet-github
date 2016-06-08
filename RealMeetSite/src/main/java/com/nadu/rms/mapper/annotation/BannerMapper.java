package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Events;

public interface BannerMapper{
	@Select("SELECT * FROM (SELECT * FROM EVENTS WHERE IMGSRC LIKE '%.%' ORDER BY GOOD DESC) WHERE ROWNUM BETWEEN 1 AND 5")
	List<Events> selectBanners();
}
