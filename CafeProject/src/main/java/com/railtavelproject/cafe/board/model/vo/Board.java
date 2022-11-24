package com.railtavelproject.cafe.board.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {
    private int boardNo; // 게시글 번호 BOARD_NO
    private String boardTitle; // 게시글 제목 BOARD_TITLE
    private String boardContent; // 게시글 내용 BOARD_CONTENT
    private String boardCreateDate; // 게시글 작성일 B_CREATE_DATE ('YYYY.MM.DD. HH24:MI')
    //private String boardUpdateDate; // 게시글 수정일 B_UPDATE_DATE
    private int readCount; // 게시글 조회수 READ_COUNT
    private int commentCount; // 댓글 수 COMMENT_COUNT
    private int likeCount; // 좋아요 수 
    private int memberNo; // 게시글 작성자 번호 MEMBER_NO
    private String memberNickname; // 게시글 작성자 MEMBER_NICKNAME
    private String profileImage; // 프로필 이미지 PROFILE_IMG
    private String memberLevelImage; // 등급이미지 
    private int boardCode; // 게시판 코드
    private String boardName; // 게시판 이름
    
    private int titleTagNo; // 말머리번호 TITLE_TAG_NO
    private String titleTagName; //말머리명 TITLE_TAG_NAME
    
    private int writingFormNo; // 글양식 번호 WRITING_FORM_NO
    private String writingFormName; // 글양식 제목 WRITING_FORM_NAME
    private String writingFormContent; // 글양식 내용 WRITING_FORM_CONTENT
    
    // 이미지 목록
    private List<BoardImage> imageList;
    // 댓글 목록
    private List<Comment> commentList;
}
