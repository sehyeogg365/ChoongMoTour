package com.marondal.choongmotour.lodging;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lodging")
public class LodgingController {

	
	@GetMapping("/main/view")
	public String mainPage() {
		return "lodging/main";
	}
	
	@GetMapping("/list/view")
	public String lodgingList() {
		return "lodging/list";
	}
	
	@GetMapping("/room/view")
	public String room() {
		return "lodging/room";
	}
	
	
	
	
}
