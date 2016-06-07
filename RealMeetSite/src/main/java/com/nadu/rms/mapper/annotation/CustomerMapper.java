package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
	public List<FAQ> selectFAQs();
	
	@Select("SELECT * FROM NOTICES WHERE TITLE LIKE #{title}")
	public List<Notices> selectNotices();
	
	@Select("SELECT TITLE, CONTENT FROM NOTICES WHERE NIDX = #{nidx}")
	public Notices selectNoticeByNidx();
	
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	public List<QNA> selectQNAs();
	public QNA insertQNA();
}
