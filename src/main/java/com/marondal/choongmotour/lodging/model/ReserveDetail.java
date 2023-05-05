package com.marondal.choongmotour.lodging.model;

import java.util.Date;

public class ReserveDetail {//예약 카드에 필요한 데이터들 예약 상세정보까지
		
	private int id; // 몇번째 저장
	private int userId; // 누가 저장했는지
	private int lodgingId;//어떤 숙소인지 (다시예약시 링크 들어갈려면 필요)
	private String name;//예약자 이름
	private String phoneNumber;// 예약자 핸드폰 번호
	private String roomName;//숙소명
	private String size;// 객실 사이즈
	private int price;// 객실 가격
	private String imagePath;//사진
	private Date reserveDate;//예약 날짜 이거를 체크인 / 체크아웃으로 분류
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
	public int getLodgingId() {
		return lodgingId;
	}
	public void setLodgingId(int lodgingId) {
		this.lodgingId = lodgingId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
