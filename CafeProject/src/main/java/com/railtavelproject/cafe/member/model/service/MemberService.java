package com.railtavelproject.cafe.member.model.service;

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
	
	
	/** 닉네임 중복 검사
	 * @param memberNickname
	 * @return result
	 */
	int nickDupCheck(String memberNickname);



}