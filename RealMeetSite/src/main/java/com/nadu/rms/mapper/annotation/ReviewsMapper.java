package com.nadu.rms.mapper.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.nadu.rms.vo.Review;

public interface ReviewsMapper {

	@Select("SELECT * FROM REVIEWS WHERE ESIDX = #{esidx, jdbcType=VARCHAR} ORDER BY TO_NUMBER(RIDX) DESC")
	public List<Review> selectReviewsByEsidx(@Param("esidx")String esidx); 
	
	@Select("SELECT COUNT(*) FROM REVIEWS WHERE ESIDX = #{esidx, jdbcType=VARCHAR}")
	public int selectReviewsCount(String esidx);
}
