package com.marondal.choongmotour.user.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class User {
	private int id;
	private String loginId;
	private String password;
	private String name;
	private String email;
	private String phoneNumber;
	private String nickname;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
}
