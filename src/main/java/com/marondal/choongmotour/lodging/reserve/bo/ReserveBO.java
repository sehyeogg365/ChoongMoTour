package com.marondal.choongmotour.lodging.reserve.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.Reserve;
import com.marondal.choongmotour.lodging.model.ReserveDetail;
import com.marondal.choongmotour.lodging.model.Room;
import com.marondal.choongmotour.lodging.reserve.dao.ReserveDAO;
import com.marondal.choongmotour.user.bo.UserBO;
import com.marondal.choongmotour.user.model.User;

@Service
public class ReserveBO {
	
	@Autowired UserBO userBO;
	
	@Autowired ReserveDAO reserveDAO;
	
	@Autowired LodgingBO lodgingBO;
	
	
	
	//예약 한행 조회(예약페이지)
	public Reserve getReserve(int roomId) {
		
		
		return null;
		
		
			
		
	}
	
	//예약하기 
	public int addReserve( int roomId, int userId, String payment, Date startDate, Date endDate) {
			
		return reserveDAO.insertReserve(roomId, userId, payment, startDate, endDate);	
			
		
	}
	
	
	
	
	//
	
	//예약 목록
	public List<ReserveDetail> getReserveList(int userId, int id ){
		
		List<Reserve> reserveList = reserveDAO.selectReserveList(userId, id);
		
		List<ReserveDetail> reserveDetailList = new ArrayList<>();
		
		for(Reserve reserve : reserveList) {
			
			Lodging lodging = lodgingBO.getLodging(reserve.getRoomId());
			
			User user = userBO.getUserInfo(reserve.getId());
			
			Room room = lodgingBO.getRoom(id);
			
			ReserveDetail reserveDetail = new ReserveDetail();
			
			//이거 오늘밤에 채우기
			
			
			reserveDetail.setName(user.getName());//이름
			reserveDetail.setSize(lodging.getRoomName());//숙소이름
			reserveDetail.setPhoneNumber(user.getPhoneNumber());// 핸드폰번호
			reserveDetail.setPrice(room.getPrice());//가격은 복잡해지니 넣지말기
			reserveDetail.setImagePath(lodging.getImagePath());//사진은 숙소사진
			reserveDetail.setStartDate(reserve.getStartDate());
			reserveDetail.setEndDate(reserve.getEndDate());
		
		
			reserveDetailList.add(reserveDetail);
		}
		
		
		
		return reserveDetailList;
		
	}
	
	
	
	//예약 한행 정보 조회(예약페이지조회)
//	public ReserveDetail getReserveInfoById(int roomId, int userId) {
//		
//		
//		
//		
//		return reserveDAO.selectgetReserveInfoById(roomId, userId);
//	}
	
	
	//예약 취소
	public int deleteReserve(int userId, int roomId) {
		
		
		return reserveDAO.deleteReserve(userId, roomId);
		
		
	}
	
	
	

}
