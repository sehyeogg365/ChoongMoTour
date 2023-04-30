package com.marondal.choongmotour.lodging;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.Room;
import com.marondal.choongmotour.user.bo.UserBO;
import com.marondal.choongmotour.user.model.User;

@Controller
@RequestMapping("/lodging")
public class LodgingController {

	@Autowired
	private LodgingBO lodgingBO;
	
	@Autowired
	private UserBO userBO;
	
	//사용자페이지 가만생각해보니 이것도 메인페이지인데 굳이 여기 있어야하나 혼란이든다.
	@GetMapping("/main/view")
	public String mainPage(Model model) {//지역 나타내기 및 id 
		
		
		
		// 생객해보니 매 페이지 마다 User객체를 할필요가없더라 ㅎㅎ.. 그래서 500에러가 뜨나보다.
		return "lodging/main";
	}
	//숙소리스트
	@GetMapping("/lodginglist/view")
	public String lodgingList(Model model
			,  @RequestParam("area_name")String areaName
			
			) {

		
		List<Lodging> lodgingList = lodgingBO.getLodgingListByArea(areaName);
		model.addAttribute("lodgingList", lodgingList);
		
		//이거를 이제 지역별 리스팅 비오 만들어야 함 ㅇㅇ. 
		
		return "lodging/lodginglist";
	}
	// 객실리스트
	@GetMapping("/room/view")
	public String room(Model model
						, @RequestParam("lodgingId") int lodgingId
						) {

	
		//숙소 한행 , @RequestParam("id") int id
//		Lodging lodging = lodgingBO.getLodging(id);
		
//		model.addAttribute("lodging", lodging);
		
		List<Room> roomList = lodgingBO.getRoomListByLodgingId(lodgingId);
		
		model.addAttribute("roomList", roomList);
		
		return "lodging/room";
	}
	
	//관리자 페이지 입력,수정,삭제 기능 관리자페이지에서 진행되고 로징 기능이긴해도 아무래도 경로는 Lodging이아닌 Admin에다가 하는게 자연스러운듯
	

	
	
	
	
	
}
