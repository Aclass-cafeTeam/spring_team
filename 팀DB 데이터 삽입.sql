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


