package com.marondal.choongmotour.lodging.dibs.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.lodging.dibs.dao.DibsDAO;
import com.marondal.choongmotour.lodging.model.Lodging;

@Service
public class DibsBO {
	
	@Autowired
	private DibsDAO dibsDAO;
	
	//찜
	public int addDibs(int lodgingId) {
		
		return dibsDAO.insertDibs(lodgingId);
	}
	
	
	// 찜목록 userId별로
	public List<Lodging> getDibsList(int userId){
		
		return dibsDAO.selectDibsById(userId);
	}
	
	//찜 취소
	public int deleteDibs(int lodgingId) {
		
		
		return dibsDAO.deleteDibs(lodgingId);
		
		
	}
}
