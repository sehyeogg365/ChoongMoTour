package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LodgingDetail {//숙소카드 하나에 필요한 데이터들
	private int id;
	private String roomName;
	private boolean isDibs;//찜했는지 안했는지 여부	
	private String level;
	private String areaName;
	private String imagePath;//여기에 댓글개수, 평균평점도 추가

	private Integer singleRoomPrice;
	private Integer commentCount;
	private double avgStarPoint;
	private String sortType;
}
