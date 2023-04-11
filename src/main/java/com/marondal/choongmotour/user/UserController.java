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
		
		return "redirect:/user/signin/view";
	
	
	
	}
	
	
	@GetMapping("/find_id_pw/view")
	public String findIdPw() {
		return "user/find_id_pw";
	}
	
}
