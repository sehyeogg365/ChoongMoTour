package com.marondal.choongmotour.lodging.reserve.bo;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.lodging.reserve.dao.ReserveDAO;

@Service
public class ReserveBO {
	
	@Autowired ReserveDAO reserveDAO;
	
	//예약하기 
	public int addReserve(int userId, int roomId, Date reserveDate) {
			
		return reserveDAO.insertReserve(userId, roomId, reserveDate);	
			
	}
	
	//예약 목록
	
	//예약 취소

}
