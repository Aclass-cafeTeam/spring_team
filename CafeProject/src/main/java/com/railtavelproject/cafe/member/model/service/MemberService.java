package com.railtavelproject.cafe.member.model.service;

import java.util.List;
import java.util.Map;

import com.railtavelproject.cafe.member.model.vo.Member;

public interface MemberService {
	
	/** 로그인 Service 
	 * @param inputMember
	 * @return loginMember
	 */
	Member login(Member inputMember);

	
	/** 회원가입 Service
	 * @param member
	 * @return result
	 */
	int signUp(Member member);


	/** 이메일(아이디) 중복검사
	 * @param memberEmail
	 * @return result
	 */
	int emailDupCheck(String memberEmail);
	
	/** 강제 탈퇴 회원 검사 (가입불가)
	 * @param memberEmail
	 * @return secession
	 */
	int secessionCheck(String memberEmail);
	
	/** 닉네임 중복 검사
	 * @param memberNickname
	 * @return result
	 */
	int nickDupCheck(String memberNickname);


	/** 멤버 등급 안내보기
	 * @return memberLevel
	 */
	List<Map<String, Object>> viewMemberLevel();


	/** 로그인 이력 
	 * @param memberNo
	 * @return result
	 */
	int insertLogHistory(int memberNo);

}