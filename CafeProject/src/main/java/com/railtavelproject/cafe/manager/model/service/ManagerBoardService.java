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

	/**게시판 위치 이동 버튼 아래로 
	 * @param boardCode
	 * @param boardOrderupdate
	 * @param nexTBoardOrderupdate
	 * @param boardNextupdateCode
	 * @return
	 */
	String updateBoardOrderPage(int boardCode, int boardOrderupdate, int nexTBoardOrderupdate, int boardNextupdateCode);

	/** 게시판  위치 이동  버튼 위에 올리기
	 * @param boardCode
	 * @param boardOrderupdate
	 * @param preBoardOrderupdate
	 * @param preBoardOrderupdateCode
	 * @return
	 */
	String updateBoardOrderPageUP(int boardCode, int boardOrderupdate, int preBoardOrderupdate,
			int preBoardOrderupdateCode);

	/**게시판 불러오기
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectboardList(int cp);

	Board selectdetailBoardList(int boardNo);

	String RemoveArticle(String boardCode, String typeDelFL);

	/* Board selectBoard(int i, int mainCategoryNo); */
}
