package com.railtavelproject.cafe.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.railtavelproject.cafe.board.model.service.CommentService;
import com.railtavelproject.cafe.board.model.vo.Comment;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService service;
	
	// 댓글 목록 조회
	@GetMapping("/list")
	public String selectCommentList(int boardNo) {
		List<Comment> commentList = service.selectCommentList(boardNo);
		
		return new Gson().toJson(commentList); // JSON 형태로 변환(GSON 라이브러리 이용)
	}


}
