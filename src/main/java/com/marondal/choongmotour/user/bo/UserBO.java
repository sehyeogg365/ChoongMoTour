package com.marondal.choongmotour.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.user.dao.UserDAO;
import com.marondal.choongmotour.user.model.User;
import com.marondal.choongmotour.admin.model.Admin;
import com.marondal.choongmotour.common.EncryptService;
import com.marondal.choongmotour.common.FileManagerService;

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
	public List<User> getUserByNameEmail(String name, String email) {
		
		return userDAO.selectUserByNameEmail(name, email);
	
	}
	
	// 비번 찾기 (임시 비밀번호 발급)
	public int getPasswordByIdEmail(String loginId, String email) {
		
		//이게 암호화가 안되서 비번이 바뀌어도 로그인이 안되었던것.
		
		return userDAO.selectPwByIdEmail(loginId, email);

	}
	
	// 임시 비밀번호 발급
	public int updateTemporrayPassword(String loginId, String email, String password) {
	
		String ecryptPassword = EncryptService.md5(password);
		
		return userDAO.updatePassword(loginId, email, ecryptPassword);
		
	}
	
	// 회원정보 조회
	public User getUserInfo(String loginId
			, String password
			, String name
			, String email
			, String phoneNumber
			, String nickname
			, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(0, file);
		
		return userDAO.selectUserInfo(loginId, password, name, email, phoneNumber, nickname, imagePath);
		
		
	}
	
	
	//회원정보 수정
	public int updateUser( String loginId
			, String password
			, String name
			, String email
			, String phoneNumber
			, String nickname
			, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(0, file);
		
		return userDAO.updateUser(loginId, password, name, email, phoneNumber, nickname, file);
		
		
	}
	
	
}
