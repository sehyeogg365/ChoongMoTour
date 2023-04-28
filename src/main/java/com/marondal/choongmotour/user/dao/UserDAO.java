package com.marondal.choongmotour.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email
			, @Param("nickname") String nickname
	
			);
	
	public int selectCountloginId(@Param("loginId") String loginId);
	
	public User selectUser(@Param("loginId") String loginId
							, @Param("password") String password);
	
	//사용자 리스트
	
	//사용자 한행 조회(아이디찾기)
	
	public User selectUserByNameEmail(@Param("name") String name 
						, @Param("email") String email);
	
	//임시비밀번호 발급
	public int updatePw(@Param("loginId")String loginId
						, @Param("email") String email);
	
	
	//회원정보 수정
	public int updateUser(@Param("loginId")String loginId
			, @Param("password")String password
			, @Param("name")String name
			, @Param("email")String email
			, @Param("phoneNumber")String phoneNumber
			, @Param("nickname")String nickname
			, @Param("imagePath") MultipartFile file);

	
	
}
