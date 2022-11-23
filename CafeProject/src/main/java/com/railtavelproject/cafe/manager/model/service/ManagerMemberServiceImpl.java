package com.railtavelproject.cafe.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.manager.model.dao.ManagerMemberDAO;
import com.railtavelproject.cafe.manager.model.vo.Member;
import com.railtavelproject.cafe.manager.model.vo.Pagination;

@Service
public class ManagerMemberServiceImpl implements ManagerMemberService{
	@Autowired
	private ManagerMemberDAO dao;

	@Override
	public int memberCount() {
		int mainMemberCount = dao.memberCount();
		return mainMemberCount;
	}

	@Override
	public int boardCount() {
		int mainBoardCount = dao.boardCount();
		return mainBoardCount;
	}

	@Override
	public Map<String, Object> selectMemberList(int limit, int cp) {
		// 1.특정 게시판의 전체 게시글 수 조회(단, 삭제 제외)
				int listCount = dao.getListCount();
				
				// 2. 전체 게시글 수 + cp(현재 페이지)이용해서 
				// 페이징 처리 객체 생성
				Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
				
				// 3. 페이징 처리객체를 이용해서 게시글 목록 조회
				List<Member> memberList = dao.selectMemberList(pagination); 
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("pagination", pagination);
				map.put("memberList",memberList);
				
				return map;
	}

	/**
	 * 등급별 멤버 상세 조회
	 */
	@Override
	public Map<String, Object> selectSortLevelMemberList(int memberLevelNoResult, int limit, int cp) {
		int listCount = dao.getSortLevelMemberListCount(memberLevelNoResult);
		// 2. 전체 게시글 수 + cp(현재 페이지)이용해서 
		// 페이징 처리 객체 생성
		System.out.println(listCount);
		Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
		
		// 3. 페이징 처리객체를 이용해서 게시글 목록 조회
		List<Member> memberList = dao.selectSortLevelMemberList(memberLevelNoResult,pagination); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("memberList",memberList);
		
		return map;
	}

	@Override
	public Map<String, Object> selectInputMember(int srchOption,String inputMember, int limit, int cp) {
		int listCount =1;
		
		// 2. 전체 게시글 수 + cp(현재 페이지)이용해서 
		// 페이징 처리 객체 생성
		Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
				
		// 3. 페이징 처리객체를 이용해서 게시글 목록 조회
		List<Member> memberList = dao.selectInputMember(srchOption,inputMember,pagination); 
		System.out.println(memberList+"값이 뭐야");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("memberList",memberList);
		
		return map;
	}

	/**
	 * 작성한 게시글 수에 따른 멤버 상세 조회
	 */
	@Override
	public Map<String, Object> selectDetailBoard(int periodOption, int articleCountInput, int aboveOption,
			int memberLevelNoResult, int limit, int cp) {
		
		int listCount = dao.getselectDetailBoardCount(memberLevelNoResult,periodOption,articleCountInput,aboveOption);

		
		// 2. 전체 게시글 수 + cp(현재 페이지)이용해서 
		// 페이징 처리 객체 생성
		System.out.println(listCount);
		Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
			
		// 3. 페이징 처리객체를 이용해서 게시글 목록 조회
		List<Member> memberList; 
		
		memberList = dao.getselectDetailBoard(memberLevelNoResult,periodOption,articleCountInput,aboveOption,pagination);

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("memberList",memberList);
		
		return map;
	}

	/**
	 * 댓글 상세조회 검색
	 */
	@Override
	public Map<String, Object> selectDetailComment(int periodOption, int commentCountInput, int aboveOption,
			int memberLevelNoResult, int limit, int cp) {
		
		int listCount = dao.getselectDetailCommentCount(memberLevelNoResult,periodOption,commentCountInput,aboveOption);
		
		Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
		List<Member> memberList; 
		
		memberList = dao.getselectDetailComment(memberLevelNoResult,periodOption,commentCountInput,aboveOption,pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("memberList",memberList);
		
		return map;
	}

	@Override
	public Map<String, Object> selectDetailVisitCount(int periodOption, int visitCountInput, int aboveOption,
			int memberLevelNoResult, int limit, int cp) {

		int listCount = dao.getselectDetailVisitCount(memberLevelNoResult,periodOption,visitCountInput,aboveOption);
		
		Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
		List<Member> memberList; 
		
		memberList = dao.getselectDetailVisit(memberLevelNoResult,periodOption,visitCountInput,aboveOption,pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("memberList",memberList);
		
		return map;
	}
	
}
