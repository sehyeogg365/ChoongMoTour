package com.marondal.choongmotour.lodging;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.dibs.bo.DibsBO;
import com.marondal.choongmotour.lodging.reserve.bo.ReserveBO;

@RestController
@RequestMapping("/lodging")
public class LodgingRestController {

	@Autowired LodgingBO lodgingBO;
	@Autowired DibsBO dibsBO;
	@Autowired ReserveBO reserveBO;
	
	//사용자 페이지 숙소예약 예약취소 이런건 user일지 lodging일지??
	
	//찜
	@PostMapping("/dib")
	public Map<String, String> dibsCreate(
			@RequestParam("lodgingId") int lodgingId
			, HttpSession session
			){
		int userId = (Integer)session.getAttribute("userId");
		
		int count = dibsBO.addDibs(lodgingId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;

	}
	
	//찜 취소
	@GetMapping("/undib")
	public Map<String, String> dibsDelete(
			@RequestParam("lodgingId") int lodgingId
			, HttpSession session
			){
		int userId = (Integer)session.getAttribute("userId");
		
		int count = dibsBO.deleteDibs(lodgingId, userId);
		
		Map <String, String> resultMap = new HashMap<>();
		
		if(count == 0) {
			resultMap.put("result", "fail");
		} else {
			resultMap.put("result", "success");
		}
		
		return resultMap;
		
	}
	
	//찜 목록내 제거
	@GetMapping("/undibbasket")
	public Map<String, String> dibsDeleteById(
			@RequestParam("id") int id
			, HttpSession session
			){
		int userId = (Integer)session.getAttribute("userId");
		
		int count = dibsBO.deleteDibsById(userId, id);
		
		Map <String, String> resultMap = new HashMap<>();
		
		if(count == 0) {		
			resultMap.put("result", "fail");
		} else { 
			resultMap.put("result", "success");
		}
		
		
		
		return resultMap;
		
	}
	
	//날짜 선택/추가
//	@PostMapping("/dateselect")
//	public Map<String, String> selectDate( @RequestParam("roomId") int roomId
//										 , @RequestParam("startDate") Date startDate
//										 , @RequestParam("endDate") Date endDate	
//										){
//		
//		int count = reserveBO.addDate(roomId, startDate, endDate);
//		
//		Map <String, String> resultMap = new HashMap<>();
//		
//		if(count == 1) {
//			resultMap.put("result", "success");
//		} else {
//			resultMap.put("result", "fail");
//		}
//		
//		
//			return resultMap;
//		
//	}
	
	
	//예약 하기 
	@PostMapping("/reserve")
	public Map<String, String> reserveRoom(
 @RequestParam("roomId") int roomId
				, @RequestParam("payment") String payment
				, @RequestParam("startDate") Date startDate
				, @RequestParam("endDate") Date endDate
				, HttpSession session
			) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = reserveBO.addReserve(roomId, userId,  payment, startDate, endDate);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}	
		
		return resultMap;

	}
	
	// 예약 취소
	@PostMapping("/deletereserve")
	public Map<String, String> reserveDelete(
										@RequestParam("id")int id){
		
		
		int count = reserveBO.deleteReserve(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
			
		} else { 
			
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;
	}
	
	
	//-------관리자 페이지---------
	//숙소 추가 api
	@PostMapping("/create")
	public Map<String, String>lodgingCreate(
			@RequestParam("id") int id
			, @RequestParam("roomName") String roomName //400에러면 파라미터 문제
			, @RequestParam("level") String level// 그리고 사용자영역에서 지역이름별로 숙소 조회 하는데 여긴 입력부분이고 관리자 입력부분과 사용자 조회부분은 아예 별개라서 신경쓸필요 없다하심
			, @RequestParam("areaName") String areaName
			, @RequestParam(value="file", required=false) MultipartFile file //Memo 프로젝트 포스트 컨트롤러로 이현상 참조해보기
			, HttpSession session
			// id값 불러오기
			) {
		int adminId = (Integer)session.getAttribute("adminId");
		
		int count = lodgingBO.addLodging(id, adminId, roomName, level, areaName, file);
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
				
				){
			
			//int id = (Integer)session.getAttribute("id");//수정할 대상
			// because the return value of "javax.servlet.http.HttpSession.getAttribute(String)" is null 이렇게 뜬다. 세션에 LodgingId값을 저장하지 않아서 null이뜨는것.
			// 그래서 파라미터로 불러오는것이고, 세션 값이란 로그인할때 저장되는 값, 파라미터로 해볼까가 아닌 세션에 저장에 안된값이 안되는구나 이렇게 알아야 하고, 세션 불러오는건 최소화 해야함.
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
	public Map<String, String>roomCreate(
			@RequestParam("id") int id
			, @RequestParam("lodgingId") int lodgingId
			, @RequestParam("price") int price
			, @RequestParam("size") String size
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file 
			
			){
		
		Map<String, String> resultMap = new HashMap<>();

		
		
		int count = lodgingBO.addRoom(id, lodgingId, price, size, content, file);
		
		if(count == 1) {
			resultMap.put("result", "success");		
		} else {		
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;

	}
	
	
	// 객실 수정 api
	@PostMapping("/room/update")
	public Map<String, String>roomUpdate(
			@RequestParam("id") int id
			, @RequestParam("price") int price
			, @RequestParam("size") String size
			, @RequestParam("content") String content

			){
		
		Map<String, String> resultMap = new HashMap<>();

		int count = lodgingBO.updateRoom(id, price, size, content);
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
			
	}
	
	
	// 숙소 삭제 api
	@GetMapping("/delete")//이것도 겟매핑으로
	public Map<String, String> lodgingDelete(
			@RequestParam("id") int id){
		
		Map<String, String> resultMap = new HashMap<>();
		
		int count = lodgingBO.deleteLodging(id);
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
		
	}
	
	
	
	
}
