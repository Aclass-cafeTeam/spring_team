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


	// 내가 쓴 글 목록 조회 + 페이징 처리 계산
	@Override
	public Map<String, Object> selectMyPageBoard(int memberNo, int cp) {
		
		// 1. 로그인한 회원이 작성한 전체 게시글 수 조회(단, 삭제 제외)
		int listCount = dao.getListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(listCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myPageBoardList = dao.selectMyPageBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myPageBoardList", myPageBoardList);
		
		return map;
	}




}
