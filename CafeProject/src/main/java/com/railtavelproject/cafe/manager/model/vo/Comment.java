package com.railtavelproject.cafe.manager.model.vo;

public class Comment {
	   private int commentNo; // 댓글 번호   COMMENT_NO
	   private String commentContent; // 댓글 내용   COMMENT_CONTENT
	   private int memberNo; // 댓글 작성자 번호
	   private String memberName; // 댓글 작성자 이름
	   private String CcreateDate; // 댓글 작성일 C_CREATE_DATE
	   private String CdeleteDate; // 댓글 삭제일   C_DELETE_DATE
	   private String CCommentDeleteFlag; // 삭제여부   COMMENT_DEL_FL ????????????????????????
	   
	   private int commentCount; // 댓글 조회수

	   private int boardNo; // 댓글 등록, 수정, 삭제 시 이용

	   private int parentNo; // 댓글 번호(부모댓글번호) PARENT_NO

}
