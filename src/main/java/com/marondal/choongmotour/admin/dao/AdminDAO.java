package com.marondal.choongmotour.admin.dao;

import org.apache.ibatis.annotations.Param;

import com.marondal.choongmotour.admin.model.Admin;

public interface AdminDAO {

	public int insertAdmin(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email
			, @Param("nickname") String nickname
			
			);
	
	public int selectCountloginId(@Param("loginId") String loginId);
	
	//인증번호 일치 확인
	public int selectcertificationNumber(@Param("certificationNumber") String certificationNumber);
	
	
	public Admin selectAdmin(@Param("loginId") String loginId
							, @Param("password") String password);
	

}
