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
import com.marondal.choongmotour.lodging.dibs.bo.DibsBO;
import com.marondal.choongmotour.lodging.model.DibsDetail;
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
	
	@Autowired
	private DibsBO dibsBO;
	
	//사용자페이지 가만생각해보니 이것도 메인페이지인데 굳이 여기 있어야하나 혼란이든다.
	@GetMapping("/main/view")
	public String mainPage() {//지역 나타내기 및 id 
		
		
		
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
		
//		List<Room> roomList = lodgingBO.getRoomList(lodgingId);
//		model.addAttribute("roomList", roomList);
		
		//여기서 room 객체도 아마 불러와 야할듯 보통 싱글룸의 가격이 명시되어있어서.
		
		return "lodging/lodginglist";
	}
	// 객실리스트
	@GetMapping("/room/view")
	public String room(Model model
						, @RequestParam("id") int id //설마 이것땜에 객실리스트 안들어가지나?
						) {

	
		//숙소 한행 , @RequestParam("id") int id
		Lodging lodging = lodgingBO.getLodging(id);
		
		model.addAttribute("lodging", lodging);		
		//객실리스트 싱글, 더블, 트윈
		List<Room> roomList = lodgingBO.getRoomListOrderByPrice(id);
		
		model.addAttribute("roomList", roomList);
		
		//모달창에 불러와야할 한행의 객실정보

		
		return "lodging/room";
	}
	
	
	//찜목록
	@GetMapping("/dibspage/view")
	public String dibsPage(Model model
						, int userId) {//이제보니 로징아이디가 필요한게 아니다 id, 즉 reserved_list의 id가 필요
		

		List<DibsDetail> dibsList = dibsBO.getDibsList(userId);
		model.addAttribute("dibsList", dibsList);
		
		
		
		return "lodging/dibspage";
		
		
	}
	
	
	//예약페이지 reserve 객체를 해야하나 모르겠다.
	@GetMapping("/reservation/view")
	public String reservePage(Model model
			, int id
			, int lodgingId

			) {
		
		Lodging lodging = lodgingBO.getLodging(id);
		model.addAttribute("lodging", lodging);
		
		Room room = lodgingBO.getRoom(id);
		model.addAttribute("room", room);
		
		User user = userBO.getUserInfo(id);
		model.addAttribute("user", user);
		
		return "lodging/reservepage";
		
		
	}
	
	//예약목록
	@GetMapping("/reservelist/view")
	public String reserveListPage() {
		
		
		return "lodging/reservelist";
		
		
	}
	
	
	
	

	
	
	
	
	
}
