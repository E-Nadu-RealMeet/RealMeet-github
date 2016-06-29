package com.nadu.rms.mapper.annotation;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.nadu.rms.vo.Users;

public interface UsersMapper {
	
	@Select("SELECT * FROM USERS WHERE ID = #{id}")
	public Users selectUsers(String id);
	
	@Update("UPDATE USERS SET PWD=#{pwd, jdbcType=VARCHAR}, NICKNAME=#{nickname, jdbcType=VARCHAR}, PHONE=#{phone, jdbcType=VARCHAR}, INTEREST=#{interest, jdbcType=VARCHAR} WHERE ID=#{id, jdbcType=NVARCHAR}")
	public int updateUsers(Users u);
	
	@Delete("DELETE USERS WHERE ID = #{id}")
	public int delUsers(String id);
	
	@Insert("INSERT INTO USERS(ID, PWD, NICKNAME, PHONE, INTEREST) VALUES(#{id, jdbcType=NVARCHAR}, #{pwd, jdbcType=VARCHAR}, #{nickname, jdbcType=VARCHAR}, #{phone, jdbcType=VARCHAR}, #{interest, jdbcType=VARCHAR})")
	public int insertUsers(Users u);
	
	@Update("UPDATE USERS SET IMGSRC=#{newFileName, jdbcType=VARCHAR} WHERE ID=#{mid, jdbcType=VARCHAR}")
	public int uploadfile(@Param("newFileName")String newFileName , @Param("mid")String mid);
	
	public int updateRatingUser(@Param("id")String id, @Param("uRating")String uRating);
	
	@Update("UPDATE USERS SET FLOGDATE = TO_DATE(#{date}) WHERE ID = #{id, jdbcType=VARCHAR}")
	public int updateFlocdateUser(@Param("id")String id, @Param("date")String date);
}
