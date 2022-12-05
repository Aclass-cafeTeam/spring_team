package com.railtavelproject.cafe.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.railtavelproject.cafe.manager.model.dao.ManagerBoardDAO;
import com.railtavelproject.cafe.manager.model.vo.Board;



@Service
public class ManagerBoardServiceImpl implements ManagerBoardService {
	@Autowired
	private ManagerBoardDAO dao;

	/**게시판 종류 검색하기
	 *
	 */
	@Override
	public Map<String, Object> selectBoardType() {
		List<Board> boardType = dao.selectBoardType();
		List<Board> mainCategory = dao.selectMainCategory();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardType", boardType);
		map.put("mainCategory",mainCategory);
		return map;
	}

	/**게시판 새로 만들어서 삽입
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Map<String, Object> insertBoardType(int mainCategoryNo, String mainCategoryName, String boardName, int boardOrder,
			String boardForm) throws Exception{
		String message ="";
		Map<String, Object> map = new HashMap<String, Object>();
		int result = dao.insertBoardType(mainCategoryNo,mainCategoryName,boardName,boardOrder,boardForm);
		if(result > 0) {
			message = "게시판이 추가 되었습니다. 상세 설정해주세요.";
			
			
			Board newBoard = dao.selectBoard(boardOrder+1,mainCategoryNo);
			map.put("message", message);
			map.put("newBoard", newBoard);
			
		}else {
			message = "게시판 추가에 실패했습니다.";
			map.put("message", message);
			throw new Exception("게시판 추가에 실패");
		}
		return map;
	}

	/*
	 * @Override public Board selectBoard(int boardOrder, int mainCategoryNo) {
	 * 
	 * return dao.selectBoard(boardOrder,mainCategoryNo); }
	 */
}
