package com.marondal.choongmotour.lodging.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.Room;

@Repository
public interface LodgingDAO {

	//사용자페이지
	
	//지역별 숙소 
	public List<Lodging> selectLodgingListByArea(@Param("areaName") String areaName);
	
	// 로징아이디 별 객실 근데 이건 밑에거 써도 되나???
	public List<Room> selectRoomListOrderByPrice(@Param("lodgingId") int lodgingId);
												
	

	
	
	
	
	//-------관리자 페이지---------
	//숙소 추가
	public int insertLodging(
							@Param("id") int id
							, @Param("roomName") String roomName
							, @Param("level") String level
							, @Param("areaName") String areaName
							, @Param("imagePath") String imagePath
							);

	//숙소 리스트
	public List<Lodging> selectLodgingList(@Param("adminId")int adminId);
	
	//숙소 한행
	public Lodging selectLodgingById(@Param("id") int id);
	
	
	// 숙소 수정
	public int updateLodging(
							@Param("id") int id
							, @Param("roomName") String roomName
							, @Param("level") String level
							, @Param("areaName") String areaName
						 	);
	
	//객실 추가
	public int insertRoom(

						   @Param("lodgingId") int lodgingId //이제보니 왜 price 가 없을까?
						  , @Param("price") int price
						  , @Param("size") String size
						  , @Param("content") String content
						  , @Param("imagePath") String imagePath
						  );
		
	//객실 리스트
	public List<Room> selectRoomList(@Param("lodgingId") int lodgingId);
	//어차피 여기는 사용자영역이라서 쓸일은 없을듯.
	
	//객실 한행 조회
	
	public Room selectRoomById(@Param("lodgingId")int lodgingId);
	
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
