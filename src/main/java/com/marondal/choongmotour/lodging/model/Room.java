package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Room {
	private int id;
	private int adminId;
	private int lodgingId;
	private String imagePath;
	private int price;
	private String size;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
