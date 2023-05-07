package com.marondal.choongmotour.lodging.dibs.bo;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.marondal.choongmotour.lodging.dibs.dao.DibsDAO;

import com.marondal.choongmotour.lodging.model.DibsDetail;
import com.marondal.choongmotour.lodging.model.Lodging;


@Service
public class DibsBO {
	
	@Autowired
	private DibsDAO dibsDAO;
	

	
	//찜
	public int addDibs(int lodgingId, int userId) {// 어떤 숙소를 찜할것이냐, 누가 찜할것이냐
		
		return dibsDAO.insertDibs(lodgingId, userId);
	}
	
	//찜 해당숙소가 찜 되어있는지 안되어있는지 여부보기 빈하트냐 풀하트냐 
	
	public boolean isDibs(int userId, int lodgingId) {
		
		int count = dibsDAO.selectDibsByUserId(userId, lodgingId);
		
		if(count == 0) {//0개면 찜이 안됨
			
			return false;
		} else {
			
			return true;
		}
	}
	
	//찜 취소
	public int deleteDibs(int lodgingId, int userId) { 
			
			
		return dibsDAO.deleteDibs(lodgingId, userId);
			
			
	}
	
	
	// 찜목록
	public List<DibsDetail> getDibsList(int userId, int id){//이것도 틀렸다. List<DibsDetail>로
		
	
		//조회할때 userId인가 id인가?? 둘다인가??
		//List<DibsDetail> dibsDetailList = new ArrayList<>();
		//찜목록 조회 
		//여기도 마찬가지로 잘 조화시켜보기
//		for(DibsDetail dibsDetail : dibsDetailList) {
//								
//			dibsDetail.setId(dibsDetail.getId());//몇번째 찜했는지 
//			dibsDetail.setUserId(dibsDetail.getUserId());//누가 저장했는지
//			dibsDetail.setLodgingId(dibsDetail.getLodgingId());// 어떤숙소인지
//			dibsDetail.setRoomName(dibsDetail.getRoomName());//숙소명
//			dibsDetail.setAreaName(dibsDetail.getAreaName());//지역
//			dibsDetail.setPrice(dibsDetail.getPrice());//가격
//			dibsDetail.setImagePath(dibsDetail.getImagePath()); //사진 등
//														
//			dibsDetailList.add(dibsDetail);															
//		}	
		return dibsDAO.selectDibsList(userId, id);//이것도 로징아이디 별 조회
	}
	
	// 찜 목록 숙소리스트
	
//	public List<Lodging> getLodgingListDibs(int id){
//		
//		return dibsDAO.selectLodgingListByDibs(id);
//	}
	
	
	//찜 목록내 제거
	
	public int deleteDibsById(int userId, int id) {
		
		return dibsDAO.deleteDibsById(userId, id);
	}
	
	
}
