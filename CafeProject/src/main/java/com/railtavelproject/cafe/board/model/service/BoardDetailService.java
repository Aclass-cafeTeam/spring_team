package com.railtavelproject.cafe.board.model.service;

import java.util.Map;

import com.railtavelproject.cafe.board.model.vo.Board;

public interface BoardDetailService {

	/** 게시글 상세조회 서비스
	 * @param boardNo
	 * @return
	 */
	Board selectBoardDetail(int boardNo);
	

	/** 게시글 상세 조회 성공 시 조회 수 증가
	 * @param boardNo
	 * @return
	 */
	int updateReadCount(int boardNo);

	/** 좋아요 여부 체크
	 * @param map
	 * @return
	 */
	int boardLikeCheck(Map<String, Object> map);


	/** 좋아요 수 증가
	 * @param paramMap
	 * @return result
	 */
	int boardLikeUp(Map<String, Object> paramMap);

	/** 좋아요 수 감소
	 * @param paramMap
	 * @return result
	 */
	int boardLikeDown(Map<String, Object> paramMap);
	
}
