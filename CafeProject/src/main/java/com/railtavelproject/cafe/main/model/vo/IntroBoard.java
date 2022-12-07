package com.railtavelproject.cafe.main.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class IntroBoard {
	
	private int boardNo;
    private int boardCode;
	private String boardTitle;
	private int readCount;
	private String boardDelFl;
	private int noticeFl;
	
	private int commentNo;
	private int commentCount;
	private int boardCount;
	private int loginCount;
	private String commentDelFl;
	
	private String memberNickname;
	
	private String memberNo;
	private int todayVisitCount;
	
	// 게시글 랭킹
	private int likeCount;
	private String loginDate;
	
	private String commentContent;
	
    private String thumbnail; // 썸네일
    
    private String cafeProfile; // 카페프로필 이미지
    
    private String managerNickname; // 매니저 이름
    private int managerNo; // 매니저 멤버넘버
    private String imgNo;
    private String sysdate; // 오늘 날짜
    
    private String boardCreate; // 게시글 작성날짜
    
}
