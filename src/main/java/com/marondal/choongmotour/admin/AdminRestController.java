package com.marondal.choongmotour.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.admin.bo.AdminBO;
import com.marondal.choongmotour.admin.model.Admin;
import com.marondal.choongmotour.admin.model.CertificationNumber;

@RestController
@RequestMapping("/admin")
public class AdminRestController {

	
	@Autowired AdminBO adminBO;
	
	
	//관리자 회원가입 api
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,@RequestParam("name") String name
			,@RequestParam("email") String email
			,@RequestParam("nickname") String nickname 
			, @RequestParam("certificationNumber") String certificationNumber
			){
		
		
		int count = adminBO.addAdmin(loginId, password, name, email, nickname, certificationNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		//관리자 인증번호 확인 api
		//인증번호 일치 여부 새로운 api를 만들필요없다고 함 기존의 api에서 애초에 인증번호를 전달받아서 그것이 일치 하는 여부를 따지고 그담에
		//일치하면 리턴진행하고 이런식으로 할것.
				
		//인증번호 일치 여부

		
		if(count == 0) {
			resultMap.put("result", "fail");
		} else {
			resultMap.put("result", "success");
		}
		
		return resultMap;
	
	}
	// 관리자 아이디 중복확인
	@GetMapping("/duplicate_id")
	@ResponseBody
	public Map<String, Boolean> duplicateCheck(@RequestParam String loginId){
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		boolean is_duplicate = adminBO.isDuplicate(loginId);
		
		if(is_duplicate) {
			resultMap.put("is_duplicate", true);
		} else {
			resultMap.put("is_duplicate", false);
		}
		
		
		return resultMap;
		
	}
	
	
	//관리자 로그인 api
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpSession session
			){
		
		Map<String, String> resultMap = new HashMap<>();
		
			Admin admin = adminBO.getAdmin(loginId, password);
		
			if(admin != null) {
				resultMap.put("result", "success");
				
				session.setAttribute("adminId", admin.getId());//여기도
				session.setAttribute("loginId", admin.getLoginId());
				session.setAttribute("adminName", admin.getName());//여기부분 필요한가 질문
				session.setAttribute("adminNickname", admin.getNickname());
				session.setAttribute("adminImagePath", admin.getImagePath());
		
			} else {
				resultMap.put("result", "fail");
			}
			
			return resultMap;
		
	}


	//아이디 찾기 api
	@PostMapping("/find_id")
	public Map <String, String> findId( @RequestParam("name") String name
										, @RequestParam("email") String email){

		Map<String, String> resultMap = new HashMap<>();
		
		Admin admin = adminBO.getAdminByNameEmail(name, email);//이것도 int 에서 admin으로 
		
		if(admin != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;	
		
	}
	
	
	
	//임시 비밀번호 발급 api (특정 비밀번호로 수정)
	@PostMapping("/temppassword")
	public Map <String, String> findPw(@RequestParam("loginId") String loginId
										, @RequestParam("password") String password
										, @RequestParam("email") String email){
		
		Map<String, String> resultMap = new HashMap<>();
		
		int count = adminBO.getPassword(loginId, password, email);
		
		if(count == 0) {
			resultMap.put("result", "fail");
		} else {
			resultMap.put("result", "success");
		}
		
		return resultMap;

	}
	
	
}
