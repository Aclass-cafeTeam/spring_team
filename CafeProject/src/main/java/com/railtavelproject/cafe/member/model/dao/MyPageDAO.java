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

	/** 로그인한 회원이 작성한 게시글 수 조회
	 * @param memberNo
	 * @param myBoardCode
	 * @return
	 */
	public int getMyListCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.getMyListCount", memberNo);
	}

	/** 로그인한 회원이 작성한 게시글 목록 조회
	 * @param pagination
	 * @param memberNo
	 * @return
	 */
	public List<MyPageBoard> selectMyPageBoard(MyPagePagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.selectMyPageBoard", memberNo, rowBounds);
	}

	/** 로그인한 회원이 댓글을 작성한 게시글 수 조회
	 * @param memberNo
	 * @return
	 */
	public int getCommentListCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.getCommentListCount", memberNo);
	}

	/** 로그인한 회원이 댓글을 작성한 게시글 목록 조회
	 * @param pagination
	 * @param memberNo
	 * @return
	 */
	public List<MyPageBoard> selectMyCommentBoard(MyPagePagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.selectMyCommentBoard", memberNo, rowBounds);
	}

	/** 로그인한 회원이 좋아요를 누른 게시글 수 조회
	 * @param memberNo
	 * @return
	 */
	public int getLikeListCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.getLikeListCount", memberNo);
	}

	/** 로그인한 회원이 좋아요를 누른 게시글 목록 조회
	 * @param pagination
	 * @param memberNo
	 * @return
	 */
	public List<MyPageBoard> selectMyLikeBoard(MyPagePagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.selectMyLikeBoard", memberNo, rowBounds);
	}

}
