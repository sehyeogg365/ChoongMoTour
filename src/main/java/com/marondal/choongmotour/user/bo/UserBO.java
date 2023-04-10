package com.marondal.choongmotour.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	//회원가입 api 
	public int addUser(
			String loginId
			, String password
			, String name
			, String email
			, String phoneNumber
			, String nickname
			, String imagePath
			) {
		
		//String encryptPassword= EncryptService.md5(password);
		
		return userDAO.insertUser(loginId, password, name, email, phoneNumber, nickname, imagePath);
		
	}
	
	//중복 여부 api
	public boolean isDuplicate(String loginId) {
		
		int count = userDAO.selectCountloginId(loginId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	//비밀번호 암호화  ecrypt 나중에 까먹지 말것. 
	
	//로그인 api
	public int getUser() {
		
		
	}
	
}
