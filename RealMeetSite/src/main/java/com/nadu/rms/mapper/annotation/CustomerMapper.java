package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {


	public List<FAQ> selectFAQs(String title);
	public List<Notices> selectNotices(String title);

	public Notices selectNoticeByNidx();
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	public List<QNA> selectQNAs(String title);
	public QNA insertQNA();
}
