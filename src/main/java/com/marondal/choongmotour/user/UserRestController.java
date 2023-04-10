package com.marondal.choongmotour.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.marondal.choongmotour.user.bo.UserBO;

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
				,@RequestParam("phoneNumber") String phoneNumber
				,@RequestParam("nickname") String nickname
				,@RequestParam("imagePath") String imagePath
				
				) {
		
		int count = userBO.addUser(loginId, password, name, email, phoneNumber, nickname, imagePath);
		
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
//	@PostMapping("/signin")
//	public Map<String, String> signin(
//			
//			) {
//	
//	
//	
//	}
//	
//	@PostMapping("find_id_pw")
//	public Map <String, String> findIdPw(){
//		
//	}
	
	
	
}
