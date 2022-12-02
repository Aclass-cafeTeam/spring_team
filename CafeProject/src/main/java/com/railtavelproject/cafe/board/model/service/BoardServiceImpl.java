package com.railtavelproject.cafe.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.board.model.dao.BoardDAO;
import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.board.model.vo.Pagination;
import com.railtavelproject.cafe.main.model.vo.IntroBoard;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO dao;

	// 게시판 이름 목록 조회
	@Override
	public List<Map<String, Object>> selectBoardType() {
		return dao.selectBoardType();
	}
	
	// 특정 게시글 조회 + 페이징 처리
	@Override
	public Map<String, Object> selectBoardList(int boardCode, int cp) {
		
		int listCount = dao.getListCount(boardCode);
		
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Board> boardList = dao.selectBoardList(pagination, boardCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}

	@Override
	public Map<String, Object> selectBoardNoticeList(int boardCode) {
		
		List<Board> noticeList = dao.selectBoardNoticeList(boardCode);
		
		Map<String, Object> notice = new HashMap<String, Object>();
		
		notice.put("noticeList", noticeList);
		
		return notice;
	}

	@Override
	public Map<String, Object> selectBoardAllList(int cp) {
		
		int allListCount = dao.getAllListCount();
		
		Pagination pagination = new Pagination(allListCount, cp);
		
		List<Board> allList = dao.selectBoardAllList(pagination);
		
		Map<String, Object> all = new HashMap<String, Object>();
		all.put("pagination", pagination);
		all.put("allList", allList);
		
		return all;
	}

//	@Override
//	public Map<String, Object> selectBoardList(Map<String, Object> pm, int cp) {
//		
//		int listCount = dao.getListCount(pm);
//		
//		Pagination pagination = new Pagination(listCount, cp);
//		
//		List<Board> boardList = dao.selectBoardList(pagination, pm);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pagination", pagination);
//		map.put("boardList", boardList);
//		
//		return map;
//	}



	
}
