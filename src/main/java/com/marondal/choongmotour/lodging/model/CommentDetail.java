package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CommentDetail {
	private int id;
	private int userId;
	private int lodgingId;		
	private String size;
	private String content;
	private String nickname;
	private String imagePath;
	private Integer commentCount;
	private double starpoint;
	private double avgStarPoint;
	private Date createdAt;

	//2024-04-10 페이지네이션 관련 변수들 추가
	private Integer SIZE;
	private Integer PAGE;				//현재페이지번호
	private Integer COUNTLIST;			//한 페이지에 출력될 게시물 수 (
	private Integer BEGIN;
	private Integer TOTALDATA;
}
