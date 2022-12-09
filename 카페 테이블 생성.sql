-- 프로젝트용 DB 계정 생성 코드 (sys계정)
--ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
--
-- 프로젝트 계정 생성
--CREATE USER cafe IDENTIFIED BY cafe1234;
--
-- 권한 부여
--GRANT CONNECT, RESOURCE, CREATE VIEW TO cafe;
--
-- 객체 생성 공간 할당
--ALTER USER cafe DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;

CREATE TABLE "MEMBER" (
   "MEMBER_NO"   NUMBER      NOT NULL,
   "MEMBER_EMAIL"   VARCHAR2(50)      NOT NULL,
   "MEMBER_PW"   VARCHAR2(100)      NOT NULL,
   "MEMBER_NICKNAME"   VARCHAR2(30)      NOT NULL,
   "MEMBER_RESIDENCE"   VARCHAR2(30)      NULL,
   "PROFILE_IMG"   VARCHAR2(300)      NULL,
   "ENROLL_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "MEMBER_DEL_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "AUTHORITY_NAME"   CHAR(1)   DEFAULT 'G'   NOT NULL,
   "MEMBER_LEVEL_NO"   NUMBER      NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일(아이디로 사용)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호(암호화 진행)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원 닉네임(중복X)';

COMMENT ON COLUMN "MEMBER"."MEMBER_RESIDENCE" IS '회원 거주지(선택사항)';

COMMENT ON COLUMN "MEMBER"."PROFILE_IMG" IS '프로필 이미지 경로';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '회원가입일';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '회원 탈퇴/활동 정지 여부(Y: 탈퇴 O , S: 활동정지, N: 기본값(회원으로 활동))';

COMMENT ON COLUMN "MEMBER"."AUTHORITY_NAME" IS '권한명(G: 일반회원, M: 관리자 ,S :부관리자)';

COMMENT ON COLUMN "MEMBER"."MEMBER_LEVEL_NO" IS '멤버 등급 관리 번호(FK)--관리자랑 부관리자는 등급X NULL';

CREATE TABLE "BOARD" (
   "BOARD_NO"   NUMBER      NOT NULL,
   "BOARD_TITLE"   VARCHAR2(200)      NOT NULL,
   "BOARD_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "B_CREATE_DATE"   DATE      NOT NULL,
   "B_UPDATE_DATE"   DATE      NULL,
   "B_DELETE_DATE"   DATE      NULL,
   "READ_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "BOARD_DEL_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "NOTICE_FL"   NUMBER   DEFAULT 0   NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL,
   "BOARD_CODE"   NUMBER      NOT NULL,
   "TITLE_TAG_NO"   NUMBER      NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."B_CREATE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "BOARD"."B_UPDATE_DATE" IS '마지막 수정일(수정 시UPDATE)';

COMMENT ON COLUMN "BOARD"."B_DELETE_DATE" IS '삭제일';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_DEL_FL" IS '게시글 삭제여부(N:삭제X, Y:본인 삭제 ,M:관리자 삭제)';

COMMENT ON COLUMN "BOARD"."NOTICE_FL" IS '0:공지X(일반 게시글) / 1: 게시판공지 / 2:전체공지';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '작성자 회원번호(FK)';

COMMENT ON COLUMN "BOARD"."BOARD_CODE" IS '게시판 종류별 코드번호(FK)';

COMMENT ON COLUMN "BOARD"."TITLE_TAG_NO" IS '말머리번호(FK)';

CREATE TABLE "BOARD_IMG" (
   "IMG_NO"   NUMBER      NOT NULL,
   "IMG_PATH"   VARCHAR2(300)      NOT NULL,
   "IMG_RENAME"   VARCHAR2(300)   NOT NULL,
   "IMG_ORIGINAL"   VARCHAR2(300)      NOT NULL,
   "IMG_ORDER"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지 번호(SEQ_IMG_NO)';

COMMENT ON COLUMN "BOARD_IMG"."IMG_PATH" IS '이미지 저장 폴더 경로';

COMMENT ON COLUMN "BOARD_IMG"."IMG_RENAME" IS '변경된 이미지 파일 이름';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL" IS '원본 이미지 파일 이름';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORDER" IS '이미지 파일 순서 번호';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '이미지가 첨부된 게시글 번호(FK)';

CREATE TABLE "BOARD_LIKE" (
   "BOARD_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "BOARD_LIKE"."BOARD_NO" IS '게시글 번호(PK+FK)';

COMMENT ON COLUMN "BOARD_LIKE"."MEMBER_NO" IS '좋아요 누른 회원 번호(PK+FK)';

CREATE TABLE "COMMENT" (
   "COMMENT_NO"   NUMBER      NOT NULL,
   "COMMENT_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "C_CREATE_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "C_DELETE_DATE"   DATE      NULL,
   "COMMENT_DEL_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL,
   "PARENT_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호(SEQ_COMMENT_NO)';

COMMENT ON COLUMN "COMMENT"."COMMENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."C_CREATE_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."C_DELETE_DATE" IS '댓글 삭제일';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부(N: 삭제 X, Y: 삭제 O, M:관리자 삭제)';

COMMENT ON COLUMN "COMMENT"."BOARD_NO" IS '댓글이 작성된 게시글 번호(FK)';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '댓글 작성자 회원 번호(FK)';

COMMENT ON COLUMN "COMMENT"."PARENT_NO" IS '부모 댓글 번호(FK)';

CREATE TABLE "BOARD_TYPE" (
   "BOARD_CODE"   NUMBER      NOT NULL,
   "BOARD_NAME"   VARCHAR2(300)      NOT NULL,
   "BOARD_ORDER"   NUMBER      NOT NULL,
   "MAIN_CATEGORY_NO"   NUMBER      NULL,
   "TITLE_TAG_YN"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "BOARD_FORM"   CHAR(1)   DEFAULT 'B'   NOT NULL,
   "BOARD_LIKE_YN"   CHAR(1)   DEFAULT 'Y'   NOT NULL,
   "MEMBER_LEVEL_NO"   NUMBER      NOT NULL,
   "TYPE_DEL_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CODE" IS '게시판 종류별 코드번호(SEQ_BOARD_CODE)';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NAME" IS '게시판 이름';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_ORDER" IS '게시판 대분류 안 중분류의 순서';

COMMENT ON COLUMN "BOARD_TYPE"."MAIN_CATEGORY_NO" IS '게시판 대분류(게시판 종류를 묶는 큰 분류) 번호(FK)-대분류가 없는 친구들도 있음';

COMMENT ON COLUMN "BOARD_TYPE"."TITLE_TAG_YN" IS '말머리 사용 여부(사용: Y , 사용 안할 시: N)';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_FORM" IS 'A: 앨범형 B: 게시판형';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_LIKE_YN" IS '좋아요 기능여부(하는 걸로 체크:Y, 체크 안하면: N)';

COMMENT ON COLUMN "BOARD_TYPE"."MEMBER_LEVEL_NO" IS '멤버 등급 관리 번호(FK)';

COMMENT ON COLUMN "BOARD_TYPE"."TYPE_DEL_FL" IS '게시판 삭제여부(N: 삭제x / Y:삭제o)';

CREATE TABLE "CAFE_INFO" (
   "CAFE_NO"   NUMBER      NOT NULL,
   "PROFILE_IMG"   VARCHAR2(300)      NULL,
   "CAFE_MAIN_HEADER_IMG"   VARCHAR2(300)      NULL,
   "CAFE_TOP_FRONT_IMG"   VARCHAR2(300)      NULL,
   "CAFE_BOTTOM_FRONT_IMG"   VARCHAR2(300)      NULL
);

COMMENT ON COLUMN "CAFE_INFO"."CAFE_NO" IS '카페번호(SEQ_CAFE_NO)';

COMMENT ON COLUMN "CAFE_INFO"."PROFILE_IMG" IS '카페 프로필 이미지 경로';

COMMENT ON COLUMN "CAFE_INFO"."CAFE_MAIN_HEADER_IMG" IS '카페 메인 페이지 헤더 이미지 경로';

COMMENT ON COLUMN "CAFE_INFO"."CAFE_TOP_FRONT_IMG" IS '카페 상단 대문 이미지 경로';

COMMENT ON COLUMN "CAFE_INFO"."CAFE_BOTTOM_FRONT_IMG" IS '카페 하단 대문 이미지 경로';

CREATE TABLE "LOGIN_HISTORY" (
   "LOG_HISTORY_NO"   NUMBER      NOT NULL,
   "LOGIN_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "LOGIN_HISTORY"."LOG_HISTORY_NO" IS '로그인 시 INSERT할 로그인 이력 번호(SEQ_LOG_HISTORY_NO)';

COMMENT ON COLUMN "LOGIN_HISTORY"."LOGIN_DATE" IS '로그인 시점의 날짜 및 시간';

COMMENT ON COLUMN "LOGIN_HISTORY"."MEMBER_NO" IS '회원번호(FK)';

CREATE TABLE "MEMBER_LEVEL" (
   "MEMBER_LEVEL_NO"   NUMBER      NOT NULL,
   "MEMBER_LEVEL_NAME"   VARCHAR2(30)      NOT NULL,
   "BOARD_COUNT"   NUMBER      NULL,
   "COMMENT_COUNT"   NUMBER      NULL,
   "VISIT_COUNT"   NUMBER      NULL
);

COMMENT ON COLUMN "MEMBER_LEVEL"."MEMBER_LEVEL_NO" IS '멤버 등급 관리 번호';

COMMENT ON COLUMN "MEMBER_LEVEL"."MEMBER_LEVEL_NAME" IS '멤버 등급 관리 등급명';

COMMENT ON COLUMN "MEMBER_LEVEL"."BOARD_COUNT" IS '멤버 등급 등업에 필요한 게시글 수';

COMMENT ON COLUMN "MEMBER_LEVEL"."COMMENT_COUNT" IS '멤버 등급 등업에 필요한 댓글 수';

COMMENT ON COLUMN "MEMBER_LEVEL"."VISIT_COUNT" IS '멤버 등급 등업에 필요한 방문 수';

CREATE TABLE "MAIN_CATEGORY" (
   "MAIN_CATEGORY_NO"   NUMBER      NOT NULL,
   "MAIN_CATEGORY_NAME"   VARCHAR2(300)      NOT NULL,
   "CATEGORY_DEL_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN "MAIN_CATEGORY"."MAIN_CATEGORY_NO" IS '게시판 대분류(게시판 종류를 묶는 큰 분류) 번호/번호로 ORDER 순서 사용(SEQ_BOARD_1STCLASS_NO)-시퀀스 사용시 1부터 생성)';

COMMENT ON COLUMN "MAIN_CATEGORY"."MAIN_CATEGORY_NAME" IS '게시판 대분류(게시판 종류를 묶는 큰 분류) 이름';

COMMENT ON COLUMN "MAIN_CATEGORY"."CATEGORY_DEL_FL" IS '대분류 삭제 여부( N: 삭제x, Y: 삭제o)';

CREATE TABLE "TITLE_TAG" (
   "TITLE_TAG_NO"   NUMBER      NOT NULL,
   "TITLE_TAG_NANE"   VARCHAR2(50)      NOT NULL
);

COMMENT ON COLUMN "TITLE_TAG"."TITLE_TAG_NO" IS '말머리번호';

COMMENT ON COLUMN "TITLE_TAG"."TITLE_TAG_NANE" IS '말머리이름,내용';

CREATE TABLE "TEMP_POST" (
   "TEMP_POST_NO"   NUMBER      NOT NULL,
   "TEMP_POST_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "TEMP_POST"."TEMP_POST_NO" IS '임시등록번호(SEQ_TEMP_REGIST_NO)';

COMMENT ON COLUMN "TEMP_POST"."TEMP_POST_DATE" IS '임시등록한 날짜';

COMMENT ON COLUMN "TEMP_POST"."BOARD_NO" IS '게시글 번호(FK)';

CREATE TABLE "MEMBER_SECESSION" (
   "SECESSION_NO"   NUMBER      NOT NULL,
   "SECESSION_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "SECESSION_REASON"   CHAR(1)   DEFAULT 'I'   NOT NULL,
   "S_MEMBER_NO"   NUMBER      NOT NULL,
   "S_MANAGER_NO"   NUMBER      NULL
);

COMMENT ON COLUMN "MEMBER_SECESSION"."SECESSION_NO" IS '탈퇴 번호(SEQ_SECESSION_NO)';

COMMENT ON COLUMN "MEMBER_SECESSION"."SECESSION_DATE" IS '탈퇴일';

COMMENT ON COLUMN "MEMBER_SECESSION"."SECESSION_REASON" IS '탈퇴사유 (개인: I ,강제: F)';

COMMENT ON COLUMN "MEMBER_SECESSION"."S_MEMBER_NO" IS '탈퇴한 회원 번호(FK)';

COMMENT ON COLUMN "MEMBER_SECESSION"."S_MANAGER_NO" IS '탈퇴 처리 관리자 번호(FK)';

CREATE TABLE "WRITING_FORM_TYPE" (
   "WRITING_FORM_NO"   NUMBER      NOT NULL,
   "WRITING_FORM_NAME"   VARCHAR2(50)      NOT NULL,
   "WRITING_FORM_CONTENT"   VARCHAR2(4000)      NOT NULL
);

COMMENT ON COLUMN "WRITING_FORM_TYPE"."WRITING_FORM_NO" IS '게시글  작성 시 글 양식 번호(SEQ_WRITESTYLE_FORM_NO)';

COMMENT ON COLUMN "WRITING_FORM_TYPE"."WRITING_FORM_NAME" IS '게시글 작성 시 글양식 제목';

COMMENT ON COLUMN "WRITING_FORM_TYPE"."WRITING_FORM_CONTENT" IS '게시글 작성 글양식 내용';

CREATE TABLE "WRITING_FORM" (
   "WRITING_FORM_NO"   NUMBER      NOT NULL,
   "BOARD_CODE"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "WRITING_FORM"."WRITING_FORM_NO" IS '게시글  작성 시 글 양식 번호(PK+FK)';

COMMENT ON COLUMN "WRITING_FORM"."BOARD_CODE" IS '게시판 종류별 코드번호(PK+FK)';

CREATE TABLE "MEMBER_HOLD" (
   "HOLD_NO"   NUMBER      NOT NULL,
   "H_MEMBER_NO"   NUMBER      NOT NULL,
   "H_MANAGER_NO"   NUMBER      NOT NULL,
   "HOLD_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "HOLD_FL"   CHAR(1)   DEFAULT 'Y'   NOT NULL
);

COMMENT ON COLUMN "MEMBER_HOLD"."HOLD_NO" IS '활동정지 번호(SEQ_HOLD_NO)';

COMMENT ON COLUMN "MEMBER_HOLD"."H_MEMBER_NO" IS '활동정지 회원번호(FK)';

COMMENT ON COLUMN "MEMBER_HOLD"."H_MANAGER_NO" IS '활동정지 관리자 번호(FK)';

COMMENT ON COLUMN "MEMBER_HOLD"."HOLD_DATE" IS '활동정지일';

COMMENT ON COLUMN "MEMBER_HOLD"."HOLD_FL" IS '활동정지여부(N: 활동 / Y:활동정지)';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
   "MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
   "BOARD_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "PK_BOARD_IMG" PRIMARY KEY (
   "IMG_NO"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "PK_BOARD_LIKE" PRIMARY KEY (
   "BOARD_NO",
   "MEMBER_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
   "COMMENT_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
   "BOARD_CODE"
);

ALTER TABLE "CAFE_INFO" ADD CONSTRAINT "PK_CAFE_INFO" PRIMARY KEY (
   "CAFE_NO"
);

ALTER TABLE "LOGIN_HISTORY" ADD CONSTRAINT "PK_LOGIN_HISTORY" PRIMARY KEY (
   "LOG_HISTORY_NO"
);

ALTER TABLE "MEMBER_LEVEL" ADD CONSTRAINT "PK_MEMBER_LEVEL" PRIMARY KEY (
   "MEMBER_LEVEL_NO"
);

ALTER TABLE "MAIN_CATEGORY" ADD CONSTRAINT "PK_MAIN_CATEGORY" PRIMARY KEY (
   "MAIN_CATEGORY_NO"
);

ALTER TABLE "TITLE_TAG" ADD CONSTRAINT "PK_TITLE_TAG" PRIMARY KEY (
   "TITLE_TAG_NO"
);

ALTER TABLE "TEMP_POST" ADD CONSTRAINT "PK_TEMP_POST" PRIMARY KEY (
   "TEMP_POST_NO"
);

ALTER TABLE "MEMBER_SECESSION" ADD CONSTRAINT "PK_MEMBER_SECESSION" PRIMARY KEY (
   "SECESSION_NO"
);

ALTER TABLE "WRITING_FORM_TYPE" ADD CONSTRAINT "PK_WRITING_FORM_TYPE" PRIMARY KEY (
   "WRITING_FORM_NO"
);

ALTER TABLE "WRITING_FORM" ADD CONSTRAINT "PK_WRITING_FORM" PRIMARY KEY (
   "WRITING_FORM_NO",
   "BOARD_CODE"
);

ALTER TABLE "MEMBER_HOLD" ADD CONSTRAINT "PK_MEMBER_HOLD" PRIMARY KEY (
   "HOLD_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_MEMBER_LEVEL_TO_MEMBER_1" FOREIGN KEY (
   "MEMBER_LEVEL_NO"
)
REFERENCES "MEMBER_LEVEL" (
   "MEMBER_LEVEL_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
   "MEMBER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_BOARD_TYPE_TO_BOARD_1" FOREIGN KEY (
   "BOARD_CODE"
)
REFERENCES "BOARD_TYPE" (
   "BOARD_CODE"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_TITLE_TAG_TO_BOARD_1" FOREIGN KEY (
   "TITLE_TAG_NO"
)
REFERENCES "TITLE_TAG" (
   "TITLE_TAG_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "FK_BOARD_TO_BOARD_IMG_1" FOREIGN KEY (
   "BOARD_NO"
)
REFERENCES "BOARD" (
   "BOARD_NO"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_BOARD_TO_BOARD_LIKE_1" FOREIGN KEY (
   "BOARD_NO"
)
REFERENCES "BOARD" (
   "BOARD_NO"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_LIKE_1" FOREIGN KEY (
   "MEMBER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_BOARD_TO_COMMENT_1" FOREIGN KEY (
   "BOARD_NO"
)
REFERENCES "BOARD" (
   "BOARD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_COMMENT_1" FOREIGN KEY (
   "MEMBER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_COMMENT_TO_COMMENT_1" FOREIGN KEY (
   "PARENT_NO"
)
REFERENCES "COMMENT" (
   "COMMENT_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "FK_MAIN_CATEGORY_TO_BOARD_TYPE" FOREIGN KEY (
   "MAIN_CATEGORY_NO"
)
REFERENCES "MAIN_CATEGORY" (
   "MAIN_CATEGORY_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "FK_MEMBER_LEVEL_TO_BOARD_TYPE" FOREIGN KEY (
   "MEMBER_LEVEL_NO"
)
REFERENCES "MEMBER_LEVEL" (
   "MEMBER_LEVEL_NO"
);

ALTER TABLE "LOGIN_HISTORY" ADD CONSTRAINT "FK_MEMBER_TO_LOGIN_HISTORY" FOREIGN KEY (
   "MEMBER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

ALTER TABLE "TEMP_POST" ADD CONSTRAINT "FK_BOARD_TO_TEMP_POST" FOREIGN KEY (
   "BOARD_NO"
)
REFERENCES "BOARD" (
   "BOARD_NO"
);

ALTER TABLE "MEMBER_SECESSION" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_SECESSION" FOREIGN KEY (
   "S_MEMBER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

ALTER TABLE "MEMBER_SECESSION" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_SECESSION2" FOREIGN KEY (
   "S_MANAGER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

ALTER TABLE "WRITING_FORM" ADD CONSTRAINT "FK_WRITING_FORM_TYPE" FOREIGN KEY (
   "WRITING_FORM_NO"
)
REFERENCES "WRITING_FORM_TYPE" (
   "WRITING_FORM_NO"
);

ALTER TABLE "WRITING_FORM" ADD CONSTRAINT "FK_BOARD_TYPE_TO_WRITING_FORM" FOREIGN KEY (
   "BOARD_CODE"
)
REFERENCES "BOARD_TYPE" (
   "BOARD_CODE"
);

ALTER TABLE "MEMBER_HOLD" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_HOLD_1" FOREIGN KEY (
   "H_MEMBER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

ALTER TABLE "MEMBER_HOLD" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_HOLD_2" FOREIGN KEY (
   "H_MANAGER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

ALTER TABLE CAFE.BOARD MODIFY B_CREATE_DATE DATE DEFAULT SYSDATE;

COMMIT;


/* 권한 테이블 생성 */
CREATE TABLE "AUTHORITY" (
	"AUTHORITY_NO"	NUMBER		NOT NULL,
	"AUTHORITY_NAME"	CHAR(1)		NOT NULL,
	"AUTHORITY_IMG"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "AUTHORITY"."AUTHORITY_NO" IS '회원 권한(2: 일반회원, 0: 관리자 ,1 :부관리자)';

COMMENT ON COLUMN "AUTHORITY"."AUTHORITY_NAME" IS '권한명(G: 일반회원, M: 관리자 ,S :부관리자)';

COMMENT ON COLUMN "AUTHORITY"."AUTHORITY_IMG" IS '관리자이미지';

ALTER TABLE "AUTHORITY" ADD CONSTRAINT "PK_AUTHORITY" PRIMARY KEY (
	"AUTHORITY_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_AUTHORITY_TO_MEMBER_1" FOREIGN KEY (
	"AUTHORITY_NO"
)
REFERENCES "AUTHORITY" (
	"AUTHORITY_NO"
);

-- 이전 권한명 컬럼을 삭제
ALTER TABLE MEMBER DROP (AUTHORITY_NAME);

-- 권한 분류 컬럼 추가
ALTER TABLE MEMBER ADD(AUTHORITY_NO NUMBER);


-- 멤버레벨 이미지 컬럼 추가
ALTER TABLE MEMBER_LEVEL ADD(M_NUMBER_IMG VARCHAR2(300));

-- 카페 정보 가입 가능 여부 컬럼 추가 
ALTER TABLE CAFE_INFO ADD(CAFE_JOIN_FL CHAR(1) DEFAULT'Y' NOT NULL);


-- 시퀀스 생성 생성 기본값 1부터 시작 (총 13개)
-- 시퀀스 삭제 DROP SEQUENCE 시퀀스명;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE; -- 회원 번호
CREATE SEQUENCE SEQ_LOG_HISTORY_NO NOCACHE; -- 로그인 이력 번호
CREATE SEQUENCE SEQ_SECESSION_NO NOCACHE; -- 탈퇴 번호
CREATE SEQUENCE SEQ_HOLD_NO NOCACHE; -- 활동정지 번호
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE; -- 게시글 번호
CREATE SEQUENCE SEQ_BOARD_CODE NOCACHE; -- 게시판 종류별 코드
CREATE SEQUENCE SEQ_MAIN_CATEGORY_NO NOCACHE; -- 게시판 대분류 번호
CREATE SEQUENCE SEQ_TEMP_POST_NO NOCACHE; -- 임시등록번호
CREATE SEQUENCE SEQ_IMG_NO NOCACHE; -- 게시글 이미지 번호
CREATE SEQUENCE SEQ_COMMENT_NO NOCACHE; -- 댓글 번호
CREATE SEQUENCE SEQ_WRITING_FORM_NO NOCACHE; -- 게시글 글양식 번호
CREATE SEQUENCE SEQ_TITLE_TAG_NO NOCACHE; -- 말머리 번호
CREATE SEQUENCE SEQ_CAFE_NO NOCACHE; -- 카페 번호


-- 멤버 레벨 테이블
SELECT * FROM MEMBER_LEVEL;
INSERT INTO MEMBER_LEVEL VALUES(2, '새내기', 0, 0, 0, NULL);
INSERT INTO MEMBER_LEVEL VALUES(3, '일반여행자', 5, 10, 20, NULL);
INSERT INTO MEMBER_LEVEL VALUES(4, '성실여행자', 10, 20, 30, NULL);
INSERT INTO MEMBER_LEVEL VALUES(5, '우수여행자', 20, 30, 40, NULL);
INSERT INTO MEMBER_LEVEL VALUES(6, '감사멤버', 30, 40, 50, NULL);


-- 멤버 레벨 테이블의 이미지 컬럼명 수정 
ALTER TABLE MEMBER_LEVEL RENAME COLUMN M_NUMBER_IMG TO MEMBER_LEVEL_IMG;


-- 비번 암호화 cafe!
UPDATE MEMBER SET MEMBER_PW ='$2a$10$5QmOwkVwr3Ck87jdsIkdse00zhjAqfnApu7ogmEOP1boSa9e2Yvoe';
SELECT * FROM MEMBER;
COMMIT;

-- 이미지명 컬럼 속성 수정(12/8 상단에 BOARD_IMG 테이블 생성 구문에서 수정 완료. 새 테이블 생성 시 필요 없기에 주석 처리 - 서희)
-- ALTER TABLE BOARD_IMG MODIFY IMG_RENAME VARCHAR2(300);