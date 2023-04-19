package com.marondal.choongmotour.lodging;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lodging")
public class LodgingController {

	//사용자페이지
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
	
	//관리자 페이지
	
	@GetMapping("/create/view")
	public String lodgingCreate() {
		return "admin/lodgingcreate";
	}
	
	
	@GetMapping("/room/create/view")
	public String roomCreate() {
		return "admin/roomcreate";
	}
	
	
	@GetMapping("/update/view")
	public String roomUpdate() {	
		return "admin/update";
	}
	
	
	
	
	
}
