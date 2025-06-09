package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ReserveDetail {//예약 카드에 필요한 데이터들 예약 상세정보까지
		
	private int id; // 몇번째 저장
	private int userId; // 누가 저장했는지
	private int lodgingId;//어떤 숙소인지 (다시예약시 링크 들어갈려면 필요)
	private int roomId; //어떤 객실인지
	private String name;//예약자 이름
	private String phoneNumber;// 예약자 핸드폰 번호
	private String roomName;//숙소명
	private String size;// 객실 사이즈
	private int price;// 객실 가격
	private String imagePath;//사진
	private Date startDate;
	private Date endDate;//예약 날짜 이거를 체크인 / 체크아웃으로 분류
}
