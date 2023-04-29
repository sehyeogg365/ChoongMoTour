package com.marondal.choongmotour.user.dao;

import java.util.List;

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
	
	//사용자 조회(아이디찾기)
	
	public List<User> selectUserByNameEmail(@Param("name") String name 
						, @Param("email") String email);
	
	//비밀번호 찾기 아이디 이메일 입력받아서
//	public int selectPwByIdEmail(@Param("loginId")String loginId
//						, @Param("email") String email
//						);
	// 비밀번호 찾기 아이디 이메일 입력받아서 임시 비밀번호 발급
	public int updatePassword(@Param("loginId")String loginId
							, @Param("email") String email
							, @Param("password") String password);
	
	//회원정보 한행 조회
	public User selectUserInfo(@Param("id") int id
									,@Param("password") String password 
									,@Param("name") String passnameword  
									,@Param("email") String email  
									,@Param("phoneNumber") String phoneNumber  
									,@Param("nickname") String nickname  
									,@Param("imagePath") String imagePath
									);
	
	//회원정보 수정
	public int updateUser(
			@Param("id") int id
			, @Param("password")String password
			, @Param("name")String name
			, @Param("email")String email
			, @Param("phoneNumber")String phoneNumber
			, @Param("nickname")String nickname
			, @Param("imagePath") String imagePath);

	

	
	
}
