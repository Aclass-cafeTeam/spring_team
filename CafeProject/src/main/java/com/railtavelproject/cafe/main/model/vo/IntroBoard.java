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
	private String commentDelFl;
	
	private String memberNickname;
	
	private int todayVisitCount;
	
	

	
}
