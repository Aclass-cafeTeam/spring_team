package com.railtavelproject.cafe.board.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {
	   private int commentNo; // 댓글 번호   COMMENT_NO
	   private String commentContent; // 댓글 내용   COMMENT_CONTENT
	   private String commentCreateDate; // 댓글 작성일 C_CREATE_DATE
	   private String commentDeleteDate; // 댓글 삭제일   C_DELETE_DATE
	   private String commentDeleteFlag; // 삭제여부   COMMENT_DEL_FL
	   private int boardNo; // 댓글 등록, 수정, 삭제 시 이용
	   private int parentNo; // 댓글 번호(부모댓글번호) PARENT_NO
	   private int memberNo; // 댓글 작성자 번호
	   private String memberNickname; // 댓글 작성자 닉네임
	   private String profileImage; // 댓글 작성자 프로필
	   private String memberLevelImage; // 등급 레벨 이미지

}
