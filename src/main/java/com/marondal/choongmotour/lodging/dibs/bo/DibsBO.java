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
	public int addDibs(int userId, int lodgingId) {
		
		return dibsDAO.insertDibs(userId, lodgingId);
	}
	
	
	// 찜목록
	public List<DibsDetail> getDibsList(int lodgingId){//이것도 틀렸다. List<DibsDetail>로
		
		
		
		
		return dibsDAO.selectDibsById(lodgingId);//userId는 애초에 로그인한 사람 한명인데 굳이 해야하나 싶기도하다.
	}
	
	//찜 취소
	public int deleteDibs(int userId, int lodgingId) {
		
		
		return dibsDAO.deleteDibs(userId, lodgingId);
		
		
	}
}
