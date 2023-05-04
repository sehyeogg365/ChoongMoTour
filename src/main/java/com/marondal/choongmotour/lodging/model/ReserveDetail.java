package com.marondal.choongmotour.lodging.model;

import java.util.Date;

public class ReserveDetail {//예약 카드에 필요한 데이터들
		
	private int id;
	private int userId;
	//숙소명
	private String roomName;
	//사이즈
	private String size;
	//사진
	private String imagePath;
	//예약 날짜
	private Date reserveDate;
	//
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}
	
	
}
