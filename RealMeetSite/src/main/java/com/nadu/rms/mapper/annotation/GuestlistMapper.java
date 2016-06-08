package com.nadu.rms.mapper.annotation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import com.nadu.rms.vo.Guestlist;

public interface GuestlistMapper {

	@Delete("DELETE FROM GUESTLIST WHERE GUEST = #{mid, jdbcType=VARCHAR}")
	public int deleteGuestlist(@Param("mid")String mid);
	
	@Select("SELECT * FROM GUESTLIST WHERE GUEST = #{mid, jdbcType=VARCHAR} ORDER BY TO_NUMBER(ELIDX) DESC")
	public List<Guestlist> searchGuestlistById(@Param("mid")String mid);
	
	@Select("SELECT ELIDX, COUNT(*) CNT FROM GUESTLIST GROUP BY ELIDX")
	public List<Map<Object,Object>> selectCountGuestlist();
	
	@Select("{ call GUESTAPPLY( #{elidx, mode=IN, jdbcType=VARCHAR}, #{guest, mode=IN, jdbcType=VARCHAR},  #{result, mode=OUT, jdbcType=VARCHAR} )	}")
	@Options(statementType = StatementType.CALLABLE) 
	public void callApplyProcedure(Guestlist gl);

}
