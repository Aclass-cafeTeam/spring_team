package com.railtavelproject.cafe.main.model.service;

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
	
	

}
