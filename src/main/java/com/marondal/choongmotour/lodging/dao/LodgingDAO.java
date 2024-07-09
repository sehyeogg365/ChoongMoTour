package com.marondal.choongmotour.lodging.dao;

import java.util.List;

import com.marondal.choongmotour.lodging.model.LodgingDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.Room;

@Repository
public interface LodgingDAO {

	// 사용자페이지
	
	// 지역별 숙소 
	public List<LodgingDetail> selectLodgingListByArea(@Param("areaName") String areaName, @Param("sortType") String sortType);
	
	// 로징아이디 별 객실 
	public List<Room> selectRoomListOrderByPrice(@Param("lodgingId") int lodgingId);
												
	// 싱글룸의 가격
	public Integer selectSingleRoomPrice(@Param("lodgingId") int lodgingId);

	
	// -------관리자 페이지---------
	// 숙소 추가
	public int insertLodging(
							@Param("adminId") int adminId
							, @Param("roomName") String roomName
							, @Param("level") String level
							, @Param("areaName") String areaName
							, @Param("imagePath") String imagePath
							);

	// 숙소 리스트
	public List<Lodging> selectLodgingList(@Param("id")int id);
	
	// 숙소 한행
	public Lodging selectLodgingById(@Param("id") int id);
	
	
	// 숙소 수정
	public int updateLodging(
							@Param("id") int id
							, @Param("roomName") String roomName
							, @Param("level") String level
							, @Param("areaName") String areaName
						 	);
	
	// 객실 추가
	public int insertRoom(
							
						  @Param("lodgingId") int lodgingId
						  , @Param("adminId") int adminId
						  , @Param("price") int price
						  , @Param("size") String size
						  , @Param("content") String content
						  , @Param("imagePath") String imagePath
						  );
		
	// 객실 리스트
	public List<Room> selectRoomList(@Param("lodgingId") int lodgingId);
	
	
	// 객실 한행 조회
	public Room selectRoomById(@Param("id")int id);
	
	// 객실 수정
	public int updateRoom(
						@Param("id") int id
						,@Param("price") int price
						,@Param("size") String size
						,@Param("content") String content
						
						);
	
	
		
	// 숙소 삭제
	public int deleteLodging(@Param("id") int id);	
		
		
}
