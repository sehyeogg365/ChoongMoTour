package com.marondal.choongmotour.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signup/view")
	public String signupInput() {
		return "user/signup";
	}
	@GetMapping("/signin/view")
	public String signinInput() {
		return "user/signin";
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userNickname");
		session.removeAttribute("userImagePath");//로그인할때 세션 갑으로 불러오면 당연히 여기서도 있어야 한다 함
		
		return "redirect:/user/signin/view";
	
	
	
	}
	@GetMapping("/find_id_pw/view")
	public String findIdPw() {
		return "user/find_id_pw";
	}
	
	@GetMapping("/mypage/view")
	public String myPage() {
		return "user/mypage";
	}
	
	@GetMapping("/reservelist/view")
	public String reserveList() {
		return "user/reservelist";
	}
	
	
	
}
