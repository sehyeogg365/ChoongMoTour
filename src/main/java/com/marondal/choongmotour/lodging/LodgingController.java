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
import com.marondal.choongmotour.lodging.model.LodgingDetail;
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
							  , @RequestParam("area_name")String areaName
							  , @RequestParam("id") int id
							  ) {
		
		//int userId = (Integer)session.getAttribute("userId"); dibs detail 이랑 자꾸 헷갈려서 그런듯.
		
		List<LodgingDetail> lodgingDetailList = lodgingBO.getLodgingListByArea(areaName, id);
		
		model.addAttribute("lodgingDetailList", lodgingDetailList);
		//로징디테일로 싹다 갈고, 로징비오도 마찬가지
		
		//찜 찜취소 이것도 보여줘야 한다 이페이지에서.
		
		// 두개의 테이블을 융합해서 보여줘야함 로그인했을때 찜했는지 안했는지 여부, 지역별 숙소 리스팅
		// sns 프로젝트 와 매우 유사하다고 하심 그리고 이과정을 비오에서 하는게 적합함
		
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
		

		
		return "lodging/room";
	}
	
	
	//찜목록
	@GetMapping("/dibspage/view")
	public String dibsPage(Model model
						   , @RequestParam("id") int id //여기도 리퀘스트 파람 안해줬다.
						   , HttpSession session
						   ) {//찜은 lodgingId별로 한다 그렇다면.. 찜목록 조회는??
		int userId = (Integer)session.getAttribute("userId");
		
		List<DibsDetail> dibsList = dibsBO.getDibsList(id, userId);
		
		model.addAttribute("dibsList", dibsList);
		//밑에건 좀 잘 모르겠다 이렇게 막껴도 되는지??
//		User user = userBO.getUserInfo(id);
//		model.addAttribute("user", user);
		
		
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
