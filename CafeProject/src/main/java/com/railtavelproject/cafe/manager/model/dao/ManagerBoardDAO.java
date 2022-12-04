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
	
}
