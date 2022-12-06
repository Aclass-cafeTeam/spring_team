package com.railtavelproject.cafe.manager.model.service;

import java.util.List;
import java.util.Map;

import com.railtavelproject.cafe.manager.model.vo.Board;

public interface ManagerBoardService {
	/** 게시판 분류 불러오기
	 * @return
	 */
	Map<String, Object> selectBoardType();

	Map<String, Object> insertBoardType(int mainCategoryNo, String mainCategoryName, String boardName, int boardOrder,
			String boardForm) throws Exception;

	Map<String, Object> insertMainCategoryBoardType(int mainCategoryAdd, String mainCategoryNameAdd) throws Exception;

	int updateBoarddetail(int boardCode, String mainCategoryUpdate, String mainCategoryName, String boardName,
			int boardMemberLevelNo, String boardLikeYN, String typeDelFL);

	String deleteBoardType(int boardCode, int mainCategoryNo) throws Exception;

	/* Board selectBoard(int i, int mainCategoryNo); */
}
