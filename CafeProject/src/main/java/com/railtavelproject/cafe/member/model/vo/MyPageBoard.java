package com.railtavelproject.cafe.member.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class MyPageBoard {
	   private int boardNo; // 게시글 번호   BOARD_NO
	   private String boardTitle; // 게시글 제목   BOARD_TITLE
	   
	   private String boardCreateDate; // 게시글 작성일   B_CREATE_DATE
	   
	   private int readCount; // 게시글 조회수 READ_COUNT
	   
	   private String boardDeleteFlag; // 게시글 삭제여부 BOARD_DEL_FL
	   private String boardDeleteDate; //게시글 삭제일 B_DELETE_DATE

	   private int memberNo; // 게시글 작성자 번호 
	   private String memberNickname; // 게시글 작성자 이름 
	   
	   private int likeCount; // 좋아요 수 LIKE_COUNT
	   private String boardLike; // 좋아요기능여부   BOARD_LIKE_YN
	   private int commentCount; // 댓글수 COMMENT_COUNT

	   private int titleTagNo; // 말머리 번호 TITLE_TAG_NO
	   private String titleTagName; // 말머리 이름 TITLE_TAG_NAME

	   // 댓글 목록
	   private List<MyPageComment> myPageCommentList;
}
