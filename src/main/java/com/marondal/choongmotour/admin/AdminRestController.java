package com.marondal.choongmotour.admin;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminRestController {

	
	@PostMapping("/signup")
	public Map<String, String> signup(){
		return null;
		
		
	}
}
