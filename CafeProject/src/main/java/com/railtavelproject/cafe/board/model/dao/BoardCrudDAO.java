package com.railtavelproject.cafe.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.board.model.vo.Board;

@Repository
public class BoardCrudDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 태그 조회
	public List<Map<String, Object>> selectTitleTag() {
		return sqlSession.selectList("boardCrudMapper.selectTitleTag");
	}

	// 글양식 조회
	public List<Map<String, Object>> selectWritingFormType() {
		return sqlSession.selectList("boardCrudMapper.selectWritingFormType");
	}

	/** 게시글 작성
	 * @param board
	 * @return boardNo
	 */
	public int writeBoard(Board board) {
		
		int result = sqlSession.insert("boardCrudMapper.writeBoard", board);
		
		// 메인 쿼리(INSERT) 성공 시
		if(result>0) result = board.getBoardNo();
		return result; // 0 또는 삽입된 게시글 번호
	}
}
