package com.marondal.choongmotour.lodging.model;

public class LodgingCount {
	private int id;
	private String areaName;//지역명
	private int numberCount;//숙소 갯수
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public int getNumberCount() {
		return numberCount;
	}
	public void setNumberCount(int numberCount) {
		this.numberCount = numberCount;
	}
	
}
