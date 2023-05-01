package com.marondal.choongmotour.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.marondal.choongmotour.admin.model.Admin;

@Repository
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
	
	//로그인
	public Admin selectAdmin(@Param("loginId") String loginId
							, @Param("password") String password);

	//관리자 리스트
	public List<Admin> selectAdminList(@Param("loginId") String loginId);
	
	//관리자 조회(아이디찾기)
	public List<Admin> selectAdminByNameEmail(@Param("name") String name
										, @Param("email") String email);
	
	//비밀번호 찾기(임시 비밀번호 발급) 아이디 이메일 입력받아서

	//임시 비밀번호 발급 ()
	public Admin updatePassword(@Param("loginId")String loginId
							, @Param("email") String email
							, @Param("password") String password);
	
	//관리자 회원정보 조회
	public Admin selectAdminInfo(@Param("loginId") String loginId);
	
	//관리자 회원정보 수정
	public int updateAdmin(
			@Param("loginId") String loginId
			, @Param("password")String password
			, @Param("name")String name
			, @Param("email")String email
			, @Param("phoneNumber")String phoneNumber
			, @Param("nickname")String nickname
			, @Param("imagePath") String imagePath);
	
	
	
	
}
