package com.marondal.choongmotour.lodging.model;

import java.util.Date;

public class Comment {
	
	private int id;
	private int userId;
	private int lodgingId;
	private String size;
	private String content;
	private double starpoint;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
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
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(double starpoint) {
		this.starpoint = starpoint;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	
	
}
