package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
	@Select("SELECT * FROM(SELECT ROWNUM NUM, FAQ.* FROM (SELECT * FROM FAQ ORDER BY REGDATE DESC) FAQ) WHERE NUM BETWEEN (#{pages}*5-4) AND #{pages}*5")
	public List<FAQ> selectFAQs(int pages);
	
	@Select("SELECT * FROM(SELECT ROWNUM NUM, NOTICES.* FROM (SELECT * FROM NOTICES ORDER BY REGDATE DESC) NOTICES) WHERE NUM BETWEEN (#{pages}*5-4) AND #{pages}*5")
	public List<Notices> selectNotices(int pages);
	
	@Select("SELECT * FROM(SELECT ROWNUM NUM, QNA.* FROM (SELECT * FROM QNA ORDER BY REGDATE DESC) QNA) WHERE NUM BETWEEN (#{pages}*5-4) AND #{pages}*5")
	public List<QNA> selectQNAs(int pages);
	
	@Select("SELECT * FROM NOTICES WHERE NIDX = #{nidx, jdbcType=VARCHAR}")
	public Notices selectNoticeByNidx(String nidx);
	
	@Select("SELECT * FROM FAQ WHERE FIDX = #{fidx, jdbcType=VARCHAR}")
	public FAQ selectFAQByFidx(String fidx);
	
	@Select("SELECT * FROM QNA WHERE QIDX = #{qidx, jdbcType=VARCHAR}")
	public QNA selectQNAByQidx(String qidx);
	
	@Select("SELECT COUNT(*) \"CNT\" FROM NOTICES")
	public int countNotices();
	
	@Select("SELECT COUNT(*) \"CNT\" FROM FAQ")
	public int countFAQs();
	
	@Select("SELECT COUNT(*) \"CNT\" FROM QNA")
	public int countQNAs();
	
	public int insertQNA(QNA q);

}
