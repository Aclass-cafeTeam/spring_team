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

	/**
	 * 카페프로필
	 * @return
	 */
	Map<String, Object> cafeInfo();

	/**
	 * 매니저 닉네임
	 * @return
	 */
	String managerNickname();

	/**
	 * 매니저 멤버넘버
	 * @return
	 */
	int managerNo();

	/**
	 * 이미지가 첨부된 게시글
	 * @return
	 */
	Map<String, Object> boardImg();

	/**
	 * 오늘날짜 가져오기
	 * @return
	 */
	String sysdate();

	/**
	 * 오늘 게시글이 올라온 게시판
	 * @return
	 */
	Map<String, Object> todayBoard();
	
	

}
