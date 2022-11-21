package com.railtavelproject.cafe.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//lombok 라이브러리
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	   private int memberNo;  //회원 번호
	   private String memberEmail; //이메일
	   private String memberPw; //비밀번호
	   private String memberNickname; //닉네임
	   private String memberResidence; //거주지
	   private String profileImage; //프로필 이미지
	   private String enrollDate; //가입일
	   private String memberDeleteFlag; //탈퇴여부
	   
	   private String authorityNo; //권한 분류 (2:일반회원, 0:관리자, 1:부관리자)
	   private String authorityName; // 권한명 (0: 카페매니저, 1:부매니저, 2:일반회원)
	   private String authorityImage; // 권한 이미지
	   
	   private int memberLevelNo; // 회원 등급
	   private String memberLevelName; // 등급명   
	   private String memberLevelImage; // 회원 등급 이미지
	   
	   private int logHistoryNo; // 로그인 이력 번호
	   private String loginDate; // 로그인 시간 

	      
	   private int boardCount; // 게시글수
	   private int commentCount; // 댓글수
	   private int visitCount; // 방문수

}
