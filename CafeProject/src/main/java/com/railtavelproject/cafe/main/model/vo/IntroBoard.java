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
    
    private String cafeProfile;
}
