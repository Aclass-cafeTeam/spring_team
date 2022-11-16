package com.railtavelproject.cafe.member.model.service;

public interface MyPageService {

	/** 회원 탈퇴
	 * @param memberNo
	 * @param memberPw
	 * @return
	 */
	int secession(int memberNo, String memberPw);

}
