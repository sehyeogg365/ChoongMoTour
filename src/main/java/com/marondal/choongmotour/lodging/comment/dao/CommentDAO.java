package com.marondal.choongmotour.lodging.comment.dao;

import java.util.List;

import com.marondal.choongmotour.lodging.model.CommentDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.choongmotour.lodging.model.Comment;

@Repository
public interface CommentDAO {
	
	//댓글 작성
	public int insertComment(@Param("lodgingId") int lodgingId
							, @Param("userId") int userId
							, @Param("size") String size
							, @Param("imagePath") String imagePath
							, @Param("content") String content
							, @Param("starpoint") double starpoint
					);

	//댓글 리스트
	public List<Comment> selectCommentList(@Param("lodgingId") int lodgingId);

	//댓글 한행?
	public Comment selectComment(@Param("id") int id, @Param("userId") int userId);

	//댓글 삭제	
	public int deleteComment(@Param("id") int id, @Param("userId") int userId);
	
	//댓글 개수
	public Integer selectCommentCount(@Param("lodgingId") int lodgingId);
	
	//댓글 평균평점
	public Double selectStarPoint(@Param("lodgingId") int lodgingId);
}

