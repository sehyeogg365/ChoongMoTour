package com.marondal.choongmotour.lodging.model;

public class DibsDetail {// 찜 카드에 필요한 데이터들
	private int id; //몇번째 찜했는지 
	private int userId; //누가 저장했는지
	private int lodgingId; // 어떤숙소인지
	private String roomName; //숙소명
	private String areaName; //지역
	private int price; //가격
	private boolean isDibs; // 찜했냐 안했냐 여부
	private String imagePath; //사진 등
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean isDibs() {
		return isDibs;
	}
	public void setDibs(boolean isDibs) {
		this.isDibs = isDibs;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
}
