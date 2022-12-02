package com.railtavelproject.cafe.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.railtavelproject.cafe.board.model.dao.BoardCrudDAO;
import com.railtavelproject.cafe.board.model.vo.Board;

@Service
public class BoardCrudServiceImpl implements BoardCrudService{
	
	@Autowired
	private BoardCrudDAO dao;

	// 태그 조회
	@Override
	public List<Map<String, Object>> selectTitleTag() {
		return dao.selectTitleTag();
	}


	
	// 게시글 작성
	@Override
	public int writeBoard(Board board) {
		return dao.writeBoard(board);
	}

	// 게시글 삭제
	@Override
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}

	// 임시 저장
	@Override
	public int tempPost(Board board) {
		return dao.tempPost(board);
	}

	// 게시글 상세 조회
	@Override
	public Board boardDetail(int boardNo) {
		return dao.boardDetail(boardNo);
	}

}
