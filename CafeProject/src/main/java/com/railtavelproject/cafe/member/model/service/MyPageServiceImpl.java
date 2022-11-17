package com.railtavelproject.cafe.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.railtavelproject.cafe.member.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	/**
	 * 회원 탈퇴
	 */
	@Transactional
	@Override
	public int secession(int memberNo, String memberPw) {
		
		// 현재 비밀번호 조회
		String nowPw = dao.selectCurrentPw(memberNo);
		
		// 암호화된 비밀번호와 현재 비밀번호 일치하는지 확인
		if (bcrypt.matches(memberPw, nowPw)) return dao.secession(memberNo);
		
		return 0;
	}


}
