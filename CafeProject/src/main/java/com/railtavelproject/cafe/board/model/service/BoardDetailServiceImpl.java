package com.railtavelproject.cafe.board.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.board.model.dao.BoardDetailDAO;
import com.railtavelproject.cafe.board.model.vo.Board;

@Service
public class BoardDetailServiceImpl implements BoardDetailService{
	
	@Autowired
	private BoardDetailDAO dao;

	// 게시글 상세조회
	@Override
	public Board selectBoardDetail(int boardNo) {

		return dao.selectBoardDetail(boardNo);
	}

	// 게시글 상세조회 성공시 조회수 증가
	@Override
	public int updateReadCount(int boardNo) {

		return dao.updateReadCount(boardNo);
	}

	// 좋아요 여부 체크
	@Override
	public int boardLikeCheck(Map<String, Object> map) {

		return dao.boardLikeCheck(map);
	}
	
	// 좋아요 수 증가
	@Override
	public int boardLikeUp(Map<String, Object> paramMap) {

		return dao.boardLikeUp(paramMap);
	}

	// 좋아요 수 감소
	@Override
	public int boardLikeDown(Map<String, Object> paramMap) {
		return dao.boardLikeDown(paramMap);
	}

}
