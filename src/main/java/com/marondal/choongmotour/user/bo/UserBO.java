package com.marondal.choongmotour.user.bo;

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

	// 회원가입 api
	public int addUser(String loginId, String password, String name, String email, String nickname) {
		// 비밀번호 암호화
		String encryptPassword = EncryptService.md5(password);

		return userDAO.insertUser(loginId, encryptPassword, name, email, nickname);
	}

	// 중복 여부 api
	public boolean isDuplicate(String loginId) {

		int count = userDAO.selectCountloginId(loginId);

		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	// 로그인 api
	public User getUser(String loginId, String password) {// 모델객체 불러오는것.

		// 비밀번호 암호화
		String ecryptPassword = EncryptService.md5(password);

		return userDAO.selectUser(loginId, ecryptPassword);
	}

	// 아이디 찾기
	public User getUserByNameEmail(String loginId, String name, String email) {

		return userDAO.selectUserByNameEmail(loginId, name, email);
	}

	// 비밀번호 어차피 암호화되있어서 조회는 무의미하다 보면된다고 한다.

	// 임시 비밀번호 발급 및 암호화
	public String updateTemporrayPassword(String loginId, String email) {
		// 아예 리턴타입을 스트링으로 바꿔버린다. 업데이트 횟수가 아닌 바꾼 비밀번호를 보내야 하므로.
		// 마찬가지로 비밀번호가 파라미터로 들어갈 이유가 없음 원래 비밀번호를 알 필요가 없어서.

		// 임시비밀번호 생성 알고리즘

		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', };

		Random random = new Random();

		String password = ""; // 대신에 여기에 생성
		for (int i = 0; i < 100; i++) {

			int rNum = random.nextInt(charSet.length);

			char shuffle = charSet[0];
			charSet[0] = charSet[rNum];
			charSet[rNum] = (char) shuffle;
		}

		for (int i = 0; i < charSet.length; i++) {
			password = charSet[i] + password;// 문자열을 이어붙이는 형식
		}

		String ecryptPassword = EncryptService.md5(password);// 이게 암호화가 안되서 비번이 바뀌어도 로그인이 안되었던것.

		int count = userDAO.updatePassword(loginId, email, ecryptPassword);

		if (count == 1) {// 횟수 1 정상일때 password 리턴
			return password;
		} else {
			return null; // 비정상일땐 null 리턴
		}
	}

	// 회원정보 한행 조회
	public User getUserInfo(int id) {// loginId->id로변경하기

		return userDAO.selectUserInfo(id);
	}
	// 딱 정리를 내리자면 조회는 id만 있어도 됨 수정은 다있어야 함 이거같음

	// 회원정보 수정
	public int updateUser(int id// loginId빼보기
			, String password, String name, String email, String phoneNumber, String nickname, MultipartFile file) {

		String imagePath = FileManagerService.saveFile(id, file);

		String ecryptPassword = EncryptService.md5(password);

		return userDAO.updateUser(id, ecryptPassword, name, email, phoneNumber, nickname, imagePath);
	}

	//2024-03-31 비밀번호 확인
	/*
	public int getPassword(int id, String password){

		String ecryptPassword = EncryptService.md5(password);

		return userDAO.selectPassword(id, ecryptPassword);

	}
	*/

}
