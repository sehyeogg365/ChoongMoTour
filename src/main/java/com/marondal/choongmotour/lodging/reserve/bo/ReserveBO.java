package com.marondal.choongmotour.lodging.reserve.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.lodging.model.Reserve;
import com.marondal.choongmotour.lodging.model.ReserveDetail;
import com.marondal.choongmotour.lodging.reserve.dao.ReserveDAO;

@Service
public class ReserveBO {
	
	@Autowired ReserveDAO reserveDAO;
	
	//예약하기 
	public int addReserve(int userId, int roomId, String payment, Date startDate, Date endDate) {
			
		return reserveDAO.insertReserve(userId, roomId, payment, startDate, endDate);	
			
	}
	
	//예약 목록
	public List<ReserveDetail> getReserveList(int id ){
		
		
		return reserveDAO.selectReserveList(id);
		
	}
	
	
	
	//예약 한행 정보 조회(예약페이지조회)
	public ReserveDetail getReserveInfoById(int id) {
		
		return reserveDAO.selectgetReserveInfoById(id);
	}
	
	
	//예약 취소
	public int deleteReserve(int id) {
		
		
		return reserveDAO.deleteReserve(id);
		
		
	}
	
	
	

}
