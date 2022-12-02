
package com.railtavelproject.cafe.member.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.railtavelproject.cafe.member.model.vo.Member;
import com.railtavelproject.cafe.member.model.dao.MemberDAO;

@Service // Service 레이어 == 비즈니스 로직을 가진 클래스, bean 생성
public class MemberServiceImpl implements MemberService{
	
	// MemberDAO bean 의존성 주입(DI)
	@Autowired
	private MemberDAO dao;
	
	
	// spring-security.xml에서 등록한 bean을 의존성 주입(DI)
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	 

	// 로그인
	@Override
	public Member login(Member inputMember) {

		
		/*  bcrypt 이용 시 로그인 방법
		 1. 이메일이 일치하는 회원정보를 DB에서 조회
		 	반드시 비밀번호(MEMBER_PW) 포함 */
		Member loginMember = dao.login(inputMember.getMemberEmail());	
			 	
		 /* 
		  2. 입력 받은 비밀번호(평문)와 조회한 암호화된 비밀번호를 비교
		 	--> BCryptPasswordEncoder.matches(평문, 암호문) 이용하여
		 		같으면 true, 아니면 false 반환 */
		
		if(loginMember != null) { // 아이디 정상 입력
			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) { //
			// 3-1. 조건식을 통해 비밀번호가 일치하면 조회된 회원 정보를 반환 // (단, 비밀번호는 제거-> null인 상태로 변경)
			loginMember.setMemberPw(null);
			
			} else { 
				// 3-2. 비밀번호가 일치하지 않으면 없는 회원 null 반환 
				loginMember = null; 
			} 
		}
				
		return loginMember;
	}


	// 회원가입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member member) {
		
		// 입력받은 비밀번호를 암호화
		String encPw = bcrypt.encode(member.getMemberPw());
		member.setMemberPw(encPw);
		
		return dao.signUp(member);
	}


	// 이메일 중복 검사
	@Override
	public int emailDupCheck(String memberEmail) {
		return dao.emailDupCheck(memberEmail);
	}

	// 강제 탈퇴 회원 검사 (가입불가)
	@Override
	public int secessionCheck(String memberEmail) {
		return dao.secessionCheck(memberEmail);
	}

	// 닉네임 중복 검사
	@Override
	public int nickDupCheck(String memberNickname) {
		return dao.nickDupCheck(memberNickname);
	}

	
	// 멤버등급 안내 보기
	@Override
	public List<Map<String, Object>> viewMemberLevel() {
		return dao.viewMemberLevel();
	}


	// 로그인 이력 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertLogHistory(int memberNo) {
		return dao.insertLogHistory(memberNo);
	}

}