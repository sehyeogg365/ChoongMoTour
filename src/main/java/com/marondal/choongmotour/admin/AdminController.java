package com.marondal.choongmotour.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.model.Lodging;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private LodgingBO lodgingBO;
	
	
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
		
		HttpSession session = request.getSession();
		session.removeAttribute("adminId");
		session.removeAttribute("adminNickname");
		session.removeAttribute("adminImagePath");
		
		
		return "redirect:/admin/signin/view";
		
	}
	
	
	@GetMapping("/find_id_pw/view")
	public String findIdPw() {
		return "admin/find_id_pw";
	}
	
	@GetMapping("/mypage/view")
	public String myPage(Model model) {
		return "admin/mypage";
	}
	
	@GetMapping("/main/view")
	public String mainPage(Model model
			, HttpSession session) {
		
		int id = (Integer)session.getAttribute("id");
		
		List<Lodging> lodgingList = lodgingBO.getLodgingList(id);//알고보니 이거 id로 안바꿔서 실수가 났나??
		model.addAttribute("lodgingList", lodgingList);
		
		return "admin/main";
	}
	
	//관리자 페이지 입력,수정,삭제 기능 관리자페이지에서 진행되고 로징 기능이긴해도 아무래도 경로는 Lodging이아닌 Admin에다가 하는게 자연스러운듯
	
	@GetMapping("/lodging/create/view")
	public String lodgingcreatePage() {
		return "admin/lodgingcreate";
	}
	@GetMapping("/lodging/update/view")
	public String lodgingupdatePage() {
		return "admin/lodgingupdate";
	}
	
	@GetMapping("/room/create/view")
	public String roomcreatePage() {
		return "admin/roomcreate";
	}
	
	
	
	@GetMapping("/dibspage/view")
	public String dibsPage() {
		return "admin/dibspage";
	}

}
