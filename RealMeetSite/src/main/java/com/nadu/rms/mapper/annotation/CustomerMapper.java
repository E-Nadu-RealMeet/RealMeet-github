package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
	public List<FAQ> selectFAQs();
	
<<<<<<< HEAD
	@Select("SELECT * FROM NOTICES WHERE TITLE LIKE #{title}")
	public List<Notices> selectNotices();
	
	@Select("SELECT TITLE, CONTENT FROM NOTICES WHERE NIDX = #{nidx}")
=======
	@Select("SELECT * FROM NOTICES")
	public List<Notices> selectNotices();
	
>>>>>>> 436f709c558705d1db1e20ce09cd2f2c179dd7c2
	public Notices selectNoticeByNidx();
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	public List<QNA> selectQNAs();
	public QNA insertQNA();
}
