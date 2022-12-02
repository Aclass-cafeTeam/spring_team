package com.railtavelproject.cafe.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.board.model.vo.Pagination;
import com.railtavelproject.cafe.main.model.vo.IntroBoard;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시판 이름 목록 조회
	 * @return
	 */
	public List<Map<String, Object>> selectBoardType() {
		return sqlSession.selectList("boardMapper.selectBoardType");
	}

	/** 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */
	public int getListCount(int boardCode) {
		return sqlSession.selectOne("boardMapper.getListCount", boardCode);
	}

	/** 페이징처리
	 * @param pagination
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectBoardList", boardCode, rowBounds);
	}

	public List<Board> selectBoardNoticeList(int boardCode) {
		
		RowBounds rowBounds = new RowBounds(0, 5);
		
		return sqlSession.selectList("boardMapper.selectBoardNoticeList", boardCode ,rowBounds);
	}

	/** 검색 조건이 일치하는 게시글 수 조회
	 * @param pm
	 * @return listCount
	 */
	public int getListCount(Map<String, Object> pm) {
		
		return sqlSession.selectOne("boardMapper.getListCount_search", pm);
	}

	
	/** 전체 게시글 조회
	 * @param boardNo
	 * @param cp
	 * @return all
	 */
	public List<Board> selectBoardAllList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectBoardAllList", null, rowBounds);
	}

	public int getAllListCount() {
		
		return sqlSession.selectOne("boardMapper.getAllListCount_search");
	}



	/** 검색 조건 일치 게시글 목록 조회
	 * @param pagination
	 * @param pm
	 * @return boardList
	 */
//	public List<Board> selectBoardList(Pagination pagination, Map<String, Object> pm) {
//		
//		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
//		
//		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
//		
//		return sqlSession.selectList("boardMapper.selectBoardList_search", pm, rowBounds);
//	}

	

	
	
}
