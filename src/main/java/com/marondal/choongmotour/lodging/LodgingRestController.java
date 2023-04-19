package com.marondal.choongmotour.lodging;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.lodging.bo.LodgingBO;

@RestController
@RequestMapping("/lodging")
public class LodgingRestController {

	@Autowired LodgingBO lodgingBO;
	
	//숙소 추가 api
	@GetMapping("/create")
	public Map<String, String>lodgingcreate(
			@RequestParam("roomName") String roomName
			, @RequestParam("level") int level
			, @RequestParam(value="file", required=true) MultipartFile file
			, @RequestParam("areaName") String areaName
			, HttpSession session // adminId값 불러오기
			) {
		
		int adminId = (Integer)session.getAttribute("adminId");
		
		int count = lodgingBO.addLodging(adminId, roomName, level, areaName, file); 
				
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		

		return resultMap;
	
	}
	// 객실 추가 api
	//@GetMapping("/room/create")
	
	
	// 숙소 수정 api
		
	// 숙소 삭제 api
	
	
	
}
