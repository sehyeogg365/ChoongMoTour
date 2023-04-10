package com.marondal.choongmotour.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

	@ResponseBody
	@GetMapping("/hello")
	public String helloWorld() {
		
		return "Hello World!!";
	}

	@GetMapping("/hello/jsp")
	public String helloJsp() {
		return "hello";
	}

}
