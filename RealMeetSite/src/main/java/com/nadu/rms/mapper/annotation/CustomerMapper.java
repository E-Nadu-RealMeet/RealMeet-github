package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
	public List<FAQ> selectFAQs();
	
	@Select("SELECT * FROM NOTICES")
	public List<Notices> selectNotices();
	
	public Notices selectNoticeByNidx();
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	public List<QNA> selectQNAs();
	public QNA insertQNA();
}
