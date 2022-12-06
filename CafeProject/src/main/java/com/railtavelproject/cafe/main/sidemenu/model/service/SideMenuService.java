package com.railtavelproject.cafe.main.sidemenu.model.service;

import java.util.List;
import java.util.Map;

public interface SideMenuService {
	

	/** 사이드메뉴(카테고리명+게시판명) 조회
	 * @return mainList
	 */
	List<Map<String, Object>> selectMainList();

	/**
	 * 당일 방문 수 조회
	 * @return
	 */
	int todayVisitCount();

	/**
	 * 전체 방문 수 조회
	 * @return
	 */
	int AllVisitCount();

	/**
	 * 멤버 랭킹-댓글
	 * @return
	 */
	Map<String, Object> commentRank();

	/**
	 * 멤버 랭킹-게시글
	 * @return
	 */
	Map<String, Object> boardRank();

	/**
	 * 회원수 조회
	 * @return
	 */
	int memberCount();

	/**
	 * 멤버 랭킹-로그인
	 * @return
	 */
	Map<String, Object> loginRank();

	/**
	 * 게시글 랭킹-좋아요
	 * @return
	 */
	Map<String, Object> boardLike();

	/**
	 * 게시글 랭킹-댓글
	 * @return
	 */
	Map<String, Object> boardComment();

	/**
	 * 멤버소식 - 방문
	 * @return
	 */
	Map<String, Object> memberVisit();

	/**
	 * 멤버소식 - 신입
	 * @return
	 */
	Map<String, Object> memberNew();

	/**
	 * 최근 게시글 - 게시글
	 * @return
	 */
	Map<String, Object> newBoard();

	/**
	 * 최근 게시글/댓글 - 댓글
	 * @return
	 */
	Map<String, Object> newComment();
}
