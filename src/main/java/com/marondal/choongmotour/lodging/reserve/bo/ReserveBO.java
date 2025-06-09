package com.marondal.choongmotour.lodging.reserve.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.Reserve;
import com.marondal.choongmotour.lodging.model.ReserveDetail;
import com.marondal.choongmotour.lodging.model.Room;
import com.marondal.choongmotour.lodging.reserve.dao.ReserveDAO;
import com.marondal.choongmotour.user.bo.UserBO;
import com.marondal.choongmotour.user.model.User;

@Service
@RequiredArgsConstructor
public class ReserveBO {
	private final UserBO userBO;

	private final ReserveDAO reserveDAO;

	private final LodgingBO lodgingBO;

	// 예약하기
	public int addReserve(int roomId, int userId, String name, String phoneNumber,  String payment, Date startDate, Date endDate) {
		return reserveDAO.insertReserve(roomId, userId, name, phoneNumber, payment, startDate, endDate);
	}

	// 예약 목록
	public List<ReserveDetail> getReserveList(int userId){// 로징아이디추가
		List<Reserve> reserveList = reserveDAO.selectReserveList(userId);// 여기서 유저아이디가 두개가 들어가고있다는뜻. 반대로 되는게 잇음 이값이 있으니 넣어야겠다가 아닌 필요한값을 넣는것.
		
		List<ReserveDetail> reserveDetailList = new ArrayList<>();

		for(Reserve reserve : reserveList) {

			User user = userBO.getUserInfo(reserve.getUserId());// 이게 왜 이렇게 되어있는지? 유저아이디라 되어있어야하는거 아닌가?
			
			// 로징불러오는값, 이값이 눌이란 뜻. 여기서 id 넣으면 userId값 두번 불러온단뜻.
			Room room = lodgingBO.getRoom(reserve.getRoomId());// 여기도 id쓰면 안됨 roomId로
			Lodging lodging = lodgingBO.getLodging(room.getLodgingId());// 당연히 로징이 룸위에있으니 값을 못받아왔던것.
			ReserveDetail reserveDetail = new ReserveDetail();
			
			// 4로 시작하는건 요청하는쪽문제 컨트롤러 비오 다오 볼필요도 없음끽해야 파라미터
			// 5로 시작하는건 서버문제
			// 자동채우기 하지말고 자동채우기는 통달한자들이 편의를위해 쓰는것. 값하나하나 인자하나하나 뭘의미한지 알고 그렇게 넣기 
			
			//이거 오늘밤에 채우기
			reserveDetail.setId(reserve.getId());// 예약아이디
			reserveDetail.setUserId(user.getId());// 유저아이디
			reserveDetail.setLodgingId(room.getLodgingId());// 로징아이디 여기수정 원래 lodging.getId()였음
			reserveDetail.setRoomId(reserve.getRoomId());// 룸아이디
			reserveDetail.setName(reserve.getName());// 이름
			reserveDetail.setPhoneNumber(reserve.getPhoneNumber());// 핸드폰번호
			reserveDetail.setRoomName(lodging.getRoomName());// 숙소이름
			reserveDetail.setSize(room.getSize());// 숙소이름 로징객체가 널  왜이제보니 setSize 인데 getRoomName일까??
			reserveDetail.setPrice(room.getPrice());// 객실 가격
			reserveDetail.setImagePath(lodging.getImagePath());// 사진은 숙소사진
			reserveDetail.setStartDate(reserve.getStartDate());
			reserveDetail.setEndDate(reserve.getEndDate());

			reserveDetailList.add(reserveDetail);
		}

		return reserveDetailList;
	}
	
	// 예약 한행 정보 조회(예약페이지조회)
//	public ReserveDetail getReserveInfoById(int userId) {
//			
//		return reserveDAO.selectReserveInfoById(userId);
//		
//	}
	// 예약 취소
	public int deleteReserve(int userId, int id) {
		return reserveDAO.deleteReserve(userId, id);
	}

}
