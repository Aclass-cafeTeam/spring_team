package com.railtavelproject.cafe.member.model.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberLevel {
	   private int memberLevelNo; // 회원 등급

	   private String memberLevelName; // 등급명   
	   private String memberLevelImage; // 회원 등급 이미지
	   private int boardCount; // 게시글수
	   private int commentCount; // 댓글수
	   private int visitCount; // 방문수

}
