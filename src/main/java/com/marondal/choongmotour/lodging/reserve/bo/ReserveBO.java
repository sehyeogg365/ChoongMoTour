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
	
	
	

		
		
	
	//예약하기 
	public int addReserve(int roomId, int userId, String name, String phoneNumber,  String payment, Date startDate, Date endDate) {
			
		return reserveDAO.insertReserve(roomId, userId, name, phoneNumber, payment, startDate, endDate);	
			
		
	}
	
	
	
	
	//
	
	//예약 목록
	public List<ReserveDetail> getReserveList(int userId, int lodgingId){//로징아이디추가
		
		List<Reserve> reserveList = reserveDAO.selectReserveList(userId);//여기서 유저아이디가 두개가 들어가고있다는뜻. 반대로 되는게 잇음 이값이 있으니 넣어야겠다가 아닌 필요한값을 넣는것.
		
		List<ReserveDetail> reserveDetailList = new ArrayList<>();
		
		for(Reserve reserve : reserveList) {
			
			Lodging lodging = lodgingBO.getLodging(lodgingId);//로징불러오는값, 이값이 눌이란 뜻. 여기서 id 넣으면 userId값 두번 불러온단뜻. 
			
			User user = userBO.getUserInfo(reserve.getUserId());//이게 왜 이렇게 되어있는지? 유저아이디라 되어있어야하는거 아닌가?
			
			Room room = lodgingBO.getRoom(reserve.getRoomId());
			
			ReserveDetail reserveDetail = new ReserveDetail();
			
			//이거 오늘밤에 채우기
			
			reserveDetail.setId(reserve.getId());//예약아이디
			reserveDetail.setUserId(user.getId());//유저아이디
			reserveDetail.setLodgingId(room.getLodgingId());//로징아이디 여기수정 원래 lodging.getId()였음
			reserveDetail.setRoomId(reserve.getRoomId());//룸아이디
			reserveDetail.setName(reserve.getName());//이름
			reserveDetail.setPhoneNumber(user.getPhoneNumber());// 핸드폰번호
			reserveDetail.setSize(lodging.getRoomName());//숙소이름 로징객체가 널 
			reserveDetail.setPrice(room.getPrice());//객실 가격
			reserveDetail.setImagePath(lodging.getImagePath());//사진은 숙소사진
			reserveDetail.setStartDate(reserve.getStartDate());
			reserveDetail.setEndDate(reserve.getEndDate());
		
		
			reserveDetailList.add(reserveDetail);
		}
		
		
		
		return reserveDetailList;
		
	}
	
	//예약 한행 정보 조회(예약페이지조회)
	public ReserveDetail getReserveInfoById(int roomId, int userId) {
			
		return reserveDAO.selectgetReserveInfoById(roomId, userId);
		
	}
	
	
	
	
	//예약 취소
	public int deleteReserve(int userId, int roomId) {
		
		
		return reserveDAO.deleteReserve(userId, roomId);
		
		
	}
	
	
	

}
