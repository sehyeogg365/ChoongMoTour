package com.marondal.choongmotour.lodging.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.common.FileManagerService;
import com.marondal.choongmotour.lodging.dao.LodgingDAO;
import com.marondal.choongmotour.lodging.model.Lodging;


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
		return lodgingDAO.insertLodging(adminId, roomName, level, areaName, imagePath);
			
	}
	
	// 숙소 리스트
	
	
	public List<Lodging> getLodgingList(int adminId) {//관리자 id
			
		return lodgingDAO.selectLodgingList(adminId);

	}
	
	//숙소 수정
		public int updateLodging(int lodgingId, String roomName, String level, String areaName, MultipartFile file) {
							//update에 꼭 필요한값만 넣어야 한다고 판단 추가메서드에서도 꼭 adminId를 넣어야만 하는지 검토해보기 누가 넣느냐가 중요하다면 넣는거고.
			String imagePath = FileManagerService.saveFile(lodgingId, file);
			
			return lodgingDAO.updateLodging(lodgingId, roomName, level, areaName, imagePath);
				
		}
	
	//객실추가
	
	public int addRoom(int lodgingId, int price, String size, String content, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(lodgingId, file);
		
		return lodgingDAO.insertRoom(lodgingId, price, size, content, imagePath);
	}
		

	
	
	//객실 수정
	
	
		
		
	//숙소 삭제

	
	
	
	
}
