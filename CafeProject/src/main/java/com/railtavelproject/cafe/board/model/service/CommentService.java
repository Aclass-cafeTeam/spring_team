package com.railtavelproject.cafe.board.model.service;

import java.util.List;

import com.railtavelproject.cafe.board.model.vo.Comment;

public interface CommentService {

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return commentList
	 */
	List<Comment> selectCommentList(int boardNo);

	/** 댓글 등록
	 * @param comment
	 * @return result
	 */
	int insertComment(Comment comment);

}
