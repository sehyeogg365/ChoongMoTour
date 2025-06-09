package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Reserve {
	private int id;
	private int userId;
	private int roomId; //이 roomId 하나에 또 숙소정보도 당연히 다 불러올수 있다고 한다.
	private String name;
	private String phoneNumber;
	private Date startDate; 
	private Date endDate; //체크인 체크아웃 날짜 구분
	private String payment;
	private Date createdAt;
	private Date updatedAt;
}
