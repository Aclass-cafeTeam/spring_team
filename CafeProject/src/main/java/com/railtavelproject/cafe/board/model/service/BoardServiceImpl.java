package com.railtavelproject.cafe.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.board.model.dao.BoardDAO;
import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.board.model.vo.ImgPagination;
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

	// 게시판 별 공지 게시글 조회
	@Override
	public Map<String, Object> selectBoardNoticeList(int boardCode) {
		
		List<Board> noticeList = dao.selectBoardNoticeList(boardCode);
		
		Map<String, Object> notice = new HashMap<String, Object>();
		
		notice.put("noticeList", noticeList);
		
		return notice;
	}

	// 전체 게시글 조회
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

	// 베스트 게시글 조회 (좋아요 높은 순)
	@Override
	public Map<String, Object> selectBoardBestList(int cp) {
		
		int allListCount = dao.getAllListCount();
		
		Pagination pagination = new Pagination(allListCount, cp);
		
		List<Board> bestList = dao.selectBoardBestList(pagination);
		
		Map<String, Object> best = new HashMap<String, Object>();
		best.put("pagination", pagination);
		best.put("bestList", bestList);
		
		return best;
	}

	// 검색 목록 조회
	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> pm, int cp) {
		
		int listCount = dao.getListCount(pm);
		
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Board> boardList = dao.selectBoardList(pagination, pm);
		
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("pagination", pagination);
		search.put("boardList", boardList);
		
		return search;
	}

	// 전체 공지 목록 조회
	@Override
	public Map<String, Object> selectBoardAllNoticeList(int boardCode) {
		
		List<Board> allNoticeList = dao.selectBoardAllNoticeList(boardCode);
		
		Map<String, Object> allNotice = new HashMap<String, Object>();
		
		allNotice.put("allNoticeList", allNoticeList);
		
		return allNotice;
	}

	// 앨범형 게시글 목록 조회
	@Override
	public Map<String, Object> selectBoardImgList(int boardCode, int cp) {
		
		int listCount = dao.getAlbumListCount(boardCode);
		
		System.out.println(listCount);
		System.out.println("**********"+cp);
		ImgPagination imgPagination = new ImgPagination(listCount, cp);
		
		List<Board> boardList = dao.selectBoardImgList(imgPagination, boardCode);
		
		Map<String, Object> img = new HashMap<String, Object>();
		img.put("imgPagination", imgPagination);
		img.put("boardList", boardList);
		
		return img;
	}

	// 앨범형 게시글 별 공지 목록 조회
	@Override
	public Map<String, Object> selectBoardAlbumNoticeList(int boardCode) {
		
		List<Board> albumNoticeList = dao.selectBoardAlbumNoticeList(boardCode);
		
		Map<String, Object> albumNotice = new HashMap<String, Object>();
		
		albumNotice.put("albumNoticeList", albumNoticeList);
		
		return albumNotice;
	}



	
}
