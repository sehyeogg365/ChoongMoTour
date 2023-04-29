package com.marondal.choongmotour.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.choongmotour.admin.bo.AdminBO;
import com.marondal.choongmotour.admin.model.Admin;
import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.Room;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminBO adminBO;
	
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
		//HttpServletRequest request
//		HttpSession session = request.getSession();
//		session.getAttribute("loginId");
//		session.getAttribute("password");
		
		
		return "admin/find_id_pw";
	}
	
	
	
	@GetMapping("/main/view")
	public String mainPage(Model model
			, HttpSession session) {
		
		int adminId = (Integer)session.getAttribute("adminId");
		
		List<Lodging> lodgingList = lodgingBO.getLodgingList(adminId);//
		model.addAttribute("lodgingList", lodgingList);
		
		return "admin/main";
	}
	
	@GetMapping("/mypage/view")
	public String myPage(Model model
						, @RequestParam("id") int id) {
		
		//그니까 이상하다 숙소수정 객실 수정도 컨트롤러서 이렇게 불렀는데 왜자꾸 400에러가뜰까
		Admin admin = adminBO.getAdminInfo(id);
		model.addAttribute("admin", admin);
		return "admin/mypage";
	}
	
	
	//관리자 페이지 입력,수정,삭제 기능 관리자페이지에서 진행되고 로징 기능이긴해도 아무래도 경로는 Lodging이아닌 Admin에다가 하는게 자연스러운듯
	
	@GetMapping("/lodging/create/view")
	public String lodgingcreatePage() {
		return "admin/lodgingcreate";
	}
	@GetMapping("/lodging/update/view")
	public String lodgingupdatePage(
			@RequestParam("id") int id
			,Model model) {
		
		
		
		Lodging lodging = lodgingBO.getLodging(id);
		
		model.addAttribute("lodging", lodging);//이거를 깜빡함 근데도 500에러가 뜬다.
		
		
		return "admin/lodgingupdate";
	}
	
	@GetMapping("/room/create/view")
	public String roomcreatePage(
			 @RequestParam("id") int id// 룸테이블 id
			
			, Model model) {//lodging 모델?
		
		Lodging lodging = lodgingBO.getLodging(id);
		
		model.addAttribute("lodging", lodging);
		
		return "admin/roomcreate";
	}
	
	
	@GetMapping("/room/update/view")
	public String roomupdatePage(
			@RequestParam("id") int id
			, Model model
			) {
											
		//그리고 Lodging id별, size 별 조회 해야하므로
		// LodgingId, room id 둘다 불러오게 하려면 room 객체에서 불러오는게 맞을듯.
//		
		Lodging lodging = lodgingBO.getLodging(id);
		
		model.addAttribute("lodging", lodging);
		
		List<Room> roomList = lodgingBO.getRoomList(id);//lodgingId
		//객체에 값이제대로 안들어갔다는뜻 디버깅 해보기.
		
		model.addAttribute("roomList", roomList);
		
		//원래이것도 getRoom이였다가 List조회가 맞는거같애서 이걸로바꿈
		//여기서는 저장한 불러와야 하므로 room 객체값을 불러오는게 맞긴하다.
		// 뭐하나 알아냄 여기 List 넣으니 아까500에러 어쩌구 뜬다.
		
		return "admin/roomupdate";
	}
	
	//숙소삭제는 안해도됨 경로가아녀서
	
	

}
