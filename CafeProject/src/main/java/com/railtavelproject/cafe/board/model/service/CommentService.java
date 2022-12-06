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
	 * @return
	 */
	int insertComment(Comment comment);

	/** 댓글 삭제(회원)
	 * @param commentNo
	 * @return
	 */
	int deleteComment(int commentNo);

	/** 댓글 삭제(관리자)
	 * @param commentNo
	 * @return
	 */
	int deleteCommentManager(int commentNo);

	/** 댓글 수정
	 * @param comment
	 * @return
	 */
	int updateComment(Comment comment);

}
