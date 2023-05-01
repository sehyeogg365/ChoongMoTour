package com.marondal.choongmotour.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.user.dao.UserDAO;
import com.marondal.choongmotour.user.model.User;
import com.marondal.choongmotour.common.EncryptService;
import com.marondal.choongmotour.common.FileManagerService;
import java.util.Random;
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

	// 임시 비밀번호 발급
	public int updateTemporrayPassword(String loginId, String email, String password) {
	
		//String password = new StringBuffer();
		
		//임시비밀번호 생성 알고리즘
		Random random = new Random();
		
		//int index = 0;
//		char[] charSet = new char[] {
//				 '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
//	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
//	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
//	                '!', '@', '#', '$', '%', '^', '&'
//				
//		};
		int[] arr = new int[6];
		int i = 0;
		
		while ( i < arr.length ) {
			
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
		
		return userDAO.updatePassword(loginId, email, ecryptPassword);
		
	}
	
	
	// 회원정보 한행 조회
	public User getUserInfo(int id) {//loginId->id로변경하기
		
		//String imagePath = FileManagerService.saveFile(0, file);
		
		
		return userDAO.selectUserInfo(id);
		
		
	}
	//딱 정리를 내리자면 조회는 id만 있어도 됨 수정은 다있어야 함 이거같음
	
	//회원정보 수정
	public int updateUser(
			int id//loginId빼보기
			, String password
			, String name
			, String email
			, String phoneNumber
			, String nickname
			, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(id, file);
		
		return userDAO.updateUser(id, password, name, email, phoneNumber, nickname, imagePath);
		
		
	}
	
	
}
