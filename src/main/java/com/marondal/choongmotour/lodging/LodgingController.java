package com.marondal.choongmotour.lodging;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.model.Lodging;

@Controller
@RequestMapping("/lodging")
public class LodgingController {

	@Autowired
	private LodgingBO lodgingBO;
	
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
	
	//관리자 페이지 입력,수정,삭제 기능 관리자페이지에서 진행되고 로징 기능이긴해도 아무래도 경로는 Lodging이아닌 Admin에다가 하는게 자연스러운듯
	

	
	
	
	
	
}
