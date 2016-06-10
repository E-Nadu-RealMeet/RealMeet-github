package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
	@Select("SELECT * FROM FAQ")
	public List<FAQ> selectFAQs();
	
	@Select("SELECT * FROM FAQ WHERE TITLE LIKE '%'||#{title}||'%'")
	public List<FAQ> selectFAQsByTitle(String title);
	
	@Select("SELECT * FROM NOTICES")
	public List<Notices> selectNotices();
	
	@Select("SELECT * FROM NOTICES WHERE TITLE LIKE '%'||#{title}||'%'")
	public List<Notices> selectNoticesByTitle(String title);
	
	@Select("SELECT * FROM QNA")
	public List<QNA> selectQNAs();
	
	@Select("SELECT * FROM QNA WHERE TITLE LIKE '%'||#{title}||'%'")
	public List<QNA> selectQNAsByTitle(String title);
	
	@Select("SELECT * FROM NOTICES WHERE NIDX = #{nidx, jdbcType=VARCHAR}")
	public Notices selectNoticeByNidx(String nidx);
	
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	
	
	
	public int insertQNA(QNA q);

}
