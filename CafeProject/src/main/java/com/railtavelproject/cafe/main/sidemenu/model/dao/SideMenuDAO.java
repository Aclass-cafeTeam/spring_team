package com.railtavelproject.cafe.main.sidemenu.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.main.model.vo.IntroBoard;

@Repository
public class SideMenuDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 사이드메뉴(카테고리명+게시판명) 조회
	 * @return mainList
	 */
	public List<Map<String, Object>> selectMainList() {
		return sqlSession.selectList("introMapper.selectMainList");
	}

	/**
	 * 당일 방문 수 조회
	 * @return
	 */
	public int todayVisitCount() {
		return sqlSession.selectOne("introMapper.selectTodayVisit");
	}

	/**
	 * 전체 방문수 조회
	 * @return
	 */
	public int allVisitCount() {
		
		return sqlSession.selectOne("introMapper.selectAllVisit");
	}

	/**
	 * 댓글 랭킹
	 * @return
	 */
	public List<IntroBoard> commentRank() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.commentRank", null ,rowBounds);
	}
	
	/**
	 * 멤버랭킹 - 게시글 수
	 * @return
	 */
	public List<IntroBoard> boardRank() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.boardRank", null ,rowBounds);
	}

	/**
	 * 멤버랭킹 - 로그인
	 * @return
	 */
	public List<IntroBoard> loginRank() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.loginRank", null ,rowBounds);
	}
	
	/**
	 * 회원수 조회
	 * @return
	 */
	public int memberCount() {
		return sqlSession.selectOne("introMapper.memberCount");
	}

	/**
	 * 게시글 랭킹-좋아요
	 * @return
	 */
	public List<IntroBoard> boardLike() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.boardLikeRank", null ,rowBounds);
	}

	/**
	 * 게시글 랭킹-댓글
	 * @return
	 */
	public List<IntroBoard> boardComment() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.boardCommentRank", null ,rowBounds);
	}

	/**
	 * 멤버 소식 - 방문
	 * @return
	 */
	public List<IntroBoard> memberVisit() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.memberVisit", null ,rowBounds);
	}

	/**
	 * 멤버 소식 - 신입
	 * @return
	 */
	public List<IntroBoard> memberNew() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.memberNew", null ,rowBounds);
	}

	/**
	 * 최근 게시글/댓글 - 게시글
	 * @return
	 */
	public List<IntroBoard> newBoard() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.newBoard", null ,rowBounds);
	}

	/**
	 * 최근 게시글/댓글 - 댓글
	 * @return
	 */
	public List<IntroBoard> newComment() {
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("introMapper.newComment", null ,rowBounds);
	}

}
