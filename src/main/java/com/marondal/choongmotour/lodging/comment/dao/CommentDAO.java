package com.marondal.choongmotour.lodging.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {
	
	//댓글 추가
	public int insertComment(@Param("roomId") int roomId
							, @Param("userId") int userId
							, @Param("imagePath") String imagePath
							, @Param("content") String content
							, @Param("starpoint") double starpoint
					);
	
	
	//댓글 리스트
	
	//댓글 삭제
}
