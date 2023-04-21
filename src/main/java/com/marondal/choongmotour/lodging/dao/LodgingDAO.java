package com.marondal.choongmotour.lodging.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.lodging.model.Lodging;

@Repository
public interface LodgingDAO {

	//사용자페이지
	
	
	//관리자 페이지
	//숙소 추가
	public int insertLodging(
							@Param("adminId") int adminId
							, @Param("roomName") String roomName
							, @Param("level") String level
							, @Param("areaName") String areaName
							, @Param("imagePath") String imagePath
							);

	//숙소 리스트
	public List<Lodging> selectLodgingList(@Param("adminId")int adminId);
	
	// 숙소 수정
		public int updateLodging(
								 @Param("id") int id
								, @Param("roomName") String roomName
								, @Param("level") String level
								, @Param("areaName") String areaName
								, @Param("imagePath") String imagePath
						 		);
	
	//객실 추가
	public int insertRoom(
						  @Param("lodgingId") int lodgingId
						  , @Param("price")int price
						  , @Param("size") String size
						  , @Param("content") String content
						  , @Param("imagePath") String imagePath
						  );
		
	
	// 객실 수정
	
	
		
	// 숙소 삭제
		
		
		
}
