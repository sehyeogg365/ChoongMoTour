package com.marondal.choongmotour.admin.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.admin.dao.AdminDAO;
import com.marondal.choongmotour.admin.model.Admin;
import com.marondal.choongmotour.common.EncryptService;
import com.marondal.choongmotour.lodging.model.Lodging;

@Service
public class AdminBO {
	
	@Autowired AdminDAO adminDAO;
	//관리자 페이지긴 해도 숙소에 대한 테이블, 숙소에 대한 기능으로 생각해볼것.
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
		
		int count = adminDAO.selectcertificationNumber(certificationNumber);//실행된 행의갯수 리턴 일단 비오부터 완성하고 오기. 

		if(count == 0) {// 인증 번호일치 하지 않을때 이 조건문은 잘썼으나 인증번호 기반으로 되는게 없다고 하고 마찬가지로 인증번호 조회해서 맞는지 확인하는 쿼리문도 만들기
			return 0;
		} else {
			//return adminDAO.selectcertificationNumber(certificationNumber);//인서트 안되는 이유 매퍼에는 문제가 없었다. 인서트는 안하고 계속 인증번호만 확인하고 있는게 보인다.
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
	
	public Admin getAdmin(String loginId, String password) {
		
		String ecryptPassword = EncryptService.md5(password);
		
		return adminDAO.selectAdmin(loginId, ecryptPassword);
		
	}
	
	//아이디 찾기
	public boolean getId(String name, String email) {
		
		int count = adminDAO.selectId(name, email);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	
	// 비번 찾기 (임시 비밀번호 발급)
	public boolean getPassword(String loginId, String password, String email) {
		
		int count = adminDAO.updatePw(loginId, password, email);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	
	
	
	
	
}
