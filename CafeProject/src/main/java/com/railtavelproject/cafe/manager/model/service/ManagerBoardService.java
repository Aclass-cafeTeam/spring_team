package com.railtavelproject.cafe.manager.model.service;

import java.util.List;
import java.util.Map;

import com.railtavelproject.cafe.manager.model.vo.Board;

public interface ManagerBoardService {
	/** 게시판 분류 불러오기
	 * @return
	 */
	Map<String, Object> selectBoardType();
}
