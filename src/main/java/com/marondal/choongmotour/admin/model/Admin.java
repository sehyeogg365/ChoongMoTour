package com.marondal.choongmotour.admin.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Admin {//lombok도 한번써보기
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
