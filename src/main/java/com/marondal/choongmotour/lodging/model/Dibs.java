package com.marondal.choongmotour.lodging.model;

import java.util.Date;

public class Dibs {
	private int id;
	private int userId;
	private int lodgingId;
	//private String roomName;
	//private String areaName;
	//private String imagePath;
	private boolean isDibs;
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
	public boolean isDibs() {
		return isDibs;
	}
	public void setDibs(boolean isDibs) {
		this.isDibs = isDibs;
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
