package com.railtavelproject.cafe.member.model.service;

import java.util.Map;

import com.railtavelproject.cafe.member.model.vo.Member;

public interface MyPageService {

	/** 회원 탈퇴
	 * @param memberNo
	 * @param memberPw
	 * @return
	 */
	int secession(int memberNo, String memberPw);
	
	/** 내가 쓴 글 목록 조회 + 페이징 처리 계산
	 * @param myBoardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMyPageBoard(Member loginMember, int cp);

}
