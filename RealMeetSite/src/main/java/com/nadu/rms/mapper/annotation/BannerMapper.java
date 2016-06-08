package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Events;

public interface BannerMapper{
	@Select("SELECT * FROM EVENTS")
	List<Events> selectBanners();
}
