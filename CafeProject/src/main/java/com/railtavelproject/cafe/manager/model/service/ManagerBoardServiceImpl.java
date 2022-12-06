package com.railtavelproject.cafe.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	/**메인 카테고리 삽입
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Map<String, Object> insertMainCategoryBoardType(int mainCategoryAdd, String mainCategoryNameAdd)
			throws Exception {
		String message ="";
		Map<String, Object> map = new HashMap<String, Object>();
		int result = dao.insertMainCategoryBoardType(mainCategoryAdd,mainCategoryNameAdd);
		if(result > 0) {
			message = "게시판 카테고리가 추가 되었습니다. 상세 설정해주세요.";
			
			
			Board newBoard = dao.selectMainCategory(mainCategoryAdd,mainCategoryNameAdd);
			map.put("message", message);
			map.put("newBoard", newBoard);
			
		}else {
			message = "게시판 카테고리 추가 실패했습니다.";
			map.put("message", message);
			throw new Exception("게시판 카테고리 추가에 실패");
		}
		return map;
	}

	@Override
	public int updateBoarddetail(int boardCode, String mainCategoryUpdate, String mainCategoryName, String boardName,
			int boardMemberLevelNo, String boardLikeYN, String typeDelFL) {
		int result =0;
		if(boardLikeYN.equals("on")) {
			boardLikeYN = "Y";
		}
		if(typeDelFL.equals("on")) {
			typeDelFL = "Y";
		}
		
		if(boardCode != -1) { // 게시판 수정         
			result = dao.updateBoarddetail(boardCode,boardName,boardMemberLevelNo,boardLikeYN,typeDelFL); // 기본게시판은 이름 수정 불가
		}else { // -1  메인 카테고리 이름 수정
			int mainCategoryNo =0 ; 
			if(!mainCategoryUpdate.equals("") ) { 
				String[] arr = mainCategoryUpdate.split("\\."); 
				mainCategoryNo = Integer.parseInt(arr[1]);
			}
			if(mainCategoryNo != 0) {
				result = dao.updateMainCategory(mainCategoryName,mainCategoryNo);
			}
			
		}
		
		/*@RequestParam(value ="boardCodeUpdate" ,required=false, defaultValue="-1") int boardCode,
			@RequestParam(value ="MainCategoryUpdate" ,required=false, defaultValue ="") String MainCategoryUpdate,
			@RequestParam(value ="mainCategoryNameupdateIN" ,required=false, defaultValue ="") String mainCategoryName,
			@RequestParam(value ="settingboardName" ,required=false) String boardName, //boardName이 null이면 기본 게시판이라서 이름 수정 불가
			@RequestParam(value ="LevelNo" ,required=false) int boardMemberLevelNo,
			@RequestParam(value ="boardLikeCheckbox" ,required=false, defaultValue ="N") String boardLikeYN,
			@RequestParam(value ="titleTagCheckbox" ,required=false, defaultValue ="N") String TypeDelFL*/
		
		return result;
	}

	/*
	 * @Override public Board selectBoard(int boardOrder, int mainCategoryNo) {
	 * 
	 * return dao.selectBoard(boardOrder,mainCategoryNo); }
	 */
	
	
	
}
