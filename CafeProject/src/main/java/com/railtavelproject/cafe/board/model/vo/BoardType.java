package com.railtavelproject.cafe.board.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardType {
    private int boardCode; // 게시판 번호 BOARD_CODE
    private String boardName; // 게시판 이름 BOARD_NAME
    private String titleTagFlag; // 말머리 사용 여부 TITLE_TAG_YN
    private String boardForm; // 게시판 형식 BOARD_FORM
    private String boardLikeFlag; // 좋아요 사용 여부 BOARD_LIKE_YN
    private int memberLevelNo; // 멤버 등급 관리 번호 MEMBER_LEVEL_NO
    private String memberLevelName; // 멤버 등급명 MEMBER_LEVEL_NAME
    
}
