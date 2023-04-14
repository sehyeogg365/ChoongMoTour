package com.marondal.choongmotour.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/signup/view")
	public String signupInput() {
		
		return "/admin/signup";
		
	}

	@GetMapping("/signin/view")
	public String signinInput() {
		
		return "/admin/signin";
		
	}
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		
		return "";
		
	}

}
