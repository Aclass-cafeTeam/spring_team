package com.railtavelproject.cafe.main.model.service;

import java.util.ArrayList;
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

	
	// 사이드메뉴(카테고리명+게시판명) 조회
	@Override
	public List<Map<String, Object>> selectMainList() {
		return dao.selectMainList();
	}

	// 당일 방문 수 조회
	@Override
	public int todayVisitCount() {
		
		int todayVisitCount = dao.todayVisitCount();
		
		return todayVisitCount;
	}

	// 전체 방문수 조회
	@Override
	public int AllVisitCount() {
		
		int allVisitCount = dao.allVisitCount();
		
		return allVisitCount;
	}

	// 댓글 랭킹
	@Override
	public Map<String, Object> commentRank() {
		
		List<IntroBoard> commentRankList = dao.commentRank();
		
		Map<String, Object> commentRank = new HashMap<String, Object>();
		commentRank.put("commentRankList", commentRankList);
				
		return commentRank;
	}

	// 멤버 랭킹-게시글
	@Override
	public Map<String, Object> boardRank() {
		List<IntroBoard> boardRankList = dao.boardRank();
		
		Map<String, Object> boardRank = new HashMap<String, Object>();
		boardRank.put("boardRankList", boardRankList);
				
		return boardRank;
	}
	
	// 멤버 랭킹-로그인
	@Override
	public Map<String, Object> loginRank() {
		List<IntroBoard> loginRankList = dao.loginRank();
		
		Map<String, Object> loginRank = new HashMap<String, Object>();
		loginRank.put("loginRankList", loginRankList);
				
		return loginRank;
	}

	// 회원 수 조회
	@Override
	public int memberCount() {
		
		int memberCount = dao.memberCount();
		return memberCount;
	}

	// 게시글 랭킹-좋아요
	@Override
	public Map<String, Object> boardLike() {
		List<IntroBoard> boardLikeList = dao.boardLike();
		
		Map<String, Object> boardLike = new HashMap<String, Object>();
		boardLike.put("boardLikeList", boardLikeList);
				
		return boardLike;
	}

	// 게시글 랭킹-댓글
	@Override
	public Map<String, Object> boardComment() {
		List<IntroBoard> boardCommentList = dao.boardComment();
		
		Map<String, Object> boardComment = new HashMap<String, Object>();
		boardComment.put("boardCommentList", boardCommentList);
				
		return boardComment;
	}

	// 멤버 소식 - 방문
	@Override
	public Map<String, Object> memberVisit() {
		List<IntroBoard> memberVisitList = dao.memberVisit();
		
		Map<String, Object> memberVisit = new HashMap<String, Object>();
		memberVisit.put("memberVisitList", memberVisitList);
				
		return memberVisit;
	}

	// 멤버 소식 - 신입
	@Override
	public Map<String, Object> memberNew() {
		List<IntroBoard> memberNewList = dao.memberNew();
		
		Map<String, Object> memberNew = new HashMap<String, Object>();
		memberNew.put("memberNewList", memberNewList);
				
		return memberNew;
	}

	// 최근 게시글 - 게시글
	@Override
	public Map<String, Object> newBoard() {
		List<IntroBoard> newBoardList = dao.newBoard();
		
		Map<String, Object> newBoard = new HashMap<String, Object>();
		newBoard.put("newBoardList", newBoardList);
				
		return newBoard;
	}

	@Override
	public Map<String, Object> newComment() {
		List<IntroBoard> newCommentList = dao.newComment();
		
		Map<String, Object> newComment = new HashMap<String, Object>();
		newComment.put("newCommentList", newCommentList);
		
		return newComment;
	}

	@Override
	public Map<String, Object> cafeInfo() {
		List<IntroBoard> cafeInfoList = dao.cafeInfo();
		
		Map<String, Object> cafeInfo = new HashMap<String, Object>();
		cafeInfo.put("cafeInfoList", cafeInfoList);
		
		return cafeInfo;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
