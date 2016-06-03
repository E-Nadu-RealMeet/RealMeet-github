package com.nadu.rms.mapper.annotation;

import java.util.List;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
	public List<FAQ> selectFAQs();
	public List<Notices> selectNotices();
	public Notices selectNoticesDetail();
	public List<Notices> searchNotices();
	public FAQ selectFAQDetail();
	public FAQ searchFAQs();
	public QNA selectQNADetail();
	public List<QNA> searchQNAs();
	public List<QNA> selectQNAs();
	/*public QNA insertQNA();*/
}
