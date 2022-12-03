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


	/** 게시글 삭제
	 * @param boardNo
	 * @return result
	 */
	int deleteBoard(int boardNo);


	/** 임시 저장
	 * @param  board
	 * @return result
	 */
	int tempPost(Board board);


	/** 게시글 상세 조회
	 * @param boardNo
	 * @return board
	 */
	Board boardDetail(int boardNo);





}
