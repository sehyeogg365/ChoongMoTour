package com.marondal.choongmotour.admin.dao;

import org.apache.ibatis.annotations.Param;

public interface AdminDAO {

	public int insertAdmin(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email
			, @Param("nickname") String nickname
			
			);
	
	public int selectCountloginId(@Param("loginId") String loginId);
	
	

}
