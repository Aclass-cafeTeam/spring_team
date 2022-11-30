package com.railtavelproject.cafe.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	/** 탈퇴를 제외한 모든 회원들 조회한 화면
	 *
	 */
	@Override
	public Map<String, Object> selectMemberList(int limit, int cp) {

				int listCount = dao.getListCount();
			
				Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
				
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

	/**멤버 아이디랑 별명에 따른 상세검색
	 *
	 */
	@Override
	public Map<String, Object> selectInputMember(int srchOption,String inputMember, int limit, int cp) {
		int listCount =1;
		
		// 2. 전체 게시글 수 + cp(현재 페이지)이용해서 
		// 페이징 처리 객체 생성
		Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
				
		// 3. 페이징 처리객체를 이용해서 게시글 목록 조회
		List<Member> memberList = dao.selectInputMember(srchOption,inputMember,pagination); 
		
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

	/** 방문수에 따른 상세조회
	 *
	 */
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

	/**가입일이랑 최종방문일에 따른 상세조회
	 *
	 */
	@Override
	public Map<String, Object> selectDetailDate(int entryType, String startDateInput, String endDateInput,
			int memberLevelNoResult, int limit, int cp) {
		
		int listCount = dao.selectDetailDateCount(memberLevelNoResult,entryType,startDateInput,endDateInput);
		
		Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
		List<Member> memberList; 
		
		memberList = dao.selectDetailDate(memberLevelNoResult,entryType,startDateInput,endDateInput,pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("memberList",memberList);
		
		return map;
	}

	@Override
	public Map<String, Object> selectStopMemberList(int limit, int cp, String memberEmail) {
		
		int listCount = dao.selectStopMemberListCount(memberEmail);
		
		Pagination pagination = new Pagination(listCount,cp,limit,5); //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
		
		List<Member> memberList = dao.selectStopMemberList(pagination,memberEmail); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("memberList",memberList);
		
		return map;
	}

	@Override
	public int stopMemberCount() {
		return dao.stopMemberCount();
	}

	@Override
	public Map<String, Object> forcedSecessionMemberList(int limit, int cp, String memberEmail) {
		int listCount = dao.selectforcedSecessionMemberListCount(memberEmail);
		
		Pagination pagination = new Pagination(listCount,cp,limit,5);  //게시판 게시글 몇개 정렬인지도 매개변수 정해줌
		
		List<Member> memberList = dao.forcedSecessionMemberList(pagination,memberEmail); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("memberList",memberList);
		
		return map;
	}

	@Override
	public int forcedSecessionMemberCount() {
		return dao.forcedSecessionMemberCount();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public String updateMemberLevelNo(List<String> memberEmail, int memberLevelNo,int memberCount) throws Exception{
		
		String message = "";
		int result = dao.updateMemberLevelNo(memberEmail, memberLevelNo);
		
		if(memberCount == result) {
			message = "회원 " + result + "명 등급 변경에 성공하셨습니다!";
		}else {
			message = "등급 변경에 실패하셨습니다.";
			throw new Exception("등급 변경에 실패");
		}
		
		return message;
	}
	
	/**활동정지 
	 *활동 정지 테이블에 삽입 및 멤버 테이블에 정지 여부 변경 
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public String updateActivityStopMember(List<String> memberEmail, String comment, int memberCount,int HmemberNo) throws Exception{
		
		String message = "";
		int result = dao.updateActivityStopMember(memberEmail, comment,HmemberNo);
		
		if(memberCount == result) {
			message = "회원 " + result + "명을 활동 정지시켰습니다!";
		}else {
			message = "활동 정지 등록에 실패하셨습니다.";
			throw new Exception("활동 정지 등록에 실패");
		}
		
		return message;
	}

	/** 회원 강제 탈퇴 시키기 
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public String ManageSecedePopup(List<String> memberEmail, String comment, int memberCount, String secessionreason,
			int SmemberNo) throws Exception{
		String message = "";
		int result = dao.ManageSecedePopup(memberEmail, comment,secessionreason,SmemberNo);
		
		if(memberCount == result) {
			message = "회원 " + result + "명을 강제 탈퇴시켰습니다!";
		}else {
			message = "회원 강제 탈퇴 반영에 실패하셨습니다.";
			throw new Exception("강제 탈퇴 등록에 실패");
		}
		
		return message;
	}
	
	
	/** 활동 정지 해제 기능 
	 * 활동 정지 관리 창 
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public String updateReleaseStopMember(List<String> memberEmail, int memberCount) throws Exception{
		
		String message = "";
		int result = dao.updateReleaseStopMember(memberEmail);
		
		if(memberCount == result) {
			message = "회원 " + result + "명을 활동이 가능한 멤버로 변경하였습니다.";
		}else {
			message = "활동이 가능한 멤버로 변경 실패하셨습니다.";
			throw new Exception("활동이 가능한 멤버로 변경 실패");
		}
		
		return message;
	}

	/**강제 탈퇴에서 재가입 가능하도록 변경 기능
	 *
	 */
	@Override
	public String updateReleaseSecedeMember(List<String> memberEmail, int memberCount) throws Exception {
		String message = "";
		int result = dao.updateReleaseSecedeMember(memberEmail);
		
		if(memberCount == result) {
			message = result + "명을 재가입 가능 이메일로 변경하였습니다.";
		}else {
			message = "재가입 가능 변경에 실패하셨습니다.";
			throw new Exception("재가입 가능 변경 실패");
		}
		
		return message;
	}


	
}
