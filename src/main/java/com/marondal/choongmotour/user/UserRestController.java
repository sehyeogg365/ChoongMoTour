package com.marondal.choongmotour.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.marondal.choongmotour.user.bo.UserBO;
import com.marondal.choongmotour.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	

	@PostMapping("/signup")
		public Map<String, String> signup(
				@RequestParam("loginId") String loginId
				,@RequestParam("password") String password
				,@RequestParam("name") String name
				,@RequestParam("email") String email
				,@RequestParam("nickname") String nickname
	
				) {
		
		int count = userBO.addUser(loginId, password, name, email, nickname);
		
		Map<String, String> resultMap = new HashMap<>();
		
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
		
		
	}
	
	@GetMapping("/duplicate_id")
	@ResponseBody
	public Map<String, Boolean> duplicateCheck(@RequestParam("loginId") String loginId) {
		
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		boolean isDuplicate = userBO.isDuplicate(loginId);
		
		if(isDuplicate) {
			resultMap.put("is_duplicate", true);//중복됨
		} else {
			resultMap.put("is_duplicate", false);//중복안됨
		}
		
		return resultMap;
		
		
		
	}
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpSession session//id, 네임, 닉네임 값을 가져오기 위해 세션
			) {
		
		Map<String, String> resultMap = new HashMap<>();
		
		User user = userBO.getUser(loginId, password);
		
		if(user != null) {
			resultMap.put("result", "success");
			
			session.setAttribute("userId", user.getId());//id, 네임, 닉네임, 이미지 값을 가져오기 위해 세션
			session.setAttribute("loginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userNickname", user.getNickname());
			session.setAttribute("userImagePath", user.getImagePath());//세션 값으로 불러오는것들을 최소화 할것 안그러면 서버 과부하가 오니 폰넘버, 이메일은 그 수정페이지에서만 사용하기에 그런건 db에서 불러오면 됨 
			
		} else {
			resultMap.put("result", "fail");
		}
		
		
		
		return resultMap;
		

	}

	//아이디 비번 찾기 api
	@PostMapping("/find_id")
	public Map <String, Boolean> findId(@RequestParam("loginId") String loginId
										, @RequestParam("name") String name
										, @RequestParam("email") String email
										){
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		boolean isCorrect = userBO.getId(loginId, name, email);
		
		if(isCorrect) {
			resultMap.put("is_correct", true);//일치함
		} else {
			resultMap.put("is_correct", false);//일치하지 않음
		}
		
		return resultMap;
		
	}
	
	//임시 비밀번호 발급 api (특정 비밀번호로 수정)
	
	@PostMapping("/temppassword")
	public Map <String, Boolean> findPw(@RequestParam("loginId") String loginId
										, @RequestParam("password") String password
										, @RequestParam("email") String email){
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		boolean isCorrect = userBO.getPassword(loginId, password, email);
		
		if(isCorrect) {
			resultMap.put("is_correct", true);
		} else {
			resultMap.put("is_correct", false);
		}
	
		return resultMap;

	}
	
	
//	@PostMapping("/mypage")
//	public Map <String, String> mypageUpdate(){
//		
//	}
	
	
}
