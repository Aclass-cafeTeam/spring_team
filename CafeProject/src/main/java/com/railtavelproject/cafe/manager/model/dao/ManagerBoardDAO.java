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
		return sqlSession.insert("managerBoardmapper.insertBoardType", map);
	}

	/** 삽입한 게시판 들고오기
	 * @param boardOrder
	 * @param mainCategoryNo
	 * @return
	 */
	public Board selectBoard(int boardOrder, int mainCategoryNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mainCategoryNo", mainCategoryNo); //게시판 메인 카테고리
		map.put("boardOrder", boardOrder);
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
	
}
