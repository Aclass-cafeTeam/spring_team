package com.railtavelproject.cafe.main.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.main.model.dao.IntroDAO;
import com.railtavelproject.cafe.main.model.vo.IntroBoard;

@Service
public class IntroServiceImpl implements IntroService{
	
	@Autowired
	private IntroDAO dao;

	// 전체글 불러오기
	@Override
	public Map<String, Object> introBoardList() {

		List<IntroBoard> introBoardList = dao.introBoardList();
		
		Map<String, Object> boardList = new HashMap<String, Object>();
		boardList.put("introBoardList", introBoardList);
		
		return boardList;
	}

	// 공지만 불러오기
	@Override
	public Map<String, Object> noticeList() {
		
		List<IntroBoard> introNoticeList = dao.noticeList();
		
		Map<String, Object> noticeList = new HashMap<String, Object>();
		noticeList.put("introNoticeList", introNoticeList);
		
		return noticeList;
	}

	// 여행후기 게시판
	@Override
	public Map<String, Object> travelReview() {
		
		List<IntroBoard> introTravelReviewList = dao.travelReview();
		
		Map<String, Object> travelReviewList = new HashMap<String, Object>();
		travelReviewList.put("introTravelReviewList", introTravelReviewList);
		
		return travelReviewList;
	}
	
	
	
	
	

}
