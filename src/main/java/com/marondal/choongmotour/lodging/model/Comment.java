package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
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
}
