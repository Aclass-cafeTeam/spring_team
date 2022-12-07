package com.railtavelproject.cafe.manager.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.manager.model.vo.Board;

@Repository
public class ManagerBoardDAO {

	@Autowired //같은 자료형
	private SqlSessionTemplate sqlSession;
	
	/**게시판 종류 검색하기
	 * @return
	 */
	public List<Board> selectBoardType() {
		return sqlSession.selectList("managerBoardmapper.selectBoardType");
	}

	/** 게시판 메인 카테고리 검색해오기
	 * @return
	 */
	public List<Board> selectMainCategory() {

		return sqlSession.selectList("managerBoardmapper.selectMainCategory");
	}

	/** 게시판 삽입
	 * @param mainCategoryNo
	 * @param mainCategoryName
	 * @param boardName
	 * @param boardOrder
	 * @param boardForm
	 * @return
	 */
	public int insertBoardType(int mainCategoryNo, String mainCategoryName, String boardName, int boardOrder,
			String boardForm) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mainCategoryNo", mainCategoryNo); //게시판 메인 카테고리
		map.put("mainCategoryName", mainCategoryName);
		map.put("boardName", boardName); //이름
		map.put("boardOrder", boardOrder+1); //순서
		map.put("boardForm", boardForm); //A B
		sqlSession.insert("managerBoardmapper.insertBoardType", map);
		int result = (int)map.get("boardNo");
		return result;
	}

	/** 삽입한 게시판 들고오기
	 * @param boardOrder
	 * @param mainCategoryNo
	 * @return
	 */
	public Board selectBoard(int result, int mainCategoryNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mainCategoryNo", mainCategoryNo); //게시판 메인 카테고리
		map.put("boardCode", result);
		return sqlSession.selectOne("managerBoardmapper.selectBoard", map);
	}

	/** 메인 카테고리 삽입
	 * @param mainCategoryAdd
	 * @param mainCategoryNameAdd
	 * @return
	 */
	public int insertMainCategoryBoardType(int mainCategoryAdd, String mainCategoryNameAdd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mainCategoryNo", mainCategoryAdd); //게시판 메인 카테고리
		map.put("mainCategoryName", mainCategoryNameAdd);
		return sqlSession.insert("managerBoardmapper.insertMainCategoryBoardType", map);
	}

	/** 삽입한 메인 카테고리 들고 오기
	 * @param mainCategoryAdd
	 * @param mainCategoryNameAdd
	 * @return
	 */
	public Board selectMainCategory(int mainCategoryAdd, String mainCategoryNameAdd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mainCategoryNo", mainCategoryAdd); //게시판 메인 카테고리
		map.put("mainCategoryName", mainCategoryNameAdd);
		return sqlSession.selectOne("managerBoardmapper.selectAddMainCategory", map);
	}

	/** 게시판 상세 수정
	 * @param boardCode 
	 * @param boardName //기본게시판인 경우 3개는 게시판 이름 수정 불가로 null
	 * @param boardMemberLevelNo
	 * @param boardLikeYN
	 * @param typeDelFL
	 * @return
	 */
	public int updateBoarddetail(int boardCode, String boardName, int boardMemberLevelNo, String boardLikeYN,
			String typeDelFL) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode); 
		map.put("boardName", boardName);
		map.put("boardMemberLevelNo", boardMemberLevelNo);
		map.put("boardLikeYN", boardLikeYN);
		map.put("typeDelFL", typeDelFL);
		return sqlSession.update("managerBoardmapper.updateBoarddetail", map);
	}

	/** 메인 카테고리 수정
	 * @param mainCategoryName
	 * @param mainCategoryNo
	 * @return
	 */
	public int updateMainCategory(String mainCategoryName, int mainCategoryNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mainCategoryNo", mainCategoryNo); 
		map.put("mainCategoryName", mainCategoryName);
		return sqlSession.update("managerBoardmapper.updateMainCategory", map);
	}

	/** 게시판 삭제--update로 delFN를 Y로
	 * 게시글도 삭제
	 * @param boardCode
	 */
	public int deleteBoardType(int boardCode) {
		return sqlSession.update("managerBoardmapper.deleteBoardType",boardCode);
	}
	
	/** 게시판 삭제 시 게시글 삭제
	 * @param boardCode
	 * @return
	 */
	public int deleteBoardTypeBoard(int boardCode) {
	
		return sqlSession.update("managerBoardmapper.deleteBoardTypeBoard",boardCode);
	}


	/**카테고리 삭제 --update로 delFN를 Y로
	 * 카테고리 안에 있는 게시판도 --update로 delFN를 Y로
	 * @param mainCategoryNo
	 */
	public int deletemainCategory(int mainCategoryNo) {
		return sqlSession.update("managerBoardmapper.deletemainCategory",mainCategoryNo); 
	}

	/** 카테고리 안에 있는 게시판도 --update로 delFN를 Y로 위에 카테고리 안에 있는 게시판
	 * @param mainCategoryNo
	 * @return
	 */
	public int deletemainCategoryBoardType(int mainCategoryNo) {
		
		return sqlSession.update("managerBoardmapper.deletemainCategoryBoardType",mainCategoryNo); 
	}

	
	/** 카테고리 안에 있는 게시판 삭제되면서 게시글도 모두 삭제
	 * @param mainCategoryNo
	 * @return
	 */
	public int deletemainCategoryBoard(int mainCategoryNo) {
	
		return sqlSession.update("managerBoardmapper.deletemainCategoryBoard",mainCategoryNo); 
	}

	/**게시판 이동 다음 순서로 변경(아래 버튼)
	 * @param boardCode
	 * @param boardOrderupdate
	 * @return
	 */
	public int updateBoardOrderPage(int boardCode, int boardOrderupdate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode); 
		map.put("boardOrderupdate", boardOrderupdate);
		return sqlSession.update("managerBoardmapper.updateBoardOrderPage",map); 
	}

	/**이동 기준 다음 게시판을 그 전 순서로 변경(아래 버튼)
	 * @param boardNextupdateCode
	 * @param nexTBoardOrderupdate
	 * @return
	 */
	public int updateNextBoardOrderPage(int boardNextupdateCode, int nexTBoardOrderupdate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNextupdateCode", boardNextupdateCode); 
		map.put("nexTBoardOrderupdate", nexTBoardOrderupdate);
		return sqlSession.update("managerBoardmapper.updateNextBoardOrderPage",map); 
	}

	/** 이동 기준 이전 게시판 순서로 이동(위 버튼)
	 * @param boardCode
	 * @param preBoardOrderupdate
	 * @return
	 */
	public int updateBoardOrderPageUP(int boardCode, int preBoardOrderupdate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode); 
		map.put("preBoardOrderupdate", preBoardOrderupdate);
		return sqlSession.update("managerBoardmapper.updateBoardOrderPageUP",map);
	}

	/**이전 게시판이 기준 게시판으로 이동(위 버튼)
	 * @param preBoardOrderupdateCode
	 * @param boardOrderupdate
	 * @return
	 */
	public int updatePreviousBoardOrderPageUP(int preBoardOrderupdateCode, int boardOrderupdate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("preBoardOrderupdateCode", preBoardOrderupdateCode); 
		map.put("boardOrderupdate", boardOrderupdate);
		return sqlSession.update("managerBoardmapper.updatePreviousBoardOrderPageUP",map);
	}
	
}
