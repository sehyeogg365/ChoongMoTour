package com.marondal.choongmotour.user;

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
	public String signout() {
		return "user/signout";
	}
	
	
	@GetMapping("/find_id_pw/view")
	public String findIdPw() {
		return "user/find_id_pw";
	}
	
}
