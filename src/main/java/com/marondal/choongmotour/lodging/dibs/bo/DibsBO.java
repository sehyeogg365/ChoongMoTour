package com.marondal.choongmotour.lodging.dibs.bo;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.dibs.dao.DibsDAO;
import com.marondal.choongmotour.lodging.model.Dibs;
import com.marondal.choongmotour.lodging.model.DibsDetail;
import com.marondal.choongmotour.lodging.model.Lodging;


@Service
public class DibsBO {
	
	@Autowired
	private DibsDAO dibsDAO;
	
	@Autowired
	private LodgingBO lodgingBO;
	

	
	//찜
	public int addDibs(int lodgingId, int userId) {// 어떤 숙소를 찜할것이냐, 누가 찜할것이냐
		
		return dibsDAO.insertDibs(lodgingId, userId);
	}
	
	
	//찜 해당숙소가 찜 되어있는지 안되어있는지 여부보기 빈하트냐 풀하트냐 이거 딥스체크비오로 이동
	
	//찜 취소
	public int deleteDibs(int lodgingId, int userId) { 
			
			
		return dibsDAO.deleteDibs(lodgingId, userId);
			
			
	}
	
	
	// 찜목록 보기
	public List<DibsDetail> getDibsList(int userId, int id){//이것도 틀렸다. List<DibsDetail>로
		
		// 찜목록을 조회해야한다. 이것은 전체 조회니 엉뚱한게 나올수 밖에 타임라인도 전체를 조회한담에 디테일부분을 안에다 조회해온것.

		List<Dibs> dibsList = dibsDAO.selectDibsList(userId, id);
		//이게타입이 딥스디테일이 되면안된단뜻.
		
		//조회할때 userId인가 id인가?? 둘다인가??
		List<DibsDetail> dibsDetailList = new ArrayList<>();
		//찜목록 조회 
		//여기도 마찬가지로 잘 조화시켜보기
		
		
		
		for(Dibs dibs : dibsList) {
					
			Lodging lodging = lodgingBO.getLodging(dibs.getLodgingId());
			
			DibsDetail dibsDetail = new DibsDetail();
			
			dibsDetail.setLodgingId(dibs.getLodgingId());//여기가 오류였음 로징아이디에 아이디를 셋팅해놔서 오류가 났던것.
			dibsDetail.setId(dibs.getId());//그리고 딥스 아이디도 안불러와서 계속 0이라고 떴던것. 
			dibsDetail.setImagePath(lodging.getImagePath());
			dibsDetail.setAreaName(lodging.getAreaName());
			dibsDetail.setRoomName(lodging.getRoomName());
			
			dibsDetailList.add(dibsDetail);
			//당연히 딥스에서 숙소명, 지역명, 사진을 조회해오는것이아닌 위세가지가 저장된 테이블인 로징에서 조회해오는것.
		}	
		return dibsDetailList;//이것도 로징아이디 별 조회
	}
	

	
	


	
	
}
