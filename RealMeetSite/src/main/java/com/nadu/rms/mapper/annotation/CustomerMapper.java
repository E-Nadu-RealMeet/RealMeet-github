package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
	@Select("SELECT * FROM FAQ")
	public List<FAQ> selectFAQs();
	
	@Select("SELECT * FROM NOTICES")
	public List<Notices> selectNotices();
	
	@Select("SELECT * FROM QNA")
	public List<QNA> selectQNAs();
	
	@Select("SELECT * FROM NOTICES WHERE NIDX = #{nidx, jdbcType=VARCHAR}")
	public Notices selectNoticeByNidx(String nidx);
	
	@Select("SELECT * FROM FAQ WHERE FIDX = #{fidx, jdbcType=VARCHAR}")
	public FAQ selectFAQByFidx(String fidx);
	
	@Select("SELECT * FROM QNA WHERE QIDX = #{qidx, jdbcType=VARCHAR}")
	public QNA selectQNAByQidx(String qidx);
	
	
	
	public int insertQNA(QNA q);

}
