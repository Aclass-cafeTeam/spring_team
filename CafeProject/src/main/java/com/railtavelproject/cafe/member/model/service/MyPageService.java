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
	
	/** 로그인한 회원이 작성한 글 목록 조회 + 페이징 처리 계산
	 * @param myBoardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMyPageBoard(int memberNo, int cp);

	/** 로그인한 회원이 댓글 단 글 목록 조회 + 페이징
	 * @param memberNo
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMyCommentBoard(int memberNo, int cp);

	/** 로그인한 회원이 좋아요 한 글 목록 조회 + 페이징
	 * @param memberNo
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectMyLikeBoard(int memberNo, int cp);

	/** 로그인한 회원이 삭제한 글 목록 조회 + 페이징
	 * @param memberNo
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectMyDeleteBoard(int memberNo, int cp);

}
