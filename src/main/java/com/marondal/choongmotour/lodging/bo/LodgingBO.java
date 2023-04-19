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
	
	
	
	
	//관리자 페이지
	
	
	//숙소 추가
	
	public int addLodging(int adminId, String roomName, int level, String areaName, MultipartFile file) {
			
		String imagePath = FileManagerService.saveFile(adminId, file);	
		return lodgingDAO.insertLodging(adminId, roomName, level, areaName, file);
			
	}
	
	// 숙소 리스트
	
	
	public List<Lodging> getLodgingList(int adminId) {//관리자 id
			
		return lodgingDAO.selectLodgingList(adminId);
			
	}
	
	//객실추가
	
	public int getRoom(int price, String size, String content, MultipartFile file) {
			
		return lodgingDAO.insertRoom(price, size, content, content);
	}
		
		
		
		
	//숙소 수정
	public int updateRoom(String roomName, int level, String areaName, MultipartFile file, int price, String size, String content) {
		
		return lodgingDAO.updateLodging(roomName, level, areaName, null, 0, null, null);
			
	}
		
		
	//숙소 삭제

	
	
	
	
}
