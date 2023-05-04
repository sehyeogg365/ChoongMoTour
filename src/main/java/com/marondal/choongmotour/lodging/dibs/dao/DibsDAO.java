package com.marondal.choongmotour.lodging.dibs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import com.marondal.choongmotour.lodging.model.Lodging;

@Repository
public interface DibsDAO {
	//찜
	public int insertDibs(@Param("lodgingId") int lodgingId);
	
	//찜 조회
	public List<Lodging> selectDibsById(@Param("userId") int userId);
	
	//찜 취소
	
	public int deleteDibs(@Param("lodgingId") int lodgingId);
	
	
}
