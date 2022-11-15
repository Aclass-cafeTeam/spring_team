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
	   private String authority; //권한 분류 (G:일반회원, M:관리자, S:부관리자)
	   
	   private int memberLevelNo; // 회원 등급
	   private String memberLevelName; // 등급명   
	   
	   private int logHistoryNo; // 로그인 이력 번호
	   private String loginDate; // 로그인 시간 

	
//	"MEMBER_NO"   NUMBER      NOT NULL,
//	   "MEMBER_EMAIL"   VARCHAR2(50)      NOT NULL,
//	   "MEMBER_PW"   VARCHAR2(100)      NOT NULL,
//	   "MEMBER_NICKNAME"   VARCHAR2(30)      NOT NULL,
//	   "MEMBER_RESIDENCE"   VARCHAR2(30)      NULL,
//	   "PROFILE_IMG"   VARCHAR2(300)      NULL,
//	   "ENROLL_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
//	   "MEMBER_DEL_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
//	   "AUTHORITY_NAME"   CHAR(1)   DEFAULT 'G'   NOT NULL,
//	   "MEMBER_LEVEL_NO"   NUMBER      NULL
}
