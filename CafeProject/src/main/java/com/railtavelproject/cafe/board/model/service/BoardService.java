package com.railtavelproject.cafe.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	/** 게시판 이름 목록 조회
	 * @return boardTypeList
	 */
	List<Map<String, Object>> selectBoardType();

	/** 특정 게시판 목록 조회 + 페이징 처리 계산
	 * @param boardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectBoardList(int boardCode, int cp);

	/** 공지 게시판 목록 조회
	 * @return notice
	 */
	Map<String, Object> selectBoardNoticeList(int boardCode);

	/** 전체 게시글 조회
	 * @param boardNo
	 * @param cp
	 * @return all
	 */
	Map<String, Object> selectBoardAllList(int cp);

	/** 검색 목록 조회
	 * @param pm
	 * @param cp
	 * @return boardList
	 */
//	Map<String, Object> selectBoardList(Map<String, Object> pm, int cp);


}