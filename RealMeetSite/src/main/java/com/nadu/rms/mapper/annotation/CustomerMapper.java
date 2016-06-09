package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
<<<<<<< HEAD
	public List<FAQ> selectFAQs();
	

	@Select("SELECT * FROM NOTICES")
	public List<Notices> selectNotices();
	
	@Select("SELECT TITLE, CONTENT FROM NOTICES WHERE NIDX = #{nidx}")
=======
	public List<FAQ> selectFAQs(String title);
	public List<Notices> selectNotices(String title);
>>>>>>> 9399241d16ccac8782f1bde227d2b2f2bcb128dc
	public Notices selectNoticeByNidx();
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	public List<QNA> selectQNAs(String title);
	public QNA insertQNA();
}
