package com.marondal.choongmotour.lodging.reserve.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReserveDAO {

	//예약하기
	public int insertReserve(@Param("userId") int userId
							,@Param("roomId") int roomId 
							, @Param("reserveDate") Date reserveDate);
}
