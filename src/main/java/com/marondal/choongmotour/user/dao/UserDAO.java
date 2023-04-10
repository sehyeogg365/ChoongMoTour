package com.marondal.choongmotour.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email
			, @Param("phoneNumber") String phoneNumber
			, @Param("nickname") String nickname
			, @Param("imagePath") String imagePath
	
			);
	
	public int selectCountloginId(@Param("loginId") String loginId);
	


}
