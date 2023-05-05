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
	public int addReserve(int userId, int roomId, String payment, Date reserveDate) {
			
		return reserveDAO.insertReserve(userId, roomId, payment, reserveDate);	
			
	}
	
	//예약 목록
	public List<ReserveDetail> getReserveList(int id ){
		
		
		return reserveDAO.selectReserveList(id);
		
	}
	
	//예약 한행 정보 조회
	public ReserveDetail getReserveById(int id) {
		
		return reserveDAO.selectReservebyId(id);
	}
	
	
	//예약 취소
	public int deleteReserve(int id) {
		
		
		return reserveDAO.deleteReserve(id);
		
		
	}
	
	
	

}
