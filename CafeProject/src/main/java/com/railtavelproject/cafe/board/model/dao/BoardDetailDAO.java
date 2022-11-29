package com.railtavelproject.cafe.board.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.board.model.vo.Board;

@Repository
public class BoardDetailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글 상세조회 + 댓글 목록 조회
	 * @param boardNo
	 * @return
	 */
	public Board selectBoardDetail(int boardNo) {
		return sqlSession.selectOne("boardDetailMapper.selectBoardDetail", boardNo);
	}
	
	/** 게시글 상세 조회 성공 시 조회 수 증가
	 * @param boardNo
	 * @return
	 */
	public int updateReadCount(int boardNo) {

		return sqlSession.update("boardDetailMapper.updateReadCount", boardNo);
	}

	/** 좋아요 여부 체크
	 * @param map
	 * @return result
	 */
	public int boardLikeCheck(Map<String, Object> map) {

		return sqlSession.selectOne("boardDetailMapper.boardLikeCheck", map);
	}
	/** 좋아요 수 증가
	 * @param paramMap
	 * @return result
	 */
	public int boardLikeUp(Map<String, Object> paramMap) {
		return sqlSession.update("boardDetailMapper.boardLikeUp", paramMap);
	}

	/** 좋아요 수 감소
	 * @param paramMap
	 * @return result
	 */
	public int boardLikeDown(Map<String, Object> paramMap) {

		return sqlSession.delete("boardDetailMapper.boardLikeDown", paramMap);
	}

}
