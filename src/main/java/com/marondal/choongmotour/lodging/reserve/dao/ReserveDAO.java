package com.marondal.choongmotour.lodging.reserve.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.choongmotour.lodging.model.ReserveDetail;

@Repository
public interface ReserveDAO {

	//예약하기
	public int insertReserve(@Param("userId") int userId
							,@Param("roomId") int roomId 
							,@Param("payment") String payment
							, @Param("reserveDate") Date reserveDate);
	
	
	//예약 목록
	public List<ReserveDetail> selectReserveList(@Param("id") int id);
	
	
	//예약 취소
	
	public int deleteReserve(@Param("id") int id);
	
}
