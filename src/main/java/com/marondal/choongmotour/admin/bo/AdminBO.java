package com.marondal.choongmotour.admin.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.admin.dao.AdminDAO;
import com.marondal.choongmotour.common.EncryptService;

@Service
public class AdminBO {
	
	@Autowired AdminDAO adminDAO;
	
	public int addAdmin(
			String loginId
			, String password
			, String name
			, String email	
			, String nickname
			, String certificationNumber
			) {
		
		String encryptPassword = EncryptService.md5(password);
		
		//인증번호가 일치하는지 여부 확인 bo 서만 수행하면 된다고 하심
		
		int count = adminDAO.insertAdmin(loginId, encryptPassword, name, email, nickname);//실행된 행의갯수 리턴 일단 비오부터 완성하고 오기. 

		if(count == 0) {// 인증 번호일치 하지 않을때 
			return 0;
		} else {
			return adminDAO.insertAdmin(loginId, encryptPassword, name, email, nickname);
		}
		
		
		
		
		
	}
	
	public boolean isDuplicate(String loginId) {
		
		int count = adminDAO.selectCountloginId(loginId);
		
		if(count == 0) {//중복이 안될때
			return false;
		} else {//될때
			return true;
		}
		
	}
	
	


		
	
	
	
	
	
	
}
