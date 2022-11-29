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
	
	

}
