package com.railtavelproject.cafe.manager.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//lombok 라이브러리
@NoArgsConstructor
@Getter
@Setter
@ToString
public class CafeInfo {
	private int cafeNo; //CAFE_NO
	private String profileImg;  // PROFILE_IMG;
	private String mainHeaderImg;  // CAFE_MAIN_HEADER_IMG;
	private String topFrontImg;  // CAFE_TOP_FRONT_IMG;
	private String bottomFrontImg;  // CAFE_BOTTOM_FRONT_IMG;
	private String cafeJoinFL;  // CAFE_JOIN_FL;
	
	private int memberLeverNo;//MEMBER_LEVEL_NO //멤버 등급 0,1(권한)은 빼기
	private String memberLevelName;//MEMBER_LEVEL_NAME 등급 이름
	private int boardCount;//BOARD_COUNT 게시글 수(등업)
	private int commentCount;//COMMENT_COUNT 댓글 수(등업)
	private int visitCount;//VISIT_COUNT 방문 수(등업)
	private String memberLevelImg;//MEMBER_LEVEL_IMG 등급 이미지
}
