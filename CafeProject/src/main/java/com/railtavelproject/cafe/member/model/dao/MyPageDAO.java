package com.railtavelproject.cafe.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 암호화된 현재 비밀번호 조회
	 * @param memberNo
	 * @return
	 */
	public String selectCurrentPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectCurrentPw", memberNo);
	}

	/** 회원 탈퇴
	 * @param memberNo
	 * @return
	 */
	public int secession(int memberNo) {
		return sqlSession.update("myPageMapper.secession", memberNo);
	}

}
