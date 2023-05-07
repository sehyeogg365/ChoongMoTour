package com.marondal.choongmotour.lodging.model;

public class DibsDetail {// 찜 카드에 필요한 데이터들
	private int id; //몇번째 찜했는지 
	private int userId; //누가 저장했는지
	private int lodgingId; // 어떤숙소인지
	private int roomId;
	private String roomName; //숙소명
	private String areaName; //지역
	private String imagePath; //사진 등
	//가만생각해보니 roomId도 안넣었는데 어떻게 가격이 나오는가? 근데 생각해보면 싱글룸 가격을 넣는게 되게 복잡하니 넣지 말자.
	
	// 찜했냐 안했냐 여부 생각해보니 여긴 필요가없다. 그냥 빨간하트 한번 누르면 삭제되는 개념이라서 당연히 찜 누른게 여기 목록에있는거라서
	

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

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
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

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	
	
}
