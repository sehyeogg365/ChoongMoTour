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
	
	public int addLodging(int adminId, String roomName, int level, String areaName, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(adminId, file);	
		return lodgingDAO.insertLodging(adminId, roomName, level, areaName, imagePath);
			
	}
	
	// 숙소 리스트
	
	
	public List<Lodging> getLodgingList(int adminId) {//관리자 id
			
		
		
		return lodgingDAO.selectLodgingList(adminId);
		
		
		
	}
	
	//객실추가
	
	public int addRoom(int lodgingId, int price, String size, String content, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(lodgingId, file);
		
		return lodgingDAO.insertRoom(lodgingId, price, size, content, imagePath);
	}
		
		
		
		
	//숙소 수정
	public int updateLodging(int adminId, String roomName, int level, String areaName, MultipartFile file, int price, String size, String content) {

		String imagePath = FileManagerService.saveFile(adminId, file);
		
		return lodgingDAO.updateLodging(adminId, roomName, level, areaName, imagePath, price, size, content);
			
	}
		
		
	//숙소 삭제

	
	
	
	
}
