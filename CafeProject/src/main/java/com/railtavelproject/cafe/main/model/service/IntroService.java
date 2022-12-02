package com.railtavelproject.cafe.main.model.service;

import java.util.List;
import java.util.Map;

public interface IntroService {

	/**
	 * 전체글 불러오기
	 * @return result
	 */
	Map<String, Object> introBoardList();

	/**
	 * 공지 불러오기
	 * @return result
	 */
	Map<String, Object> noticeList();

	/**
	 * 여행후기 게시판
	 * @return
	 */
	Map<String, Object> travelReview();

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
	
	

}
