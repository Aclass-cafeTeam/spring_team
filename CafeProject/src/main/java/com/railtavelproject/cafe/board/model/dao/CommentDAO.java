package com.railtavelproject.cafe.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.board.model.vo.Comment;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return commentList
	 */
	public List<Comment> selectCommentList(int boardNo) {

		return sqlSession.selectList("boardDetailMapper.selectCommentList", boardNo);
	}

	/** 댓글 등록
	 * @param comment
	 * @return result
	 */
	public int insertComment(Comment comment) {

		return sqlSession.insert("commentMapper.insertComment", comment);
	}

}
