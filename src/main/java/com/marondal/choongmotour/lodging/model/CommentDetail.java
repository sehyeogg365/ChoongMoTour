package com.marondal.choongmotour.lodging.model;

import java.util.Date;

public class CommentDetail {

	private int id;
	private int userId;
	private int roomId;
	private int lodgingId;	
	private String content;
	private String nickname;
	private String imagePath;
	private String size;
	private double starpoint;	
	private Date createdAt;
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
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public int getLodgingId() {
		return lodgingId;
	}
	public void setLodgingId(int lodgingId) {
		this.lodgingId = lodgingId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public double getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(double starpoint) {
		this.starpoint = starpoint;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	
	
	
}
