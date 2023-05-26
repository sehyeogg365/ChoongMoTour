package com.marondal.choongmotour.lodging.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.choongmotour.lodging.model.Comment;

@Repository
public interface CommentDAO {
	
	//댓글 작성
	public int insertComment(@Param("roomId") int roomId
							, @Param("userId") int userId
							, @Param("imagePath") String imagePath
							, @Param("content") String content
							, @Param("starpoint") double starpoint
					);
	
	
	//댓글 리스트
	public List<Comment> selectCommentList(@Param("roomId") int roomId , @Param("userId") int userId);
	
	
	
	
	//댓글 삭제
}
