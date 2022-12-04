package com.railtavelproject.cafe.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.board.model.dao.CommentDAO;
import com.railtavelproject.cafe.board.model.vo.Comment;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDAO dao;
	
	// 댓글 목록 조회
	@Override
	public List<Comment> selectCommentList(int boardNo) {
		
		return dao.selectCommentList(boardNo);
	}

}
