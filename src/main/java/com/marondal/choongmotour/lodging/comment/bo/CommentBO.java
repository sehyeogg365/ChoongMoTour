package com.marondal.choongmotour.lodging.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.common.FileManagerService;
import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.comment.dao.CommentDAO;
import com.marondal.choongmotour.lodging.model.Comment;
import com.marondal.choongmotour.lodging.model.CommentDetail;
import com.marondal.choongmotour.lodging.model.Lodging;
import com.marondal.choongmotour.lodging.model.Room;
import com.marondal.choongmotour.user.bo.UserBO;
import com.marondal.choongmotour.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LodgingBO lodgingBO;
	
	@Autowired
	private CommentDAO commentDAO;
	
	//댓글 작성
	public int addComment(int roomId, int userId, MultipartFile file, String content, double starpoint) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return commentDAO.insertComment(roomId, userId, imagePath, content, starpoint);
		
		
	}
	
	//댓글 목록
	
	public List<CommentDetail> getCommentList(int roomId){
		
		List<Comment> commentList = commentDAO.selectCommentList(roomId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		
		for (Comment comment : commentList) {
					
			User user = userBO.getUserInfo(comment.getUserId());
			
			Room room = lodgingBO.getRoom(comment.getRoomId());
			
			CommentDetail commentDetail = new CommentDetail();
			
			
			
			commentDetail.setId(comment.getId());
			commentDetail.setUserId(user.getId());
			commentDetail.setRoomId(comment.getRoomId());
			commentDetail.setImagePath(comment.getImagePath());// 첨부 파일
			commentDetail.setContent(comment.getContent());// 댓글 내용
			commentDetail.setStarpoint(comment.getStarpoint());//별점
			commentDetail.setSize(room.getSize());//객실 사이즈
			commentDetail.setNickname(user.getNickname());//닉네임
			commentDetail.setCreatedAt(comment.getCreatedAt());// 작성 날짜
			
			commentDetailList.add(commentDetail);
		}
		
		
		
		return commentDetailList;
		
		
	}

	//댓글 한행조회 
	public Comment getComment(int id) {
		
		return commentDAO.selectComment(id);
	}
	
	
	//댓글 삭제
	
	public int deleteComment(int roomId) {
		
		//파일 있을때 파일도 삭제
		
//		Comment comment = commentDAO.selectComment(roomId);//몇몇 호텔의 댓삭이 안이뤄지는 상황.
//		FileManagerService.removeFile(comment.getImagePath());
		
		return commentDAO.deleteComment(roomId);
		
		
	}
	
	
	

}
