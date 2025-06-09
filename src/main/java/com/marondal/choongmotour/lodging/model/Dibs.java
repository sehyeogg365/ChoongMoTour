package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Dibs {
	private int id;
	private int userId;
	private int lodgingId;
	private boolean isDibs;
	private Date createdAt;
	private Date updatedAt;
}
