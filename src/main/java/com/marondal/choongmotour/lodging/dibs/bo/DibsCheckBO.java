package com.marondal.choongmotour.lodging.dibs.bo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.lodging.dibs.dao.DibsDAO;

@Service
@RequiredArgsConstructor
public class DibsCheckBO {

	private final DibsDAO dibsDAO;
	// 찜 해당숙소가 찜 되어있는지 안되어있는지 여부보기 빈하트냐 풀하트냐
	public boolean isDibs(int userId, int lodgingId) {
		int count = dibsDAO.selectDibsByUserId(userId, lodgingId);

        // 0개면 찜이 안됨
        return count != 0;
	}
}
