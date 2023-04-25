package com.marondal.choongmotour.lodging;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.lodging.bo.LodgingBO;

@RestController
@RequestMapping("/lodging")
public class LodgingRestController {

	@Autowired LodgingBO lodgingBO;
	
	//사용자 페이지
	
	
	//관리자페이지
	//숙소 추가 api
	@PostMapping("/create")
	public Map<String, String>lodgingCreate(
			  @RequestParam("roomName") String roomName //400에러면 파라미터 문제
			, @RequestParam("level") String level// 그리고 사용자영역에서 지역이름별로 숙소 조회 하는데 여긴 입력부분이고 관리자 입력부분과 사용자 조회부분은 아예 별개라서 신경쓸필요 없다하심
			, @RequestParam("areaName") String areaName
			, @RequestParam(value="file", required=false) MultipartFile file //Memo 프로젝트 포스트 컨트롤러로 이현상 참조해보기
			, HttpSession session // id값 불러오기
			) {
		
		int adminId = (Integer)session.getAttribute("adminId");
		
		int count = lodgingBO.addLodging(adminId, roomName, level, areaName, file);
								//그리고 웬만하면 자동완성 하지말기. 헷갈리고 더 복잡해짐
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		

		return resultMap;
	
	}
	
	// 숙소 수정 api
		@PostMapping("/update")	
		public Map<String, String> lodgingUpdate(
				 	@RequestParam("id") int id
					, @RequestParam("roomName") String roomName
					, @RequestParam("level") String level
					, @RequestParam("areaName") String areaName
					, HttpSession session
				){
			
			//int id = (Integer)session.getAttribute("id");//수정할 대상
			
			int count = lodgingBO.updateLodging(id, roomName, level, areaName);
			Map<String, String> resultMap = new HashMap<>();
					
			if(count == 1) {
				resultMap.put("result", "success");
			} else {
				resultMap.put("result", "fail");
			}
			
			return resultMap;
			
			
		}
	
	// 객실 추가 api
	@PostMapping("/room/create")
	public Map<String, String>roomcreate(
			@RequestParam("lodgingId") int lodgingId
			, @RequestParam("price") int price
			, @RequestParam("size") String size
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session
			){
		
		Map<String, String> resultMap = new HashMap<>();
		
		//int lodgingId = (Integer)session.getAttribute("lodgingId");
		
		int count = lodgingBO.addRoom(lodgingId, price, size, content, file);
		
		if(count == 1) {
			resultMap.put("result", "success");		
		} else {		
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;

	}
	
	
	// 객실 수정 api
	@PostMapping
	public Map<String, String>roomupdate(
			@RequestParam("price") int price
			, @RequestParam("size") String size
			, @RequestParam("content") String content
			, HttpSession session
			){
		
		
		Map<String, String> resultMap = new HashMap<>();
		
		int lodgingId = (Integer)session.getAttribute("lodgingId");
		
		int count = lodgingBO.updateRoom(lodgingId, price, size, content);
		
		return resultMap;
		
		
	}
	
	
	// 숙소 삭제 api
	//@PostMapping
	
	
}
