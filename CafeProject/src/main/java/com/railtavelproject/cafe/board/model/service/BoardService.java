package com.railtavelproject.cafe.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	/** 게시판 이름 목록 조회
	 * @return boardTypeList
	 */
	List<Map<String, Object>> selectBoardType();

	
	
	
}
