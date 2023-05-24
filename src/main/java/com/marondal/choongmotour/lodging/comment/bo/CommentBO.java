package com.marondal.choongmotour.lodging.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.choongmotour.common.FileManagerService;
import com.marondal.choongmotour.lodging.bo.LodgingBO;
import com.marondal.choongmotour.lodging.comment.dao.CommentDAO;

@Service
public class CommentBO {
	
	@Autowired
	private LodgingBO lodgingBO;
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int roomId, int userId, MultipartFile file, String content, double starpoint) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return commentDAO.insertComment(roomId, userId, imagePath, content, starpoint);
		
		
	}
	

	
	
	
	
	
	

}
