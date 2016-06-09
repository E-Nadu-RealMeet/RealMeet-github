package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {


<<<<<<< HEAD
	public List<FAQ> selectFAQs();
	public List<Notices> selectNotices();
=======
	public List<FAQ> selectFAQs(String title);
	public List<Notices> selectNotices(String title);
>>>>>>> 65d863406b2feffa510d552543d1d65f01dbf223

	public Notices selectNoticeByNidx();
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	public List<QNA> selectQNAs();
	public QNA insertQNA();
}
