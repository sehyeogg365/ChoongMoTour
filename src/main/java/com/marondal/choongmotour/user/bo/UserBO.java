package com.marondal.choongmotour.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.user.dao.UserDAO;
import com.marondal.choongmotour.user.model.User;
import com.marondal.choongmotour.common.EncryptService;

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
			, String nickname
			) {
		//비밀번호 암호화 
		String encryptPassword= EncryptService.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email, nickname);
		
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

	//로그인 api
	public User getUser(String loginId, String password) {//모델객체 불러오는것.
		
		//비밀번호 암호화
		String ecryptPassword = EncryptService.md5(password);
		
		return userDAO.selectUser(loginId, ecryptPassword);
	
	}
	
	//아이디 찾기
	public boolean getId(String lodginId, String name, String email) {
		
		int count = userDAO.selectId(lodginId, name, email);
	
		if(count == 0) {
			return false;
		} else {
			return true;
		}

	}
	
	
	// 비번 찾기 (임시 비밀번호 발급)
	public boolean getPassword(String loginId, String password, String email) {
		
		int count = userDAO.updatePw(loginId, password, email);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}

	}
	
	
}
