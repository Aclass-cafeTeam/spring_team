package com.railtavelproject.cafe.manager.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//lombok 라이브러리
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Board {
//VO객체 변수명 처음이 대문자일 경우 안될 수 도 있음	
	   private int boardNo;             // 게시글 번호   BOARD_NO
	   private String boardTitle;       // 게시글 제목   BOARD_TITLE
	   private String boardContent;     // 게시글 내용   BOARD_CONTENT
	   
	   private String BCreateDate;      // 게시글 작성일   B_CREATE_DATE
	   private String BUpdateDate;      // 게시글 수정일   B_UPDATE_DATE
	   
	   private int readCount;           // 게시글 조회수 READ_COUNT
	   private String BdeleteDate;      // B_DELETE_DATE
	   
		/* 게시판 타입 */
	   private int boardCode; 			// 게시판 코드 BOARD_CODE
	   private String boardName;   		// 게시판 이름 BOARD_NAME
	   private int boardOrder;   		// 게시판 순서 BOARD_ORDER
	   private int mainCategoryNo;    	//게시판 큰(메인) 카페고리 MAIN_CATEGORY_NO
	   private String titleTagYN;   	//TITLE_TAG_YN 말머리 사용 여부(사용: Y , 사용 안할 시: N)
	   private String boardForm;        //BOARD_FORM  A: 앨범형 B: 게시판형
	   private String boardLikeYN;      //BOARD_LIKE_YN  좋아요 기능여부(하는 걸로 체크:Y, 체크 안하면: N)
	   private int boardMemberLevelNo;	//MEMBER_LEVEL_NO 게시판별 멤버 등급 조건
	   private String TypeDelFL;        //TYPE_DEL_FL 게시판 삭제여부(N: 삭제x / Y:삭제o)
	   /* 게시판 타입 */
	   
	   /* 게시판 큰(메인) 카페고리 */
	   private String mainCategoryName; //MAIN_CATEGORY_NAME 1.기본 게시판(삭제 불가) 2.여행 정보 3.질문 코너 4.갤러리 자료
	   private String CategoryDelFL;    //CATEGORY_DEL_FL
	   /* 게시판 큰(메인) 카페고리 */
	   
	   
	   private int titleTagNo; 			// 말머리 번호 TITLE_TAG_NO 
	   private String noticeFlag; 		// 공지여부   NOTICE_FL
	   

	   
	   private String boardDeleteFlag;  // 게시글 삭제여부   TYPE_DEL_FL

	   	/* 관리자 페이지에서 관리자가 삭제한 게시글 복구 밑 상세 조회 할 때 필요*/	   
	   private int memberNo; 			  // 회원 번호 
	   private String memberName; 		  // 회원 이름 
	   private String memberEmail;		  // 회원 이메일 
	   private String memberNickname;     // 회원 닉네임 
	   private String profileImage;       // 작성자 프로필 
	   private String thumbnail;          // 게시글 이미지  
	   private String memberLevelImage;   // 멤버 등급 이미지 
	   private String memberLevelName;    // 멤버 등급 이름
	   
	   private List<Comment> commentList; // 댓글과 관련된 List

	   private String boardLike;           // 좋아요기능여부   BOARD_LIKE_YN
	   
	   
	   
}
