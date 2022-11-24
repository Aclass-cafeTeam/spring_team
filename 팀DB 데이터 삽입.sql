COMMENT ON COLUMN "MEMBER".AUTHORITY_NO IS '회원 권한(2: 일반회원, 0: 카페매니저 ,1 :부매니저)';
COMMENT ON COLUMN "AUTHORITY".AUTHORITY_NO IS '회원 권한(2: 일반회원, 0: 카페매니저 ,1 :부매니저)';

ALTER TABLE CAFE.AUTHORITY MODIFY AUTHORITY_NAME VARCHAR2(300);
COMMENT ON COLUMN "AUTHORITY".AUTHORITY_NAME IS '권한명';

ALTER TABLE "MEMBER" MODIFY AUTHORITY_NO DEFAULT 2;
--ALTER TABLE CAFE."MEMBER" MODIFY (AUTHORITY_NO NOT NULL); //AUTHORITY_NO값을 NULL이 아닌걸로 변경하고 
----------------------------------------------------------------------
--insert 데이터 삽입 
--member------------------------------------------
ALTER TABLE "MEMBER" MODIFY PROFILE_IMG DEFAULT '/resources/images/main/프로필.png';
UPDATE  "MEMBER" SET AUTHORITY_NO = 2 , MEMBER_LEVEL_NO = 2 , MEMBER_EMAIL = 'guest01@never.com' WHERE MEMBER_NO = 1;
UPDATE  "MEMBER" SET AUTHORITY_NO = 2 , MEMBER_LEVEL_NO = 2 , MEMBER_EMAIL = 'guest02@never.com' WHERE MEMBER_NO = 2;
UPDATE  "MEMBER" SET AUTHORITY_NO = 0 , MEMBER_EMAIL = 'manager01@never.com' WHERE MEMBER_NO = 3;
UPDATE  "MEMBER" SET AUTHORITY_NO = 1 , MEMBER_EMAIL = 'manager02@never.com' WHERE MEMBER_NO = 4;
UPDATE  "MEMBER" SET PROFILE_IMG = '/resources/images/main/프로필.png';


----------------------------------------------------------------------
--insert 데이터 삽입 
--등급테이블------------------------------------------
UPDATE  MEMBER_LEVEL SET MEMBER_LEVEL_IMG = '/resources/images/manager/감사멤버.png' WHERE MEMBER_LEVEL_NAME = '감사멤버';
UPDATE MEMBER_LEVEL SET MEMBER_LEVEL_IMG = '/resources/images/manager/새내기.png' WHERE MEMBER_LEVEL_NAME = '새내기';
UPDATE MEMBER_LEVEL SET MEMBER_LEVEL_IMG = '/resources/images/manager/일반여행자.png' WHERE MEMBER_LEVEL_NAME = '일반여행자';
UPDATE MEMBER_LEVEL SET MEMBER_LEVEL_IMG = '/resources/images/manager/성실여행자.png' WHERE MEMBER_LEVEL_NAME = '성실여행자';
UPDATE MEMBER_LEVEL SET MEMBER_LEVEL_IMG = '/resources/images/manager/우수여행자.png' WHERE MEMBER_LEVEL_NAME = '우수여행자';

----------------------------------------------------------------------
--insert 데이터 삽입 
--권한테이블------------------------------------------
INSERT INTO AUTHORITY VALUES(0,'카페매니저','/resources/images/manager/카페매니저.png');
INSERT INTO AUTHORITY VALUES(1,'부매니저','/resources/images/manager/부매니저.png');
INSERT INTO AUTHORITY VALUES(2,'일반회원',NULL);

----------------------------------------------------------------------
--insert 데이터 삽입 
--로그인이력------------------------------------------
INSERT INTO LOGIN_HISTORY VALUES(SEQ_LOG_HISTORY_NO.NEXTVAL,SYSDATE,1);
INSERT INTO LOGIN_HISTORY VALUES(SEQ_LOG_HISTORY_NO.NEXTVAL,SYSDATE,2);
INSERT INTO LOGIN_HISTORY VALUES(SEQ_LOG_HISTORY_NO.NEXTVAL,SYSDATE,3);
INSERT INTO LOGIN_HISTORY VALUES(SEQ_LOG_HISTORY_NO.NEXTVAL,SYSDATE,4);
INSERT INTO LOGIN_HISTORY VALUES(SEQ_LOG_HISTORY_NO.NEXTVAL,SYSDATE,4);

COMMIT;

----------------------------------------------------------------------
-- 활동 정지 데이터 삽입------------------------------------------
INSERT INTO MEMBER_HOLD  
VALUES(SEQ_HOLD_NO.NEXTVAL, 7, 3, DEFAULT, DEFAULT);
-- MEMBER 테이블에서 정지여부 수기 변경!!
UPDATE MEMBER SET MEMBER_DEL_FL = 'S' WHERE MEMBER_NO = 7;



----------------------------------------------------------------------
-- 회원 탈퇴 데이터 삽입------------------------------------------
INSERT INTO MEMBER_SECESSION 
VALUES(SEQ_SECESSION_NO.NEXTVAL, DEFAULT, DEFAULT, 6, 3);
-- MEMBER 테이블에서 삭제여부 수기 변경!!
UPDATE MEMBER SET MEMBER_DEL_FL = 'Y' WHERE MEMBER_NO = 6;



----------------------------------------------------------------------
-- WRITING_FORM_TYPE 글쓰기 양식 데이터 삽입---------------------
INSERT INTO WRITING_FORM_TYPE 
VALUES(SEQ_WRITING_FORM_NO.NEXTVAL, '가입인사', '가입인사를 자유롭게 남겨주세요.');

INSERT INTO WRITING_FORM_TYPE 
VALUES(SEQ_WRITING_FORM_NO.NEXTVAL, '생활이야기', '생활이야기를 자유롭게 남겨주세요.');

INSERT INTO WRITING_FORM_TYPE 
VALUES(SEQ_WRITING_FORM_NO.NEXTVAL, '여행사진', '여행 사진을 공유해주세요.');

INSERT INTO WRITING_FORM_TYPE 
VALUES(SEQ_WRITING_FORM_NO.NEXTVAL, '맛집', '맛있는 맛집을 공유해주세요.');



----------------------------------------------------------------------
-- 회원(6~16), 게시판(4,11)번 랜덤으로 게시글 삽입
BEGIN
	FOR I IN 1..300 LOOP
		INSERT INTO BOARD 
		VALUES(SEQ_BOARD_NO.NEXTVAL,
			   SEQ_BOARD_NO.CURRVAL || '번째 게시글',
			   SEQ_BOARD_NO.CURRVAL || '번째 게시글입니다.<br> 게시글 샘플입니다',
			   DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 
			   FLOOR(DBMS_RANDOM.VALUE(6,17)), FLOOR(DBMS_RANDOM.VALUE(4,12)), DEFAULT);
	END LOOP;
END;
/
COMMIT;

----------------------------------------------------------------------
-- 말머리 샘플 데이터
INSERT INTO "TITLE_TAG"
VALUES(SEQ_TITLE_TAG_NO.NEXTVAL, '정보');
INSERT INTO "TITLE_TAG"
VALUES(SEQ_TITLE_TAG_NO.NEXTVAL, '질문');
INSERT INTO "TITLE_TAG"
VALUES(SEQ_TITLE_TAG_NO.NEXTVAL, '잡담');

----------------------------------------------------------------------
-- 게시판 대분류 샘플 데이터
INSERT INTO "MAIN_CATEGORY"
VALUES(SEQ_MAIN_CATEGORY_NO.NEXTVAL, '기본 게시판', DEFAULT);
INSERT INTO "MAIN_CATEGORY"
VALUES(SEQ_MAIN_CATEGORY_NO.NEXTVAL, '여행 정보', DEFAULT);
INSERT INTO "MAIN_CATEGORY"
VALUES(SEQ_MAIN_CATEGORY_NO.NEXTVAL, '질문 코너', DEFAULT);
INSERT INTO "MAIN_CATEGORY"
VALUES(SEQ_MAIN_CATEGORY_NO.NEXTVAL, '갤러리 자료', DEFAULT);

----------------------------------------------------------------------
-- 게시판 종류 샘플 데이터 
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '공지사항', 1, 1, DEFAULT, DEFAULT, DEFAULT, 2, DEFAULT); -- 말머리 사용X(디폴트)
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '자유게시판', 2, 1, 'Y', DEFAULT, DEFAULT, 2, DEFAULT); -- 말머리 사용O
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '등업게시판', 3, 1, DEFAULT, DEFAULT, DEFAULT, 2, DEFAULT); -- 말머리 사용X
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '서울/수도권 나들이', 1, 2, 'Y', DEFAULT, DEFAULT, 3, DEFAULT); -- 일반멤버
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '제주 여행지', 2, 2, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '충청권 여행지', 3, 2, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '강원권 여행지', 4, 2, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '전라권 여행지', 5, 2, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '경상권 여행지', 6, 2, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '국내 여행 Q/A', 1, 3, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '기타 Q/A', 2, 3, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '여행 후기', 1, 4, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '맛집 사진 공유', 2, 4, 'Y', DEFAULT, DEFAULT, 3, DEFAULT);

ALTER TABLE "MEMBER" MODIFY PROFILE_IMG VARCHAR2(300) DEFAULT '/resources/images/main/프로필.PNG';
------------------------------------------------------------------------
-- 공지게시판에 메인매니저가 공지 100개
BEGIN
   FOR I IN 1..100 LOOP
      INSERT INTO BOARD 
      VALUES(SEQ_BOARD_NO.NEXTVAL,
            SEQ_BOARD_NO.CURRVAL || '번째 공지',
            SEQ_BOARD_NO.CURRVAL || '번째 공지입니다.<br>안녕하세요.',
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 
            4, 2, DEFAULT);
   END LOOP;
END;

------------------------------------------------------------------------
-- 자유게시판에 메인/부매니저가 공지 10개
BEGIN
   FOR I IN 1..10 LOOP
      INSERT INTO BOARD 
      VALUES(SEQ_BOARD_NO.NEXTVAL,
            SEQ_BOARD_NO.CURRVAL || '번째 자유게시판 공지',
            SEQ_BOARD_NO.CURRVAL || '번째 자유게시판 공지입니다.<br>매너있는 자유게시판 사용 부탁드립니다.',
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 
            FLOOR(DBMS_RANDOM.VALUE(3, 5)), 2, DEFAULT);
   END LOOP;
END;
/

------------------------------------------------------------------------
-- 각 게시판별로 메인/부매니저가 공지 10개씩
BEGIN
   FOR I IN 1..90 LOOP
      INSERT INTO BOARD 
      VALUES(SEQ_BOARD_NO.NEXTVAL,
            SEQ_BOARD_NO.CURRVAL || '번째 게시판 공지',
            SEQ_BOARD_NO.CURRVAL || '번째 게시판 공지입니다.<br> 게시판 공지 샘플입니다',
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 
            FLOOR(DBMS_RANDOM.VALUE(3,5)), FLOOR(DBMS_RANDOM.VALUE(4,12)), DEFAULT);
   END LOOP;
END;

----------------------------------------------------------------------
-- 자유게시판에 샘플 100개
BEGIN
   FOR I IN 1..100 LOOP
      INSERT INTO BOARD 
      VALUES(SEQ_BOARD_NO.NEXTVAL,
            SEQ_BOARD_NO.CURRVAL || '번째 게시글',
            SEQ_BOARD_NO.CURRVAL || '번째 게시글입니다.<br> 게시글 샘플입니다',
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 
            FLOOR(DBMS_RANDOM.VALUE(6,17)), 2, DEFAULT);
   END LOOP;
END;

