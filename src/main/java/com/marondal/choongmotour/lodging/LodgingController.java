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
import com.marondal.choongmotour.lodging.model.Reserve;
import com.marondal.choongmotour.lodging.model.ReserveDetail;
import com.marondal.choongmotour.lodging.model.Room;
import com.marondal.choongmotour.lodging.reserve.bo.ReserveBO;
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
	
	@Autowired
	private ReserveBO reserveBO;

	
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
							  , HttpSession session
							 // , @RequestParam("id") int id
							  ) {
		
		int userId = (Integer)session.getAttribute("userId"); //dibs detail 이랑 자꾸 헷갈려서 그런듯.
		
		List<LodgingDetail> lodgingList = lodgingBO.getLodgingListByArea(areaName, userId);
		
		model.addAttribute("lodgingList", lodgingList);
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
		
		
		//날짜 모달창 
		
		
		
		
		return "lodging/room";
	}
	
	
	//찜목록
	@GetMapping("/dibspage/view")
	public String dibsPage(Model model	
						   , @RequestParam("id") int id //여기도 리퀘스트 파람 안해줬다.
						   , HttpSession session
			) {//찜은 lodgingId별로 한다 그렇다면.. 찜목록 조회는??
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<DibsDetail> dibsDetailList = dibsBO.getDibsList(userId, id);
		
		model.addAttribute("dibsDetailList", dibsDetailList);

		List<Lodging> lodgingList = lodgingBO.getLodgingList(id);
		
		model.addAttribute("lodgingList", lodgingList);
		
		User user = userBO.getUserInfo(id);
		
		model.addAttribute("user", user);
		
		return "lodging/dibspage";
		
		
	}
	
	
	//예약페이지 reserve 객체를 해야하나 모르겠다.
	@GetMapping("/reservation/view")
	public String reservePage(Model model
			, @RequestParam("id") int id
			//, @RequestParam("lodgingId") int lodgingId // 여기도 리퀘스트 파람을 안해줘서 생기는 500오류
			, int userId
			, HttpSession session
			) {
		

//		애초에 리저브 디테일은 예약카드 정보고 이거는... 
		User user = userBO.getUserInfo(id);
		
		model.addAttribute("user", user);
		
		Lodging lodging = lodgingBO.getLodging(id);
		
		model.addAttribute("lodging", lodging);	
		
		Room room = lodgingBO.getRoom(id);
		
		model.addAttribute("room", room);
		
		ReserveDetail reserveDeatil = reserveBO.getReserveInfoById(id, userId);
		
		model.addAttribute("reserveDeatil", reserveDeatil);
		
		return "lodging/reservepage";
		
		
	}
	
	//예약목록
	//여기도 메인화면에서 내정보는 되는데, 찜에서 내정보, 예약에서 내정보는 안된다.
		// 아직 안불러와서 그런다 모델값
		@GetMapping("/reservelist/view")
		public String reserveList(Model model
				, @RequestParam("id") int id
				, HttpSession session) {
			
			int userId = (Integer)session.getAttribute("userId");
			
			User user = userBO.getUserInfo(id);
			
			model.addAttribute("user", user);
			
			Lodging lodging = lodgingBO.getLodging(id);
			
			model.addAttribute("lodging", lodging);	
			
			Room room = lodgingBO.getRoom(id);
			
			model.addAttribute("room", room);
			
			ReserveDetail reserveDetail = reserveBO.getReserveInfoById(userId, id);
			
			model.addAttribute("reserveDeatil", reserveDetail);			
			
			return "lodging/reservelist";
		}
	
	
	//댓글목록
		
	@GetMapping("/commentlist/view")
	public String commentList(Model model
							, int id) {
		Lodging lodging = lodgingBO.getLodging(id);
		
		model.addAttribute("lodging", lodging);		
		//객실리스트 싱글, 더블, 트윈
		List<Room> roomList = lodgingBO.getRoomListOrderByPrice(id);
		
		model.addAttribute("roomList", roomList);
		return "lodging/commentlist";
	}
	

	
	
	
	
	
}
