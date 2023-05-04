package com.marondal.choongmotour.lodging.dibs.bo;

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
	public List<DibsDetail> getDibsList(int id, int userId){//이것도 틀렸다. List<DibsDetail>로
		
		//조회할때 userId인가 id인가?? 둘다인가??
		
		
		return dibsDAO.selectDibsById(id, userId);
	}
	
	
}
