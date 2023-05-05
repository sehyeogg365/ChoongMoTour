package com.marondal.choongmotour.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.marondal.choongmotour.user.bo.UserBO;
import com.marondal.choongmotour.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserBO userBO;
	
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
		session.removeAttribute("userImagePath");//로그인할때 세션 갑으로 불러오면 당연히 여기서도 있어야 한다 함
		
		return "redirect:/user/signin/view";
	
	
	
	}
	@GetMapping("/find_id_pw/view")
	public String findIdPw() {

		return "user/find_id_pw";
	}
	


	
	@GetMapping("/mypage/view")//숙소 수정 잘 참조 해보기
	public String myPage(Model model
						, @RequestParam("id") int id				

						) {
		
		User user = userBO.getUserInfo(id);
		
		model.addAttribute("user", user);
				
		return "user/mypage";
	}
	
	@GetMapping("/reservepage/view")
	public String reservePage(Model model
			, @RequestParam("id") int id) {
		User user = userBO.getUserInfo(id);
		
		model.addAttribute("user", user);
		return "user/reservepage";
	}
	
	

	
	
	
}
