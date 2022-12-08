package com.railtavelproject.cafe.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.board.model.vo.BoardImage;
import com.railtavelproject.cafe.member.model.vo.Member;

@Repository
public class BoardCrudDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 태그 조회
	public List<Map<String, Object>> selectTitleTag() {
		return sqlSession.selectList("boardCrudMapper.selectTitleTag");
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
	
	
	/** 게시글 삭제
	 * @param board
	 * @return result 
	 */
	public int deleteBoard(Board board) {
		// System.out.println(board);
		return sqlSession.update("boardCrudMapper.deleteBoard", board);
	}

	
	/** 임시등록 한행씩 삭제 
	 * @param boardNo
	 * @return result
	 */
	public int deleteTemp(int boardNo) {
		return sqlSession.update("boardCrudMapper.deleteTemp", boardNo);
	}

	
	/** 게시글이 삭제될 경우 게시물 이미지는 DB에서 삭제
	 * @param boardNo
	 */
	public void deleteImgList(int boardNo) {
		// System.out.println(boardNo);
		sqlSession.delete("boardCrudMapper.deleteImgList", boardNo);
	}

	
	

	/** 게시글 상세조회
	 * @param boardNo
	 * @return board
	 */
	public Board boardDetail(int boardNo) {
		return sqlSession.selectOne("boardCrudMapper.boardDetail", boardNo);
	}


	/** 게시글 첨부 이미지 삽입
	 * @param boardImageList
	 * @return result(insert된 행의 개수-다수)
	 */
	public int insertBoardImageList(List<BoardImage> boardImageList) {
		return sqlSession.insert("boardCrudMapper.insertBoardImageList", boardImageList);
	}

	
	/** 임시등록(INSERT)
	 * @param board
	 * @return result
	 */
	public int tempPost(Board board) {
		return sqlSession.insert("boardCrudMapper.tempPost", board);
	}
	

	/** 임시등록 조회
	 * @param boardNo
	 * @return tPost
	 */
	public List<Board> selectTempPost(int memberNo) {
		return sqlSession.selectList("boardCrudMapper.selectTempPost", memberNo);
	}


	/** 임시등록 전체 삭제
	 * @param memberNo
	 * @return result
	 */
	public int deleteTempAll(int memberNo) {
		return sqlSession.update("boardCrudMapper.deleteTempAll", memberNo);
	}


	/** 게시판 목록 조회(로그인한 회원 등급에 따라)
	 * @param memberLevelNo
	 * @return boardTypeList
	 */
	public List<Map<String, Object>> selectBoardType(Member loginMember) {
		return sqlSession.selectList("boardCrudMapper.selectBoardType", loginMember) ;
	}


	/** 게시글 수정
	 * @param board
	 * @return result
	 */
	public int boardUpdate(Board board) {
		return sqlSession.update("boardCrudMapper.boardUpdate", board);
	}


	/** 임시저장글 상세조회
	 * @param boardNo
	 * @return
	 */
	public Board tempPostDetail(int boardNo) {
		return sqlSession.selectOne("boardCrudMapper.tempPostDetail", boardNo) ;
	}


	/** 임시저장글을 저장글로 수정
	 * @param board
	 * @return
	 */
	public int updateTempPost(Board board) {
		return sqlSession.update("boardCrudMapper.updateTempPost", board);
	}
}
