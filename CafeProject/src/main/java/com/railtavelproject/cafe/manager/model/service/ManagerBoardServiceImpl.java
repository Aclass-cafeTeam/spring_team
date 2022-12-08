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
import com.railtavelproject.cafe.manager.model.vo.Member;
import com.railtavelproject.cafe.manager.model.vo.Pagination;



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
			
			
			Board newBoard = dao.selectBoard(result,mainCategoryNo);
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

	/**게시판 상세 설정
	 *
	 */
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
	
	/**게시판 삭제/메인카테고리 삭제
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public String deleteBoardType(int boardCode, int mainCategoryNo) throws Exception {
		
		String message = "";
		int result = 0;
		
		if(boardCode != -1) {//게시판 삭제
			int result4=  dao.deleteBoardTypeBoard(boardCode);
			result = dao.deleteBoardType(boardCode);
		}else {//메인 카테고리 삭제
			int resul3 = dao.deletemainCategoryBoard(mainCategoryNo);
			
			int result2 = dao.deletemainCategoryBoardType(mainCategoryNo); //메인 카테고리에 있는 게시판 삭제
			
			result = dao.deletemainCategory(mainCategoryNo);
		}
		
		
		if(result > 0) {
			message = "삭제되었습니다.";
		}else {
			message = "삭제 실패되었습니다.";
			throw new Exception("삭제 실패");
		}
		
		return message;
	}

	/**게시판 순서 아래로 보내기
	 *
	 */
	@Override
	public String updateBoardOrderPage(int boardCode, int boardOrderupdate, int nexTBoardOrderupdate,
			int boardNextupdateCode) {
		
		String message = "";
		int result = dao.updateBoardOrderPage(boardCode,nexTBoardOrderupdate);
		int result2 = dao.updateNextBoardOrderPage(boardNextupdateCode,boardOrderupdate);
		
		if(result == result2) {
			message = "이동 반영 완료되었습니다";
		}else {
			message = "이동 실패되었습니다.";
		}
		
		return message;
	}

	@Override
	public String updateBoardOrderPageUP(int boardCode, int boardOrderupdate, int preBoardOrderupdate,
			int preBoardOrderupdateCode) {
		String message = "";
		int result = dao.updateBoardOrderPageUP(boardCode,preBoardOrderupdate);
		int result2 = dao.updatePreviousBoardOrderPageUP(preBoardOrderupdateCode,boardOrderupdate);
		
		if(result == result2) {
			message = "이동 반영 완료되었습니다";
		}else {
			message = "이동 실패되었습니다.";
		}
		
		return message;
	}

	@Override
	public Map<String, Object> selectboardList(int cp) {
		
		int listCount = dao.getDeleteBoardListCount();
		Pagination pagination = new Pagination(listCount,cp);
		
		List<Board> deleteBoardList = dao.getDeleteBoardList(pagination); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("removeBoardList",deleteBoardList);
		return map;
	}

	@Override
	public Board selectdetailBoardList(int boardNo) {
		
		return dao.selectdetailBoardList(boardNo);
	}

	@Override
	public String RemoveArticle(String boardCode, String typeDelFL) {
		String message = "";
		int result = dao.RemoveArticle(boardCode,typeDelFL);
		
		if(result > 0) {
			message = "게시글이 복구되었습니다.";
		}else {
			message = "게시글 복구에 실패하셨습니다.";
		}
		
		return message;
	}

	/*
	 * @Override public Board selectBoard(int boardOrder, int mainCategoryNo) {
	 * 
	 * return dao.selectBoard(boardOrder,mainCategoryNo); }
	 */
	
	
	
}
