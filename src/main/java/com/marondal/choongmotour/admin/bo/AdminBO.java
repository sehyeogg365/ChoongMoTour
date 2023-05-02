package com.marondal.choongmotour.admin.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.admin.dao.AdminDAO;
import com.marondal.choongmotour.admin.model.Admin;
import com.marondal.choongmotour.common.EncryptService;
import com.marondal.choongmotour.common.FileManagerService;
import java.util.Random;
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
	
	//로그인
	public Admin getAdmin(String loginId, String password) {
		
		String ecryptPassword = EncryptService.md5(password);
		
		return adminDAO.selectAdmin(loginId, ecryptPassword);
		
	}
	
	

	// 관리자 리스트
	
	public List<Admin> getAdminList(String loginId) {
		
		
		return adminDAO.selectAdminList(loginId);
		
	}
	
	//아이디 찾기
	public List<Admin> getAdminByNameEmail(String name, String email) {//이것도 리턴타입 int 에서 Admin으로 변경

		return adminDAO.selectAdminByNameEmail(name, email);
	
	}
	
	
	// 비번 찾기 (임시 비밀번호 발급) 이거를 구분하지말고 한번에 하라 함. 

	//임시 비밀번호 발급
	public int updateTemporrayPassword(String loginId, String email, String password) {//이것도 로그인 아이디 이메일 추가 할것 다오도.
		
		
		//임시비밀번호 생성 알고리즘
		Random random = new Random();
		
		
//		char[] charSet = new char[] {
//				 '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
//	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
//	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
//	                '!', '@', '#', '$', '%', '^', '&'
//				
//		};
		
		int[] arr = new int[6];
		
		int i = 0;
		
		while ( i < arr.length) {
			
			int rNum = random.nextInt(10) + 1;
			int check = 1;
			int j = 0; 
			
			while( j < i ) {
				if (rNum ==arr[j]) {
					check = -1;
				}
				j++;
			}
			
			if(check == 1) {
				arr[i] = rNum;
				i++;
			}
			
		}
		
		for (int j = 0; j < arr.length; j++) {
			password += arr[j];
		}
		
		String ecryptPassword = EncryptService.md5(password);//이게 암호화가 안되서 비번이 바뀌어도 로그인이 안되었던것.
		
		return adminDAO.updatePassword(loginId, email, ecryptPassword);
		
		
	}
	
	//관리자 회원정보 조회 한행조회
	public Admin getAdminInfo(int id) {
		return adminDAO.selectAdminInfo(id);
	}
	//딱 정리를 내리자면 조회는 id만 있어도 됨 수정은 다있어야 함 이거같음
	
	//관리자 회원정보 수정
	public int updateAdmin( 
			int id
			, String password
			, String name
			, String email
			, String phoneNumber
			, String nickname
			, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(id, file);
		
		String ecryptPassword = EncryptService.md5(password);
		
		return adminDAO.updateAdmin(id, ecryptPassword, name, email, phoneNumber, nickname, imagePath);
		
		
	}
	
	
}
