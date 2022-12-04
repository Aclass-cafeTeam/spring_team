package com.railtavelproject.cafe.manager.model.service;

import java.util.List;
import java.util.Map;

public interface ManagerBoardService {
	/** 게시판 분류 불러오기
	 * @return
	 */
	List<Map<String, Object>> selectBoardType();
}
