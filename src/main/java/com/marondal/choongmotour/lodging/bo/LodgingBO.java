package com.marondal.choongmotour.lodging.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.common.FileManagerService;
import com.marondal.choongmotour.lodging.dao.LodgingDAO;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.Room;


@Service
public class LodgingBO {

	@Autowired LodgingDAO lodgingDAO;
	
	
	//사용자페이지
	
	//숙소리스트
	
	//숙소 하나 클릭시 하나의 정보만
	
	
	
	
	
	//관리자 페이지
	
	
	//숙소 추가
	
	public int addLodging(int adminId, String roomName, String level, String areaName, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(adminId, file);	
		return lodgingDAO.insertLodging(roomName, level, areaName, imagePath);
									//bo 에서 필요해서 호출한 adminId가 dao에서는 필요가없으므로 뺀다. 금욜날 이거를 말한거였음
	}								//파일매니저서도 파일을 중복되지않게 저장하기위해 adminId가 당연히 필요한것.
									// 모호하게 전에서 이걸 써서 이게 필요할것이다 라는 생각이 들게됨 근데 명확하게 해야함개발은 쓸때 쓰고 뺄땐빼고 이래야 함.
	// 숙소 리스트
	
	public List<Lodging> getLodgingList(int id) {//관리자 id
			
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
	
	public int addRoom(int id, int lodgingId, int price, String size, String content, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(id, file);
		
		return lodgingDAO.insertRoom(id, lodgingId,  price,  size, content, imagePath);
	}
		
	//객실 리스트
	
	public List<Room> getRoomList(int LodgingId){

		return lodgingDAO.selectRoomList(LodgingId);

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

	
	
	
	
}
