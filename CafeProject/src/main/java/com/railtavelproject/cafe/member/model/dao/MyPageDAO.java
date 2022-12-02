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
	
	/** 프로필 이미지 수정
	 * @param loginMember
	 * @return result
	 */
	public int updateProfile(Member loginMember) {

		return sqlSession.update("myPageMapper.updateProfile", loginMember);
	}
	
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
	
	/** 탈퇴 이력 추가
	 * @param memberNo
	 * @return result
	 */
	public int insertSecessionLog(int memberNo) {
		return sqlSession.insert("myPageMapper.insertSecessionLog", memberNo);
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

	/** 로그인한 회원이 삭제한 게시글 수 조회
	 * @param memberNo
	 * @return
	 */
	public int getDeleteListCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.getDeleteListCount", memberNo);
	}

	/** 로그인한 회원이 삭제한 게시글 목록 조회
	 * @param pagination
	 * @param memberNo
	 * @return
	 */
	public List<MyPageBoard> selectMyDeleteBoard(MyPagePagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.selectMyDeleteBoard", memberNo, rowBounds);
	}

	/** 마이 페이지 내정보 수정(닉네임, 지역) DAO
	 * @param inputMember
	 * @return
	 */
	public int updateInfo(Member inputMember) {

		return sqlSession.update("myPageMapper.updateInfo", inputMember);
	}

}
