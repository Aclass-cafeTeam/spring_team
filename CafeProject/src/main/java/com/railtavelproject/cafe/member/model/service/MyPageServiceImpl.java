package com.railtavelproject.cafe.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.railtavelproject.cafe.member.model.dao.MyPageDAO;
import com.railtavelproject.cafe.member.model.vo.Member;
import com.railtavelproject.cafe.member.model.vo.MyPageBoard;
import com.railtavelproject.cafe.member.model.vo.MyPagePagination;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	

	// 회원 탈퇴
	@Transactional
	@Override
	public int secession(int memberNo, String memberPw) {
		
		// 현재 비밀번호 조회
		String nowPw = dao.selectCurrentPw(memberNo);
		
		// 암호화된 비밀번호와 현재 비밀번호 일치하는지 확인
		if (bcrypt.matches(memberPw, nowPw)) return dao.secession(memberNo);
		
		return 0;
	}


	// 로그인한 회원이 작성한 글 목록 조회 + 페이징 처리 계산
	@Override
	public Map<String, Object> selectMyPageBoard(int memberNo, int cp) {
		
		// 1. 로그인한 회원이 작성한 전체 게시글 수 조회(단, 삭제 제외)
		int myListCount = dao.getMyListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(myListCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myPageBoardList = dao.selectMyPageBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myPageBoardList", myPageBoardList);
		
		return map;
	}


	// 로그인한 회원이 댓글 단 글 목록 조회 + 페이징
	@Override
	public Map<String, Object> selectMyCommentBoard(int memberNo, int cp) {
		// 1. 로그인한 회원이 댓글을 작성한 전체 게시글 수 조회(단, 댓글을 삭제한 게시글 제외)
		int commentListCount = dao.getCommentListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(commentListCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myCommentBoardList = dao.selectMyCommentBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myCommentBoardList", myCommentBoardList);
		
		return map;
	}


	// 로그인한 회원이 좋아요 한 글 목록 조회 + 페이징
	@Override
	public Map<String, Object> selectMyLikeBoard(int memberNo, int cp) {
		
		// 1. 로그인한 회원이 좋아요를 누른 전체 게시글 수 조회(단, 삭제된 게시글 제외)
		int likeListCount = dao.getLikeListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(likeListCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myLikeBoardList = dao.selectMyLikeBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myLikeBoardList", myLikeBoardList);
		
		return map;
	}


	// 로그인한 회원이 삭제한 글 목록 조회 + 페이징
	@Override
	public Map<String, Object> selectMyDeleteBoard(int memberNo, int cp) {
		
		// 1. 로그인한 회원이 삭제한 전체 게시글 수 조회
		int deleteListCount = dao.getDeleteListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(deleteListCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myDeleteBoardList = dao.selectMyDeleteBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myDeleteBoardList", myDeleteBoardList);
		
		return map;
	}




}
