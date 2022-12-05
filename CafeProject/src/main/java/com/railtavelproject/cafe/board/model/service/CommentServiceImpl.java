package com.railtavelproject.cafe.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.board.model.dao.CommentDAO;
import com.railtavelproject.cafe.board.model.vo.Comment;
import com.railtavelproject.cafe.common.Util;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDAO dao;
	
	// 댓글 목록 조회
	@Override
	public List<Comment> selectCommentList(int boardNo) {
		
		return dao.selectCommentList(boardNo);
	}

	// 댓글 등록
	@Override
	public int insertComment(Comment comment) {

		// XSS 방지, 개행 문자 처리
		comment.setCommentContent(Util.XSSHandling(comment.getCommentContent()));
		
		comment.setCommentContent(Util.newLineHandling(comment.getCommentContent()));
		
		return dao.insertComment(comment);
	}

}
