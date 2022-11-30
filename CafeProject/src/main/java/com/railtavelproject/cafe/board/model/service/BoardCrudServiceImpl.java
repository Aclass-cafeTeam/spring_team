package com.railtavelproject.cafe.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	// 글양식 조회
	@Override
	public List<Map<String, Object>> selectWritingFormType() {
		return dao.selectWritingFormType();
	}

	
	// 게시글 작성
	@Override
	public int writeBoard(Board board) {
		return dao.writeBoard(board);
	}
	
}
