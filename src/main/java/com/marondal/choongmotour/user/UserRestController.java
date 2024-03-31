package com.marondal.choongmotour.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
					//여기서 id 불러올까? 이미 있는데??
			session.setAttribute("userId", user.getId());//id, 네임, 닉네임, 이미지 값을 가져오기 위해 세션
			session.setAttribute("loginId", user.getLoginId());
			session.setAttribute("password", user.getPassword()); //비번도 불러와보자.
			session.setAttribute("userName", user.getName());
			session.setAttribute("userNickname", user.getNickname());
			session.setAttribute("userImagePath", user.getImagePath());//세션 값으로 불러오는것들을 최소화 할것 안그러면 서버 과부하가 오니 폰넘버, 이메일은 그 수정페이지에서만 사용하기에 그런건 db에서 불러오면 됨 
			
		} else {
			resultMap.put("result", "fail");
		}
			
		return resultMap;

	}

	// 아이디 찾기 api 이제보니 조회 서치에는 Get이맞다.
	@GetMapping("/find_id")
	public Map <String, Object> findId(	@RequestParam("loginId") String loginId
										, @RequestParam("name") String name
										, @RequestParam("email") String email
										){
										//여기선 굳이 세션 필요없을듯 하다.
		Map<String, Object> resultMap = new HashMap<>();
		
		User user = userBO.getUserByNameEmail(loginId, name, email);// 해당하는 이름, 이메일주소로 여러개 닉네임이 나올수 있어서 리스트로 함

		if(user != null) {
			resultMap.put("result", "success");//일치함
			resultMap.put("info", user);
	
			 // 여기서 id를 풋 하란뜻인데..
		} else {
			resultMap.put("result", "fail");//일치하지 않음
		}
		
		return resultMap;
		
	}
	
	// 임시 비밀번호 발급 api (특정 비밀번호로 수정)	
	@PostMapping("/temppassword")
	public Map <String, Object> passwordUpdate(@RequestParam("loginId") String loginId
										, @RequestParam("email") String email
										//, HttpSession session 세션은 만능이 아님. 무조건 세션 쓰지 말기.
										//비밀번호는 서버로부터 받아오는거기때문에 패스워드를 파라미터로 받는건 적합하지 못하다고 함 임시비밀번호는 그리고 매번 주기적으로 생성 해내야 한다고 함. 그 역할이 비오가 제일 적당함
										){
		
		Map<String, Object> resultMap = new HashMap<>();
		
		//String password = (String) session.getAttribute("password");//안되는 원인 한마디로 암호화된 값이 넘어오고있어서???
		
		String password = userBO.updateTemporrayPassword(loginId, email);// 이젠 count, 업데이트 횟수가 아닌 password를 불러와야 한다.
		
		if(password == null) {//패스워드가 없을시
			resultMap.put("result", "fail");
		} else {//그외에
			resultMap.put("result", "success");
			resultMap.put("info", password);
		}
	
		return resultMap;

	}
	
	// 사용자 회원정보 수정
	@PostMapping("/mypage")
	public Map <String, String> mypageUpdate(
			@RequestParam("id") int id // restcontroller에 추가했다고 비오,다오 이렇게 추가하는게 아닌 매퍼가 기준이 되야 한다는
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("nickname") String nickname
			, @RequestParam(value="file", required=false) MultipartFile file
			){
		
		Map<String, String> resultMap = new HashMap<>();
		
		int count = userBO.updateUser(id, password, name, email, phoneNumber, nickname, file);
	
		if(count == 1) {// 업데이트하는 행의 갯수 
			resultMap.put("result", "success");
			
		} else {
			resultMap.put("result", "fail");
		}
	
		return resultMap;
		
	}

	//2024-03-31 비밀번호 확인
	/*
	@GetMapping("/pw_check")
	public Map<String, String> confirmPassword(@RequestParam("password") String password
			  							       , HttpSession session){


		Map<String, String> resultMap = new HashMap<>();

		int id = (Integer)session.getAttribute("userId");

		int count = userBO.getPassword(id, password);
		if(count == 0) {// 업데이트하는 행의 갯수
			resultMap.put("result", "fail");

		} else {
			resultMap.put("result", "success");
		}

		return resultMap;
	}
	*/
	
	
}
