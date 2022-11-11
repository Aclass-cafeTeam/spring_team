package com.railtavelproject.cafe.board.model.vo;

import java.util.List;

public class Board {
	   private int boardNo; // 게시글 번호   BOARD_NO
	   private String boardTitle; // 게시글 제목   BOARD_TITLE
	   private String boardContent; // 게시글 내용   BOARD_CONTENT
	   
	   private String BCreateDate; // 게시글 작성일   B_CREATE_DATE
	   private String BUpdateDate; // 게시글 수정일   B_UPDATE_DATE
	   
	   private int readCount; // 게시글 조회수 READ_COUNT
	   
	   
	   private int boardCode; // 게시판 코드 BOARD_CODE
	   private int titleTagNo; // 말머리 번호 TITLE_TAG_NO
	   private String noticeFlag; // 공지여부   NOTICE_FL
	   

	   
	   private String boardDeleteFlag; // 게시글 삭제여부   TYPE_DEL_FL

	   private int memberNo; // 게시글 작성자 번호 
	   private String memberName; // 게시글 작성자 이름 
	   private int memberLevelNo;   // 등급번호   MEMBER_LEVEL_NO
	   
	   private List<Comment> commentList; // 댓글과 관련된 List

	   private String boardLike; // 좋아요기능여부   BOARD_LIKE_YN
	   
	   
	   
	   private String boardName;   // 게시판 이름   BOARD_NAME
	   // 게시판 대분류 번호   MAIN_CATEGORY_NO
	   // 말머리 사용 여부   TITLE_TAG_YN
	   // 게시판 형식   BOARD_FORM   
}
