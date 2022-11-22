package com.railtavelproject.cafe.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.member.model.vo.Member;


@Repository
public class MemberDAO {

   //DBCP + 마이바티스 이용 객체 DI(의존성 주입)
  @Autowired
  private SqlSessionTemplate sqlSession;
  
	/** 로그인 DAO
	* @param memberEmail
	* @return loginMember
	*/
	public Member login(String memberEmail) {
		//  sqlSession.selectOne("매퍼이름.태그id",SQL 작성 시 필요한 값)
	 	return sqlSession.selectOne("memberMapper.login",memberEmail);
	}

  
	/** 회원가입 DAO
	 * @param member
	 * @return result
	 */
	public int signUp(Member member) {
		return sqlSession.insert("memberMapper.signUp", member);
	}


	
	/** 이메일 중복 검사
	 * @param memberEmail
	 * @return result
	 */
	public int emailDupCheck(String memberEmail) {
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}


	
	/** 닉네임 중복 검사
	 * @param memberNickname
	 * @return result
	 */
	public int nickDupCheck(String memberNickname) {
		return sqlSession.selectOne("memberMapper.nickDupCheck", memberNickname);
	}

}