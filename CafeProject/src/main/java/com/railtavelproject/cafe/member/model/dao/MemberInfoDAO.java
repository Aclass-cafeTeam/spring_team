package com.railtavelproject.cafe.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.member.model.vo.Member;
import com.railtavelproject.cafe.member.model.vo.MyPageBoard;
import com.railtavelproject.cafe.member.model.vo.MyPagePagination;

@Repository
public class MemberInfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 특정 회원의 회원정보
	public Member selectMemberInfo(int memberNo) {
	 	return sqlSession.selectOne("memberInfoMapper.selectMemberInfo",memberNo);
	}
	
	// 특정 회원이 작성한 전체 게시글 수 조회
	public int getListCount(int memberNo) {
		return sqlSession.selectOne("memberInfoMapper.getListCount", memberNo);
	}

	// 특정 회원이 작성한 글 목록
	public List<MyPageBoard> selectMemberBoard(MyPagePagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberInfoMapper.selectMemberBoard", memberNo, rowBounds);
	}


	
}
