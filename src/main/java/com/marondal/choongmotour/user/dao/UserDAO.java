package com.marondal.choongmotour.user.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
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
	
	// 사용자 리스트
	
	// 사용자 조회(아이디찾기)
	public User selectUserByNameEmail( @Param("loginId")String loginId
										, @Param("name") String name 
										, @Param("email") String email);
	
	// 임시비밀번호 발급
	public int updatePassword(@Param("loginId")String loginId
							, @Param("email") String email
							, @Param("password") String password);
	
	
	
	// 회원정보 한행 조회
	public User selectUserInfo(@Param("id") int id);
	
	// 회원정보 수정
	public int updateUser(
			@Param("id") int id
			, @Param("password")String password
			, @Param("name")String name
			, @Param("email")String email
			, @Param("phoneNumber")String phoneNumber
			, @Param("nickname")String nickname
			, @Param("imagePath") String imagePath);

	
}
