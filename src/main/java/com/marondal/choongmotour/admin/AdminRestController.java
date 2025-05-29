package com.marondal.choongmotour.admin;

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
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.admin.bo.AdminBO;
import com.marondal.choongmotour.admin.model.Admin;

@RestController
@RequestMapping("/admin")
public class AdminRestController {
	@Autowired AdminBO adminBO;

	// 관리자 회원가입 api
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
		
		// 관리자 인증번호 확인 api
		// 인증번호 일치 여부 새로운 api를 만들필요없다 기존의 api에서 애초에 인증번호를 전달받아서 그것이 일치 하는 여부를 따지고 그담에
		// 일치하면 리턴진행하고 이런식으로 할것.
				
		// 인증번호 일치 여부

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
	public Map<String, Boolean> duplicateCheck(@RequestParam("loginId") String loginId){//@RequestParam String loginId 이렇게 되있는거 발견함 이와중에
		Map<String, Boolean> resultMap = new HashMap<>();
		
		boolean is_duplicate = adminBO.isDuplicate(loginId);
		
		if(is_duplicate) {
			resultMap.put("is_duplicate", true);
		} else {
			resultMap.put("is_duplicate", false);
		}
		
		return resultMap;
	}
	
	// 관리자 로그인 api
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
				// 마이페이지 안들어가는원인이 세션에서 id 추가 안해서????
				session.setAttribute("adminId", admin.getId());// 여기도
				session.setAttribute("loginId", admin.getLoginId());
				session.setAttribute("password", admin.getPassword()); // 비번도 불러와보자.
				session.setAttribute("adminName", admin.getName());// 여기부분 필요한가 질문
				session.setAttribute("adminNickname", admin.getNickname());
				session.setAttribute("adminImagePath", admin.getImagePath());
			} else {
				resultMap.put("result", "fail");
			}
			
			return resultMap;
	}


	// 아이디 찾기 api
	@GetMapping("/find_id")
	public Map <String, Object> findId( @RequestParam("loginId") String loginId
										, @RequestParam("name") String name
										, @RequestParam("email") String email
										){
										// 여기선 굳이 세션 필요없을듯 하다.
		// 컨트롤러서 리스폰스 리퀘스트를 하고 파라미터로 필요한값 받아오고 리스폰스 요청보내는거
		// 우리가 reuslt success result fail 해서 원하는 값을 response 해주듯이 아이디 값도 마찬가지로 그렇게 한다고 어쩌구저쩌구..
		// 그외에 나머지 것들은 비오
		Map<String, Object> resultMap = new HashMap<>();
		
		Admin admin = adminBO.getAdminByNameEmail(loginId, name, email);//이것도 int 에서 admin으로 Admin에서 List로
		
		if(admin != null) {
			resultMap.put("result", "success");
			resultMap.put("info", admin);
			// 여기서 id를 풋 하란뜻인데..
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 비밀번호 찾기 및 임시 비밀번호 발급 api (특정 비밀번호로 수정)
	@PostMapping("/temppassword")
	public Map <String, Object> passwordUpdate(@RequestParam("loginId") String loginId
										, @RequestParam("email") String email
										//, HttpSession session
									//비밀번호는 서버로부터 받아오는거기때문에 패스워드를 파라미터로 받는건 적합하지 못하다 임시비밀번호는 그리고 매번 주기적으로 생성 해내야 함. 그 역할이 비오가 제일 적당함
										){
		Map<String, Object> resultMap = new HashMap<>();
		
		// String password = (String) session.getAttribute("password");
		String password= adminBO.updateTemporrayPassword(loginId, email);
		
		if(password == null) {
			resultMap.put("result", "fail");
		} else {
			resultMap.put("result", "success");
			resultMap.put("info", password);
		}
		// 여기서 아마 임시 비밀번호 발급을 해야하나? 모르겠다. 여기서 페일이냐 석세스냐 바탕으로 update 진행
		// 어차피 일치하지않으면 업데이트는 진행안된다.
		return resultMap;
	}
	
	
	// 관리자 회원정보수정
	@PostMapping("/mypage")
	public Map <String, String> mypageUpdate(
			@RequestParam("id") int id
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("nickname") String nickname
			, @RequestParam(value="file", required=false) MultipartFile file
			){
		Map<String, String> resultMap = new HashMap<>();
		
		int count = adminBO.updateAdmin(id, password, name, email, phoneNumber, nickname,  file);
		
		if(count == 1) {
			resultMap.put("result", "success");
			
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
}
