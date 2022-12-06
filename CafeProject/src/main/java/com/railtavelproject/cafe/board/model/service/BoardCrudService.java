package com.railtavelproject.cafe.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.railtavelproject.cafe.board.model.vo.Board;

public interface BoardCrudService {

	/** 태그 조회
	 * @return titleTagList
	 */
	List<Map<String, Object>> selectTitleTag();


	/** 게시글 작성
	 * @param board
	 * @return boardNo
	 */
	int writeBoard(Board board);


	/** 게시글 삭제 / 임시등록 한행씩 삭제 
	 * @param boardNo
	 * @return result
	 */
	int deleteBoard(int boardNo);

	
	/** 게시글 상세 조회
	 * @param boardNo
	 * @return board
	 */
	Board boardDetail(int boardNo);
	
	
	/** 게시글 수정 
	 * @param board
	 * @param webPath
	 * @param folderPath
	 * @return result
	 */
	int boardUpdate(Board board, String webPath, String folderPath);

	
	/** 임시등록(INSERT)
	 * @param  board
	 * @return result
	 */
	int tempPost(Board board);



	/** 임시등록 조회
	 * @param boardNo
	 * @return tPost
	 */
	List<Board> selectTempPost(int memberNo);


	/** 임시등록 전체 삭제
	 * @param memberNo
	 * @return result
	 */
	int deleteTempAll(int memberNo);


	





}
