package com.marondal.choongmotour.lodging.comment.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 댓글 작성
	public int addComment(int lodgingId, int userId, String size, MultipartFile file, String content, double starpoint) {
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return commentDAO.insertComment(lodgingId, userId, size, imagePath, content, starpoint);
	}
	
	// 댓글 목록	
	public List<CommentDetail> getCommentList(int lodgingId){
		List<Comment> commentList = commentDAO.selectCommentList(lodgingId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();

		for (Comment comment : commentList) {
					
			User user = userBO.getUserInfo(comment.getUserId());
			// Lodging lodging = lodgingBO.getLodging(lodgingId);
			// 근데 알다시피 밑에 값들은 카드 한장에 들어가는 값이라서 리스트는 불필요 함
			CommentDetail commentDetail = new CommentDetail();

			commentDetail.setId(comment.getId());
			commentDetail.setUserId(user.getId());
			commentDetail.setLodgingId(comment.getLodgingId());
			commentDetail.setImagePath(comment.getImagePath());// 첨부 파일
			commentDetail.setContent(comment.getContent());// 댓글 내용
			commentDetail.setStarpoint(comment.getStarpoint());// 별점
			commentDetail.setSize(comment.getSize());// 객실 사이즈
			commentDetail.setNickname(user.getNickname());// 닉네임
			commentDetail.setCreatedAt(comment.getCreatedAt());// 작성 날짜
			
			commentDetailList.add(commentDetail);
		}

		return commentDetailList;
	}

	// 댓글 한행조회 
	public Comment getComment(int id, int userId) {// 옥의티 발견 여기서 id, userId일텐데 lodgingId->id
		return commentDAO.selectComment(id, userId);
	}

	// 댓글 삭제	
	public int deleteComment(int id, int userId) {
		// 파일 있을때 파일도 삭제
		Comment comment = commentDAO.selectComment(id, userId);// 몇몇 호텔의 댓삭이 안이뤄지는 상황.
		FileManagerService.removeFile(comment.getImagePath());// userId추가해서 제대로 해보기 이제보니 첨에는 다오에선 id 여기선 roomId였다는... 그러니 500이뜨지.
		
		return commentDAO.deleteComment(id, userId);
	}

	//댓글 개수, 댓글 평균평점
	public Map<String, Object> getCommentCountStarPoint (int lodgingId){
		Map<String, Object> result = new HashMap<String, Object>();

		Integer commentCount = commentDAO.selectCommentCount(lodgingId);

		Double avgStarPoint = commentDAO.selectStarPoint(lodgingId);

		result.put("commentCount", commentCount);
		result.put("avgStarPoint", avgStarPoint);

		return result;
	}

	//댓글 갯수
	public Integer getCommentCount (int lodgingId){
		return commentDAO.selectCommentCount(lodgingId);
	}

	//댓글 평균평점
	public Double getStarPoint (int lodgingId){
		return commentDAO.selectStarPoint(lodgingId);
	}

}
