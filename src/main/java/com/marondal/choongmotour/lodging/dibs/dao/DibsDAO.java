package com.marondal.choongmotour.lodging.dibs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.choongmotour.lodging.model.DibsDetail;
import com.marondal.choongmotour.lodging.model.Lodging;

@Repository
public interface DibsDAO {
	//찜
	public int insertDibs(@Param("userId") int userId
						 , @Param("lodgingId") int lodgingId);
	
	//찜 조회
	public List<DibsDetail> selectDibsById(@Param("userId") int userId
										  );
											
	
	//찜 취소
	
	public int deleteDibs(@Param("userId") int userId
						  ,@Param("id") int id);
	
	
}
