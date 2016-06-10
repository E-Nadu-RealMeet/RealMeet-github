package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.*;

public interface CustomerMapper {
<<<<<<< HEAD


	public List<FAQ> selectFAQs();
	public List<Notices> selectNotices();

	public Notices selectNoticeByNidx();
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	public List<QNA> selectQNAs();
	public QNA insertQNA();
=======
	@Select("SELECT * FROM FAQ")
	public List<FAQ> selectFAQs();
	
	@Select("SELECT * FROM NOTICES")
	public List<Notices> selectNotices();
	
	@Select("SELECT * FROM NOTICES WHERE NIDX = #{nidx, jdbcType=VARCHAR}")
	public Notices selectNoticeByNidx(String nidx);
	
	public FAQ selectFAQByFidx();
	public QNA selectQNAByQidx();
	
	@Select("SELECT * FROM QNA")
	public List<QNA> selectQNAs();
	
	public int insertQNA(QNA q);
>>>>>>> f44d77afc15da165c87b1f27b6cad6a49f0bb179
}
