package com.marondal.choongmotour.lodging.reserve.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.choongmotour.lodging.model.Reserve;
import com.marondal.choongmotour.lodging.model.ReserveDetail;


@Repository
public interface ReserveDAO {
	


	//예약 조회 이게굳이 필요할련지는 모르겠다????

	public ReserveDetail selectgetReserveInfoById (@Param("userId")int userId, @Param("id") int id);
	
	
	
	//예약하기
	public int insertReserve(
							@Param("roomId") int roomId 
							, @Param("userId") int userId
							, @Param("payment") String payment
							, @Param("startDate") Date startDate
							, @Param("endDate") Date endDate);
	
	
	//예약 목록
	public List<Reserve> selectReserveList(@Param("userId") int userId, @Param("id") int id);
	
	
	
	
	
	//예약 취소
	
	public int deleteReserve(@Param("roomId") int roomId, @Param("userId")int userId);
	
}
