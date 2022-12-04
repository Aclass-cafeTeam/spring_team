package com.railtavelproject.cafe.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.member.model.dao.MemberInfoDAO;
import com.railtavelproject.cafe.member.model.vo.Member;
import com.railtavelproject.cafe.member.model.vo.MyPageBoard;
import com.railtavelproject.cafe.member.model.vo.MyPagePagination;

@Service
public class MemberInfoServiceImpl implements MemberInfoService{
	
	@Autowired
	private MemberInfoDAO dao;

	// 회원 정보 페이지 특정 회원이 작성한 글 목록
	@Override
	public Map<String, Object> selectMemberBoard(int memberNo, int cp) {
		
		// 1. 특정 회원의 회원 정보 받아오기
		Member memberInfo = dao.selectMemberInfo(memberNo);
		
		// 2. 특정 회원이 작성한 전체 게시글 수 조회(단, 삭제된 게시글 제외)
		int listCount = dao.getListCount(memberNo);
		
		// 3. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(listCount, cp);
		
		// 4. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> memberBoardList = dao.selectMemberBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberInfo", memberInfo);
		map.put("pagination", pagination);
		map.put("memberBoardList", memberBoardList);
		
		return map;
	}

	
	

}
