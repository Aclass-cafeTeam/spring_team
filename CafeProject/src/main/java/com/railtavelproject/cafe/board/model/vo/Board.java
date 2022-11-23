package com.railtavelproject.cafe.board.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {
    private int boardNo; // 게시판 번호 BOARD_NO
    private String boardTitle; // 게시판 제목 BOARD_TITLE
    private String boardContent; // 게시판 내용 BOARD_CONTENT
    private String boardCreateDate; // 게시판 작성일 B_CREATE_DATE
    private String boardUpdateDate; // 게시판 수정일 B_UPDATE_DATE
    private int readCount; // 게시판 조회수 READ_COUNT
    private int commentCount; // 댓글 수 COMMENT_COUNT
    private int likeCount; // 좋아요 수 
    private String memberNickname; // 게시판 작성자 MEMBER_NICKNAME
    private int memberNo; // 게시판 작성자 번호 MEMBER_NO
    private String profileImage; // 프로필 이미지 PROFILE_IMG
    private String thumbnail; // 썸네일
    
    // 이미지 목록
//    private List<BoardImage> imageList;
//    
//    // 댓글 목록
//    private List<Comment> commentList;
}
