package com.marondal.choongmotour.lodging.bo;

import java.util.ArrayList;
import java.util.List;


import com.marondal.choongmotour.lodging.comment.dao.CommentDAO;
import com.marondal.choongmotour.lodging.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.common.FileManagerService;
import com.marondal.choongmotour.lodging.dao.LodgingDAO;
import com.marondal.choongmotour.lodging.dibs.bo.DibsCheckBO;

import com.marondal.choongmotour.user.bo.UserBO;



@Service
public class LodgingBO {

	@Autowired 
	private LodgingDAO lodgingDAO;//private 추가
	
	@Autowired 
	private UserBO userBO;
	
	//순환참조 문제 때문에 새로운 비오를 따로 하나 만듦
	
	@Autowired 
	private DibsCheckBO dibsCheckBO;

	@Autowired
	private CommentDAO commentDAO;
	//사용자페이지

	//lodging 정보 - 지역 불러오기??
	
	//숙소리스트 지역별로 보여주면서 로그인 했을시 찜했는지 안했는지 여부까지 나타내야 함
	public List<LodgingDetail> getLodgingListByArea(String areaName, int userId, String sortType, LodgingDetail lodgingDetail){
		
		List<LodgingDetail> lodgingList = lodgingDAO.selectLodgingListByArea(areaName, lodgingDetail.getSortType());
		
		List<LodgingDetail> lodgingDetailList = new ArrayList<>();
		
		for(LodgingDetail lodging:lodgingList) {
			
			//숙소카드 한장에 유저정보가 들어갈일은 없다.

			boolean isDibs = dibsCheckBO.isDibs(userId, lodging.getId());
			//이거와 관련된 비오 하나를 차라리 더 팔것.
			//댓글갯수,평점,가격, 정렬 방식 비오를 파기,
			lodgingDetail = new LodgingDetail(); // 이것을 반복문 밖에 파라미터로 선언 하면 자꾸 같은 숙소가 나옴
			CommentDetail commentDetail = new CommentDetail();
			Integer commentCount = commentDAO.selectCommentCount(lodging.getId());// 댓글 갯수 이두개를 lodgingId로 변경?
			Double starPoint = commentDAO.selectStarPoint(lodging.getId());//댓글 평점

			Room room = new Room();
			List<Room> roomList  = lodgingDAO.selectRoomListOrderByPrice(lodging.getId());//객실 정보 불러오기

			Integer price = 0;

			//객실 정보가 있을때
			if(roomList != null && !roomList.isEmpty()){
				price = roomList.get(0).getPrice(); // 첫번째요소인 싱글룸 가격
			} else {
				System.out.println("Lodging ID: " + lodging.getId());
			}

			if (commentCount == null) {
				lodging.setCommentCount(0);
			} else {
				lodging.setCommentCount(commentCount);
			}

			if (starPoint == null) {
				lodging.setAvgStarPoint(0.0);
			} else {
				lodging.setAvgStarPoint(starPoint);
			}

			//lodgingDetail = new LodgingDetail(); // 이것을 반복문 밖에 파라미터로 선언 하면 자꾸 같은 숙소가 나옴
			
			//현재 뜨는 500에러 여기서 로징아이디가 안불러와지고 있단뜻인듯.
			
			//그 숙소리스팅에 들어갈 것들.
			lodgingDetail.setId(lodging.getId());//로징아이디
			lodgingDetail.setRoomName(lodging.getRoomName());// 숙소명
			lodgingDetail.setAreaName(lodging.getAreaName()); // 지역명
			lodgingDetail.setLevel(lodging.getLevel());//성급
			lodgingDetail.setImagePath(lodging.getImagePath());// 숙소 사진
			lodgingDetail.setDibs(isDibs);// 찜여부
			//로징아이디 로징 룸네임 성급이미지 그리고찜여부
			//여기서 dto로 댓글갯수,평점,가격, 정렬 타입 추가
			lodgingDetail.setCommentCount(lodging.getCommentCount());
			lodgingDetail.setAvgStarPoint(lodging.getAvgStarPoint());
			lodgingDetail.setSingleRoomPrice(price);
			lodgingDetail.setSortType(sortType);
			//nullpointException이 뜬다. 여 값이 널값이란뜻 왜 널일까
			
			lodgingDetailList.add(lodgingDetail);
		}

		return lodgingDetailList;
		
	}

	// 객체 리스트 로징아이디별, 가격별
	public List<Room> getRoomListOrderByPrice(int lodgingId){

		return lodgingDAO.selectRoomListOrderByPrice(lodgingId);

	}

	// 예약목록 userId별로
	
	//숙소 개수
	
	//-------관리자 페이지---------
	
	
	// 숙소 추가
	public int addLodging(int adminId, String roomName, String level, String areaName, MultipartFile file ) {
			
		String imagePath = FileManagerService.saveFile(adminId, file);	//파일매니저 서비스 메소드의 id값은 사용자가 쓸값 그값을쓰는이유는 폴더별로 중복되지마라고 그렇게 한거임 따라서 여기서는 adminId로 저장했을때 별문제 안되면 써도 된다.
		
		return lodgingDAO.insertLodging(adminId, roomName, level, areaName, imagePath);
									//bo 에서 필요해서 호출한 adminId가 dao에서는 필요가없으므로 뺀다. 금욜날 이거를 말한거였음
	}								//파일매니저서도 파일을 중복되지않게 저장하기위해 adminId가 당연히 필요한것.
									// 모호하게 전에서 이걸 써서 이게 필요할것이다 라는 생각이 들게됨 근데 명확하게 해야함개발은 쓸때 쓰고 뺄땐빼고 이래야 함.
	// 숙소 리스트
	
	public List<Lodging> getLodgingList(int id) {
			
		return lodgingDAO.selectLodgingList(id);

	}
	
	// 숙소 한행 불러오기
	public Lodging getLodging(int id) {
		return lodgingDAO.selectLodgingById(id);
	}
	
	// 숙소 수정
	public int updateLodging(int id, String roomName, String level, String areaName) {
							//update에 꼭 필요한값만 넣어야 한다고 판단 추가메서드에서도 꼭 adminId를 넣어야만 하는지 검토해보기 누가 넣느냐가 중요하다면 넣는거고.
		//String imagePath = FileManagerService.saveFile(lodgingId, file);
		//이것도 꼭넣어야하는지? 빼보기
		return lodgingDAO.updateLodging(id, roomName, level, areaName);
				
	}
	
	// 객실추가
	public int addRoom(int lodgingId, int adminId, int price, String size, String content, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(adminId, file);
		
		return lodgingDAO.insertRoom(lodgingId, adminId, price, size, content, imagePath);
	}
		
	// 객실 리스트
	public List<Room> getRoomList(int lodgingId){

		return lodgingDAO.selectRoomList(lodgingId);

	}
	
	// 객실 한행 조회
	public Room getRoom(int id) {
		
		return lodgingDAO.selectRoomById(id);
	}
	
	// 객실 수정
	public int updateRoom(int id, int price, String size, String content) {
	
		return lodgingDAO.updateRoom(id, price, size, content);
	
	}
	
	// 숙소 삭제
	public int deleteLodging(int id) {

		return lodgingDAO.deleteLodging(id);
		
	}

}
