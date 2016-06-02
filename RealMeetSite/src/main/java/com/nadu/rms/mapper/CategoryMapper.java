package com.nadu.rms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CategoryMapper {
	@Results({
		@Result(property="cname", column="CNAME")
	})
	@Select("SELECT CNAME FROM CATEGORIES")
	List<String> selectCategory();
	
	@Insert("")
	int insertCategory();
	
	@Update("")
	int updateCategory();
	
	@Delete("")
	int deleteCategory();
}
