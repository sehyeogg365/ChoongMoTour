package com.marondal.choongmotour.lodging;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.marondal.choongmotour.lodging.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.comment.bo.CommentBO;
import com.marondal.choongmotour.lodging.dibs.bo.DibsBO;
import com.marondal.choongmotour.lodging.reserve.bo.ReserveBO;
import com.marondal.choongmotour.user.bo.UserBO;
import com.marondal.choongmotour.user.model.User;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	@Autowired
	private CommentBO commentBO;

	
	//사용자페이지 가만생각해보니 이것도 메인페이지인데 굳이 여기 있어야하나 혼란이든다.
	@GetMapping("/main/view")
	public String mainPage() {//지역 나타내기 및 id 
		
		
		
		// 생객해보니 매 페이지 마다 User객체를 할필요가없더라 ㅎㅎ.. 그래서 500에러가 뜨나보다.
		
		
		// 여기에 숙소 갯수를 써야 한다. 그리고 지역별로 해야 하는데 그거를 하나하나씩 해줘야 할것으로 보인다. 
		
		return "lodging/main";
	}
	//숙소리스트
	@GetMapping("/lodginglist/view")
	public String lodgingList(Model model
							  , LodgingDetail lodgingDetail
							  , @RequestParam("area_name")String areaName
							  , HttpSession session
							  ) {
		int userId = (Integer)session.getAttribute("userId"); //dibs detail 이랑 자꾸 헷갈려서 그런듯.

		String sortType = lodgingDetail.getSortType();

		List<LodgingDetail> lodgingList = lodgingBO.getLodgingListByArea(areaName, userId, lodgingDetail);

		model.addAttribute("lodgingList", lodgingList);

		
		//로징디테일로 싹다 갈고, 로징비오도 마찬가지
		
		//찜 찜취소 이것도 보여줘야 한다 이페이지에서.
		
		// 두개의 테이블을 융합해서 보여줘야함 로그인했을때 찜했는지 안했는지 여부, 지역별 숙소 리스팅
		// sns 프로젝트 와 매우 유사하다고 하심 그리고 이과정을 비오에서 하는게 적합함
		
		//여기에 댓글 숙소 갯수, 지역명도 쓰면 좋다.
		
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
		
		List<DibsDetail> dibsDetailList = dibsBO.getDibsList(userId, id);
		
		model.addAttribute("dibsDetailList", dibsDetailList);


		//로징리스트를 불러올일은 없다.
		
		User user = userBO.getUserInfo(id);
		
		model.addAttribute("user", user);
		
		return "lodging/dibspage";
		
		
	}
	
	
	//예약페이지 reserve 객체를 해야하나 모르겠다.
	@GetMapping("/reservation/view")
	public String reservePage(Model model
			, @RequestParam("roomId") int roomId
			, @RequestParam("lodgingId") int lodgingId//, @RequestParam("lodgingId") int lodgingId 이렇게 로징테이블에 만들고 아까 룸페이지에서 예약하기 버튼을누를때 roomid만이 파라미터로 가져감. 그럴땐 로징아이디까지 파라미터 추가시키기
			, HttpSession session
			) {
		// 이름, 전화번호, 숙소명, 객실명, 가격 이렇게 불러와야 한다.
		int userId = (Integer)session.getAttribute("userId");
		
//		애초에 리저브 디테일은 예약카드 정보고 이거는... 
		User user = userBO.getUserInfo(userId);//쿼리도 그렇고 여기도 딱히 큰문제는 없어보인다. 그렇다면 디버깅을통해서 값이 잘들어오는지 확인해보기
		
		model.addAttribute("user", user);// 디버깅후 f6 결과 user null이라 뜨고 id는 5라고 뜸 아마 로징아이디일거 같은데 그 잘못전달되고 있단 뜻.
		//좋아 여기 userId로 바꾸니 해결이 되었다. 전화번호 이름까진 나오는 상황
		
		//범인잡듯이 역추적으로 해보자면 화면상에 전화번호와 객실명, 가격등이 떠야 하는상황인데 안뜨고 있다. 그럼 ㄱ
		
		//여기서 세개의 테이블을 넣어야하는데 id로 만 값을 지칭하다보니 꼬인거 같다. 어떤값인 지도 모르고 제대로 지칭 해줘야 할듯 하면 세션 또는 파라미터로 불러와야할터.

		Lodging lodging = lodgingBO.getLodging(lodgingId);
		
		model.addAttribute("lodging", lodging);	
		//여기는 예약페이지니 절대 건드리지말기
		Room room = lodgingBO.getRoom(roomId);
		
		model.addAttribute("room", room);
		
		//여기가 비오를 호출하는곳 
		//생각해보면 예약페이지 한행 조회 이거를 쓸수가없다. 왜냐면 저장 자체를 안했는데. 
//	
		
		return "lodging/reservepage";
		
		
	}
	
	//예약목록
	//여기도 메인화면에서 내정보는 되는데, 찜에서 내정보, 예약에서 내정보는 안된다.
		// 아직 안불러와서 그런다 모델값
		@GetMapping("/reservelist/view")
		public String reserveList(Model model
				, HttpSession session ) {
			//조회는 userId, id만이 필요하다. 여기서 더 추가할것도 없음
			int userId = (Integer)session.getAttribute("userId");//null login문제 다시 로그인해 보니 다른 오류 비오 72번째줄 오류
			
			User user = userBO.getUserInfo(userId);//이것도 구분 짓기 쉽게 userId로 변경
			
			model.addAttribute("user", user);
			

			
			List<ReserveDetail> reserveDetailList = reserveBO.getReserveList(userId);//여기도 id->lodgingId수정 	
			//여기가 비오를 호출하는곳 
			model.addAttribute("reserveDetailList", reserveDetailList);
			//안쓰는 코드들도 지우길 추천 정말 자기가 배우거나, 재사용할 일이 있는게 아니고서야.
//			ReserveDetail reserveDetail = reserveBO.getReserveInfoById(userId);
//			
//			model.addAttribute("reserveDetail", reserveDetail);
			
			return "lodging/reservelist";
		}
	
	//댓글 작성 	
	@GetMapping("/commentwrite/view")
	public String commentWrite(Model model
							  , @RequestParam("lodgingId")int lodgingId
							  , @RequestParam("roomId") int roomId ) {
		Lodging lodging = lodgingBO.getLodging(lodgingId);
		
		model.addAttribute("lodging", lodging);	
		
		Room room = lodgingBO.getRoom(roomId);
		
		model.addAttribute("room", room);
		
		
		return "lodging/commentwrite";
		
		
	}
		
	
	//댓글목록
	@GetMapping("/commentlist/view")
	public String commentList(Model model
							, @RequestParam("lodgingId")int lodgingId
							//, HttpSession session
							) {
		PagingDTO pagingDTO = null;
		Lodging lodging = lodgingBO.getLodging(lodgingId);
		
		model.addAttribute("lodging", lodging);	
	
		//int userId = (Integer)session.getAttribute("userId");
		
		List<CommentDetail> commentDetailList = commentBO.getCommentList(lodgingId);
		
		model.addAttribute("commentDetailList", commentDetailList);

		Integer commentCount = commentBO.getCommentCount(lodgingId); //댓글 갯수, 평점
		model.addAttribute("commentCount", commentCount);
//
		Double avgStarPoint = commentBO.getStarPoint(lodgingId);
		model.addAttribute("avgStarPoint", avgStarPoint);
		
		return "lodging/commentlist";
	}


	
	
}
