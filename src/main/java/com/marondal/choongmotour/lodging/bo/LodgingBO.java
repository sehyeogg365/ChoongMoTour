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
	
	public int addLodging(String roomName, String level, String areaName, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(0, file);	
		return lodgingDAO.insertLodging(roomName, level, areaName, imagePath);
			
	}
	
	// 숙소 리스트
	
	public List<Lodging> getLodgingList(int id) {//관리자 id
			
		return lodgingDAO.selectLodgingList(id);

	}
	
	//숙소 한행 불러오기
	public Lodging getLodging(int id) {
		return lodgingDAO.selectLodging(id);
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
			
		String imagePath = FileManagerService.saveFile(lodgingId, file);
		
		return lodgingDAO.insertRoom(lodgingId, price, size, content, imagePath);
	}
		
	//객실 리스트
	
	public List<Room> getRoomList(int lodgingId){

		return lodgingDAO.selectRoomList(lodgingId);

	}
	
	
	//객실 수정
	
	public int updateRoom(int id, int price, String size, String content) {
		
		
		return price;
		
		
	}
	
	
		
		
	//숙소 삭제

	
	
	
	
}
