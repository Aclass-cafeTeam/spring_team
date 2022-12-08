package com.railtavelproject.cafe.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.board.model.vo.ImgPagination;
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

	/** 특정 게시글 + 페이징처리
	 * @param pagination
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectBoardList", boardCode, rowBounds);
	}

	/** 게시판 별 공지 게시판 목록 조회
	 * @param boardCode
	 * @return
	 */
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

	/** 전체 게시글 수
	 * @return
	 */
	public int getAllListCount() {
		
		return sqlSession.selectOne("boardMapper.getAllListCount_search");
	}

	/** 베스트 게시글 조회 (좋아요 높은 순)
	 * @param pagination
	 * @return
	 */
	public List<Board> selectBoardBestList(Pagination pagination) {
		
		RowBounds rowBounds = new RowBounds(0, 10);
		
		return sqlSession.selectList("boardMapper.selectBoardBestList", null ,rowBounds);
	}

	/** 검색 조건 일치 게시글 목록 조회
	 * @param pagination
	 * @param pm
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination, Map<String, Object> pm) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectBoardList_search", pm, rowBounds);
	}

	/** 전체 게시판 공지 목록 조회
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectBoardAllNoticeList(int boardCode) {
		
		RowBounds rowBounds = new RowBounds(0, 5);
		
		return sqlSession.selectList("boardMapper.selectBoardAllNoticeList", boardCode ,rowBounds);
	}

	/** 앨범형 게시글 수 조회
	 * @param boardCode
	 * @return
	 */
	public int getAlbumListCount(int boardCode) {
		return sqlSession.selectOne("boardMapper.getAlbumListCount", boardCode);
	}
	
	/** 앨범형 게시글 목록 조회!!!!! 수정중 
	 * @param imgPagination
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectBoardImgList(ImgPagination pagination, int boardCode) {
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
	      
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	    
	   
		return sqlSession.selectList("boardMapper.selectBoardImgList", boardCode,rowBounds);
	}

	/** 앨범형 게시글 별 공지 목록 조회
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectBoardAlbumNoticeList(int boardCode) {
		
		RowBounds rowBounds = new RowBounds(0, 5);
		
		return sqlSession.selectList("boardMapper.selectBoardAlbumNoticeList", boardCode ,rowBounds);
	}


	
}