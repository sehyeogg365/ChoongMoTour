package com.marondal.choongmotour.lodging.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.common.FileManagerService;
import com.marondal.choongmotour.lodging.dao.LodgingDAO;
import com.marondal.choongmotour.lodging.dibs.bo.DibsBO;
import com.marondal.choongmotour.lodging.dibs.bo.DibsCheckBO;
import com.marondal.choongmotour.lodging.dibs.dao.DibsDAO;
import com.marondal.choongmotour.lodging.model.DibsDetail;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.LodgingDetail;
import com.marondal.choongmotour.lodging.model.Room;
import com.marondal.choongmotour.user.bo.UserBO;
import com.marondal.choongmotour.user.model.User;


@Service
public class LodgingBO {

	@Autowired LodgingDAO lodgingDAO;
	
	@Autowired UserBO userBO;
	
	//순환참조 문제 때문에 새로운 비오를 따로 하나 만듦
	
	@Autowired DibsCheckBO dibsCheckBO;
	//사용자페이지

	//lodging 정보 - 지역 불러오기??
	
	//숙소리스트 지역별로 보여주면서 로그인 했을시 찜했는지 안했는지 여부까지 나타내야 함
	public List<LodgingDetail> getLodgingListByArea(String areaName, int userId){
		
		List<Lodging> lodgingList = lodgingDAO.selectLodgingListByArea(areaName);
		
		List<LodgingDetail> lodgingDetailList = new ArrayList<>();
		
		for(Lodging lodging:lodgingList) {
			
			//숙소카드 한장에 유저정보가 들어갈일은 없다.
			
			
			boolean isDibs = dibsCheckBO.isDibs(userId, lodging.getId());
			//이거와 관련된 비오 하나를 차라리 더 팔것.							
			
			LodgingDetail lodgingDetail = new LodgingDetail();
			
			//현재 뜨는 500에러 여기서 로징아이디가 안불러와지고 있단뜻인듯.
			
			//그 숙소리스팅에 들어갈 것들.
			//lodgingDetail.setUserId(user.getId());//유저아이디?
			lodgingDetail.setId(lodging.getId());//로징아이디
			lodgingDetail.setRoomName(lodging.getRoomName());// 숙소명
			lodgingDetail.setAreaName(lodging.getAreaName()); // 지역명
			lodgingDetail.setLevel(lodging.getLevel());//성급
			lodgingDetail.setImagePath(lodging.getImagePath());// 숙소 사진
			lodgingDetail.setDibs(isDibs);// 찜여부
			//로징아이디 로징 룸네임 성급이미지 그리고찜여부
			
		
			//nullpointException이 뜬다. 여 값이 널값이란뜻 왜 널일까
			
			lodgingDetailList.add(lodgingDetail);
		}
		
		
		
		return lodgingDetailList;
		
	}
	
	
	//객체 리스트 로징아이디별, 가격별
	public List<Room> getRoomListOrderByPrice(int lodgingId){
		
		
		return lodgingDAO.selectRoomListOrderByPrice(lodgingId);
		
		
	}
	

	
	// 예약목록 userId별로
	
	
	
	//-------관리자 페이지---------
	
	
	//숙소 추가
	
	public int addLodging(int id, int adminId, String roomName, String level, String areaName, MultipartFile file ) {
			
		String imagePath = FileManagerService.saveFile(id, file);	
		
		return lodgingDAO.insertLodging(id, adminId, roomName, level, areaName, imagePath);
									//bo 에서 필요해서 호출한 adminId가 dao에서는 필요가없으므로 뺀다. 금욜날 이거를 말한거였음
	}								//파일매니저서도 파일을 중복되지않게 저장하기위해 adminId가 당연히 필요한것.
									// 모호하게 전에서 이걸 써서 이게 필요할것이다 라는 생각이 들게됨 근데 명확하게 해야함개발은 쓸때 쓰고 뺄땐빼고 이래야 함.
	// 숙소 리스트
	
	public List<Lodging> getLodgingList(int id) {
			
		return lodgingDAO.selectLodgingList(id);

	}
	
	//숙소 한행 불러오기
	public Lodging getLodging(int id) {
		return lodgingDAO.selectLodgingById(id);
	}
	
	//숙소 수정
	public int updateLodging(int id, String roomName, String level, String areaName) {
							//update에 꼭 필요한값만 넣어야 한다고 판단 추가메서드에서도 꼭 adminId를 넣어야만 하는지 검토해보기 누가 넣느냐가 중요하다면 넣는거고.
		//String imagePath = FileManagerService.saveFile(lodgingId, file);
		//이것도 꼭넣어야하냐고 물어보시는데 빼보기
		return lodgingDAO.updateLodging(id, roomName, level, areaName);
				
	}
	
	//객실추가
	
	public int addRoom(int lodgingId, int price, String size, String content, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(0, file);//이거 이래도 되는지???
		
		return lodgingDAO.insertRoom(lodgingId, price, size, content, imagePath);
	}
		
	//객실 리스트
	
	public List<Room> getRoomList(int lodgingId){

		return lodgingDAO.selectRoomList(lodgingId);

	}
	
	//객실 한행 조회
	public Room getRoom(int lodgingId) {
		
		return lodgingDAO.selectRoomById(lodgingId);
	}
	
	
	//객실 수정
	
	public int updateRoom(int id, int price, String size, String content) {
	
		return lodgingDAO.updateRoom(id, price, size, content);
	
	}
		
		
	//숙소 삭제
	
	public int deleteLodging(int id) {
		
		
		return lodgingDAO.deleteLodging(id);
		
	}
	
	
	
	
}
