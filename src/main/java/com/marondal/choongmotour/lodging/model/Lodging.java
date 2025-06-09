package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Lodging {
	private int id;
	private int adminId;
	private String roomName;
	private String imagePath;
	private String level;
	private String areaName;
	private Date createdAt;
	private Date updatedAt;
}
