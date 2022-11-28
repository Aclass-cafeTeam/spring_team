SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
AND MEMBER_LEVEL_NO = 2
ORDER BY MEMBER_NICKNAME;

INSERT INTO LOGIN_HISTORY VALUES(SEQ_LOG_HISTORY_NO.NEXTVAL,DEFAULT,1);
SELECT * FROM LOGIN_HISTORY lh;

SELECT * FROM MEMBER_LEVEL ml;
SELECT * FROM AUTHORITY a ; 
SELECT * FROM "MEMBER" m;
SELECT * FROM BOARD b ;
SELECT * FROM "COMMENT" c ;

SELECT COUNT(*) FROM "MEMBER" m
WHERE MEMBER_DEL_FL IN ('S')
AND SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) = ;

COMMIT;
INSERT 

SELECT * FROM "MEMBER" m
WHERE MEMBER_DEL_FL IN ('N')
AND SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) = 'user01';

SELECT HOLD_NO, MEMBER_NO,PROFILE_IMG, 
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,MEMBER_NICKNAME ,TO_CHAR(HOLD_DATE ,'YYYY.MM.DD') HOLD_DATE 
,HOLD_REASON
,(SELECT SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) FROM MEMBER_HOLD sub JOIN "MEMBER" ON(MEMBER_NO = H_MANAGER_NO) WHERE sub.H_MANAGER_NO =mh.H_MANAGER_NO) H_MEMBER_EMAIL 
,(SELECT MEMBER_NICKNAME FROM MEMBER_HOLD sub JOIN "MEMBER" ON(MEMBER_NO = H_MANAGER_NO) WHERE sub.H_MANAGER_NO =mh.H_MANAGER_NO) H_MEMBER_NICKNAME 
FROM "MEMBER" 
JOIN MEMBER_HOLD mh ON (MEMBER_NO = H_MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('S')
AND HOLD_FL IN ('Y');
-----------------------------------------------------------------------
SELECT ms.S_MEMBER_NO 
,(SELECT SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1)  FROM MEMBER_SECESSION sub JOIN "MEMBER" ON(MEMBER_NO = sub.S_MEMBER_NO) WHERE sub.S_MEMBER_NO =ms.S_MEMBER_NO) MEMBER_EMAIL 
,(SELECT MEMBER_NICKNAME FROM MEMBER_SECESSION sub JOIN "MEMBER" ON(MEMBER_NO = sub.S_MEMBER_NO) WHERE sub.S_MEMBER_NO =ms.S_MEMBER_NO) MEMBER_NICKNAME 
,SECESSION_REASON_INFO, TO_CHAR(SECESSION_DATE ,'YYYY.MM.DD. HH:mm') SECESSION_DATE  ,S_MANAGER_NO
,(SELECT SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) FROM MEMBER_SECESSION sub JOIN "MEMBER" ON(MEMBER_NO = S_MANAGER_NO) WHERE sub.S_MEMBER_NO =ms.S_MEMBER_NO) S_MEMBER_EMAIL 
,(SELECT MEMBER_NICKNAME FROM MEMBER_SECESSION  sub JOIN "MEMBER" ON(MEMBER_NO = S_MANAGER_NO)WHERE sub.S_MEMBER_NO =ms.S_MEMBER_NO) S_MEMBER_NICKNAME 
,SECESSION_REASON
FROM MEMBER_SECESSION ms 
LEFT JOIN "MEMBER" m ON(MEMBER_NO = S_MEMBER_NO)
WHERE S_MANAGER_NO IS NOT NULL;

SELECT SEQ_SECESSION_NO.CURRVAL FROM DUAL;
SELECT SEQ_SECESSION_NO.NEXTVAL FROM DUAL;
---------------------------------------------------------------------------
ALTER TABLE MEMBER_HOLD ADD HOLD_REASON VARCHAR2(150) DEFAULT '바람직하지 않은 활동(광고, 도배, 욕설, 비방 등)' NOT NULL;

ALTER TABLE MEMBER_SECESSION MODIFY SECESSION_REASON_INFO VARCHAR2(150) DEFAULT NULL;

INSERT INTO MEMBER_SECESSION VALUES(5,SYSDATE,'I',80,4,DEFAULT);
INSERT INTO MEMBER_SECESSION VALUES(SEQ_SECESSION_NO.NEXTVAL,SYSDATE,'I',81,4,DEFAULT);
INSERT INTO MEMBER_HOLD VALUES(SEQ_HOLD_NO.NEXTVAL,76,4,SYSDATE,'Y',DEFAULT);
------------------------------------------------------------------------------------------------------------
--탈퇴멤버
SELECT ms.S_MEMBER_NO MEMBER_NO
,(SELECT SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) FROM MEMBER_SECESSION sub JOIN "MEMBER" ON(MEMBER_NO = sub.S_MEMBER_NO) WHERE sub.S_MEMBER_NO =ms.S_MEMBER_NO) MEMBER_EMAIL 
,(SELECT MEMBER_NICKNAME FROM MEMBER_SECESSION sub JOIN "MEMBER" ON(MEMBER_NO = sub.S_MEMBER_NO) WHERE sub.S_MEMBER_NO =ms.S_MEMBER_NO) MEMBER_NICKNAME 
,SECESSION_REASON_INFO, TO_CHAR(SECESSION_DATE ,'YYYY.MM.DD. HH:mm') SECESSION_DATE  ,S_MANAGER_NO
,(SELECT SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) FROM MEMBER_SECESSION sub JOIN "MEMBER" ON(MEMBER_NO = S_MANAGER_NO) WHERE sub.S_MEMBER_NO =ms.S_MEMBER_NO) S_MEMBER_EMAIL 
,(SELECT MEMBER_NICKNAME FROM MEMBER_SECESSION  sub JOIN "MEMBER" ON(MEMBER_NO = S_MANAGER_NO)WHERE sub.S_MEMBER_NO =ms.S_MEMBER_NO) S_MEMBER_NICKNAME 
,(CASE 
	WHEN SECESSION_REASON = 'F'
	THEN 'Y'  
	WHEN SECESSION_REASON = 'I'
	THEN 'N'
END) SECESSION_FL
FROM MEMBER_SECESSION ms 
LEFT JOIN "MEMBER" m ON(MEMBER_NO = S_MEMBER_NO)
WHERE S_MANAGER_NO IS NOT NULL
AND SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) = 'user01';

UPDATE "MEMBER_SECESSION" SET SECESSION_REASON_INFO = NULL WHERE SECESSION_NO =4; 

SELECT *
FROM MEMBER_SECESSION ms 
LEFT JOIN "MEMBER" m ON(MEMBER_NO = S_MEMBER_NO)
WHERE S_MANAGER_NO IS NOT NULL
AND SECESSION_REASON = 'F'
AND MEMBER_EMAIL = 'user00@never.com';
-------------------------------------------------------------------------------------------
SELECT *
FROM MEMBER_SECESSION ms 
LEFT JOIN "MEMBER" m ON(MEMBER_NO = S_MEMBER_NO)
WHERE S_MANAGER_NO IS NOT NULL;

(SELECT SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) , sub.S_MEMBER_NO FROM MEMBER_SECESSION sub JOIN "MEMBER" ON(MEMBER_NO = sub.S_MEMBER_NO) WHERE sub.S_MEMBER_NO =6);

(SELECT SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) FROM MEMBER_SECESSION JOIN "MEMBER" ON(MEMBER_NO = S_MEMBER_NO));

AND SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) = 'user01';

CREATE SEQUENCE SEQ_SECESSION_NO
INCREMENT BY 1
START WITH 1;

SELECT LOGIN_DATE,MEMBER_NO FROM "MEMBER" m
LEFT JOIN LOGIN_HISTORY USING(MEMBER_NO);

SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO,COUNT(LOGIN_DATE) LOGHISTORY_COUNT  
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO
ORDER BY 2;

SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2;


SELECT NVL(COUNT(COMMENT_NO),0) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
GROUP BY MEMBER_NO  
ORDER BY 2;

SELECT COUNT(*) FROM "MEMBER" m
WHERE MEMBER_DEL_FL IN ('N','Y');

INSERT INTO "MEMBER" VALUES(SEQ_MEMBER_NO.NEXTVAL,'user11@never.com','$2a$10$5QmOwkVwr3Ck87jdsIkdse00zhjAqfnApu7ogmEOP1boSa9e2Yvoe','유저십일',NULL,'/resources/images/main/철수2.png',SYSDATE,DEFAULT,2,2);
INSERT INTO "MEMBER" VALUES(SEQ_MEMBER_NO.NEXTVAL,'user12@never.com','$2a$10$5QmOwkVwr3Ck87jdsIkdse00zhjAqfnApu7ogmEOP1boSa9e2Yvoe','유저십이',NULL,'/resources/images/main/철수2.png',SYSDATE,DEFAULT,2,2);

---------------------
SELECT BOARD_COUNT,MEMBER_NO FROM "MEMBER" m
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
WHERE to_char(B_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S')
AND BOARD_COUNT >= 30
AND MEMBER_LEVEL_NO = 2;
---------------------
SELECT BOARD_COUNT,MEMBER_NO FROM "MEMBER" m
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S')
AND BOARD_COUNT >= 30
AND MEMBER_LEVEL_NO = 2;
-----------------------------
SELECT COUNT(*) FROM "MEMBER" m
	LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
	FROM BOARD b 
	<if test ="periodOption == 1">
	WHERE to_char(B_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
	</if>
	GROUP BY MEMBER_NO
	ORDER BY 2)
	USING(MEMBER_NO)
	WHERE MEMBER_DEL_FL IN ('N','S')
	<if test ="aboveOption == 1">
		<![CDATA[AND BOARD_COUNT >=]]> #{boardCount}
	</if>
	<if test ="aboveOption == 0">
		<![CDATA[AND BOARD_COUNT <=]]> #{boardCount}
	</if>
	<if test ="memberLevelNo != 0">
		AND MEMBER_LEVEL_NO = #{memberLevelNo}
	</if>
-----------------------------------
--게시글 수에 따라 
SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
AND BOARD_COUNT >= 30
AND MEMBER_LEVEL_NO = 2
ORDER BY MEMBER_NICKNAME;
-----------------------------------------------------------
----------------게시글 수에 따라 최근 한달
SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b
<if test ="periodOption == 1">
WHERE to_char(B_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
</if>
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
<where>
	<if test ="aboveOption == 1">
		BOARD_COUNT <![CDATA[>=]]> 0
	</if>
	<if test ="aboveOption == 0">
		BOARD_COUNT <![CDATA[<=]]> 0
	</if>
	
	<if test ="memberLevelNo != 0">
		AND MEMBER_LEVEL_NO = 2
	</if>
</where>
ORDER BY MEMBER_NICKNAME;

--AND BOARD_COUNT >= 30  --조건
--AND MEMBER_LEVEL_NO = 2   ---조건
---------------------------------
(SELECT BOARD_COUNT FROM "MEMBER" m
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S')
AND MEMBER_LEVEL_NO = 2) >= 30
-----------------------------------------------------------------------------
---------------------------------------------------------------
--댓글 수에 따라 멤버
SELECT COUNT(*) 
FROM (SELECT COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM (SELECT NVL(COMMENT_COUNT,0) COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM "MEMBER" m
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
<if test ="periodOption == 1">
	WHERE to_char(C_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
</if>
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S'))
<where>
	<if test ="aboveOption == 1">
		COMMENT_COUNT <![CDATA[>=]]> 0
	</if>
	<if test ="aboveOption == 0">
		COMMENT_COUNT <![CDATA[<=]]> 0
	</if>
	
	<if test ="memberLevelNo != null">
		AND MEMBER_LEVEL_NO = 2)
	</if>
</where>

--------------------------------------------------
---------------------------------------------------------------
--댓글 수에 따라 멤버
SELECT COUNT(*) 
FROM (SELECT COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM (SELECT NVL(COMMENT_COUNT,0) COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM "MEMBER" m
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c
WHERE to_char(C_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S'))
WHERE COMMENT_COUNT >=0
);
--memberLevelNo(234)     0이면 등급 따지지 않고 전체 멤버 조회!!!!!
--periodOption(0 전체 1 최신)
--articleCountInput (댓글수)    aboveOption(1 이상 0 이하 )
--AND MEMBER_LEVEL_NO = 2
--------------------------------------------------
----------------------------------------------------------------------------

--------------------------------------------------------------------------
---------------------------------------------------------------------------
SELECT *
FROM 
(SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
<if test ="periodOption == 1">
	WHERE to_char(C_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
</if>
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
ORDER BY MEMBER_NICKNAME)
<where>
	<if test ="aboveOption == 1">
		COMMENT_COUNT <![CDATA[>=]]> 0
	</if>
	<if test ="aboveOption == 0">
		COMMENT_COUNT <![CDATA[<=]]> 0
	</if>
	
	<if test ="memberLevelNo != null">
		AND MEMBER_LEVEL_NO = 2)
	</if>
</where>

--memberLevelNo(234)     0이면 등급 따지지 않고 전체 멤버 조회!!!!!
--periodOption(0 전체 1 최신)
--articleCountInput (댓글수)    aboveOption(1 이상 0 이하 )
--AND MEMBER_LEVEL_NO = 2
SELECT COUNT(*) 
FROM (SELECT COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM (SELECT NVL(COMMENT_COUNT,0) COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM "MEMBER" m
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
<if test ="periodOption == 1">
	WHERE to_char(C_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
</if>
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S'))
<where>
	<if test ="aboveOption == 1">
		COMMENT_COUNT <![CDATA[>=]]> 0
	</if>
	<if test ="aboveOption == 0">
		COMMENT_COUNT <![CDATA[<=]]> 0
	</if>
	
	<if test ="memberLevelNo != null">
		AND MEMBER_LEVEL_NO = 2)
	</if>
</where>
-----------------------------------------------------
---------------------------------------------------------
---최근 한달
SELECT *
FROM 
(SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c
WHERE to_char(C_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
ORDER BY MEMBER_NICKNAME)
WHERE COMMENT_COUNT >= 0
AND MEMBER_LEVEL_NO = 2;
------------------------------------------------------------









SELECT COMMENT_COUNT, MEMBER_NO
FROM (SELECT COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM (SELECT NVL(COMMENT_COUNT,0) COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM "MEMBER" m
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c
WHERE to_char(C_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S')));







AND COMMENT_COUNT >=0
AND MEMBER_LEVEL_NO = 2;
--------------------------------------------------
SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2;

SELECT BOARD_NO ,MEMBER_NO 
FROM BOARD b
WHERE to_char(B_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd');

SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
WHERE to_char(B_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO
ORDER BY 2;

------------------------------------------------------------------------------------------------
--방문 수 상세 조회!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--하기 싫다 집에 가고 싶다아아아앙아아아아아아ㅏ아아아아아아아아아아아아아아아아ㅏㅇ
-------------------------------------------------------------------------------------------------------
--count로 감싸면 된다
SELECT *
FROM (SELECT MAX(LOGIN_DATE) LOGIN_DATE ,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT,MEMBER_LEVEL_NO 
FROM (SELECT *
FROM "MEMBER"
LEFT JOIN LOGIN_HISTORY
USING(MEMBER_NO))
GROUP BY MEMBER_NO,MEMBER_LEVEL_NO 
ORDER BY 2)
WHERE LOGHISTORY_COUNT >= 2
AND MEMBER_LEVEL_NO =2;
-----------
SELECT COUNT(*) 
FROM (SELECT *
FROM (SELECT MAX(LOGIN_DATE) LOGIN_DATE ,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT,MEMBER_LEVEL_NO 
FROM (SELECT *
FROM "MEMBER"
LEFT JOIN LOGIN_HISTORY
USING(MEMBER_NO))
GROUP BY MEMBER_NO,MEMBER_LEVEL_NO 
ORDER BY 2)
WHERE LOGHISTORY_COUNT >= 2
AND MEMBER_LEVEL_NO =2);
----------------------------------------------------------------------------------------------------------
--count로 감싸면 된다
SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT,MEMBER_LEVEL_NO 
FROM (SELECT *
FROM "MEMBER"
LEFT JOIN LOGIN_HISTORY
USING(MEMBER_NO))
GROUP BY MEMBER_NO,MEMBER_LEVEL_NO 
ORDER BY 2;
----------
SELECT * 
FROM (SELECT *
FROM (SELECT MAX(LOGIN_DATE) LOGIN_DATE ,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT,MEMBER_LEVEL_NO 
FROM (SELECT *
FROM "MEMBER"
LEFT JOIN LOGIN_HISTORY
USING(MEMBER_NO))
WHERE to_char(LOGIN_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO,MEMBER_LEVEL_NO 
ORDER BY 2)
WHERE LOGHISTORY_COUNT >= 2
AND MEMBER_LEVEL_NO =2);
------
SELECT COUNT(*) 
FROM (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT,MEMBER_LEVEL_NO 
FROM (SELECT *
FROM "MEMBER"
LEFT JOIN LOGIN_HISTORY
USING(MEMBER_NO))
WHERE to_char(LOGIN_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
AND MEMBER_DEL_FL IN ('N','S')
GROUP BY MEMBER_NO,MEMBER_LEVEL_NO 
ORDER BY 2);

<where>
		<if test ="aboveOption == 1">
			COMMENT_COUNT <![CDATA[>=]]> #{commentCountInput}
		</if>
		<if test ="aboveOption == 0">
			COMMENT_COUNT <![CDATA[<=]]> #{commentCountInput}
		</if>
		<if test ="memberLevelNo != 0">
			AND MEMBER_LEVEL_NO = #{memberLevelNo}
		</if>
</where>
------------------------------------------------------------------------------------------------------
--방문수 상세조회 페이징처리 
SELECT COUNT(*) 
FROM (SELECT *
FROM (SELECT MAX(LOGIN_DATE) LOGIN_DATE ,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT,MEMBER_LEVEL_NO 
FROM (SELECT *
FROM "MEMBER"
LEFT JOIN LOGIN_HISTORY
USING(MEMBER_NO))
<if test ="periodOption == 1">
	WHERE to_char(LOGIN_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
</if>
GROUP BY MEMBER_NO,MEMBER_LEVEL_NO 
ORDER BY 2)
<where>
	<if test ="aboveOption == 1">
		WHERE LOGHISTORY_COUNT >= 2
	</if>
	<if test ="aboveOption == 0">
		WHERE LOGHISTORY_COUNT <= 2
	</if>
	<if test ="memberLevelNo != 0">
			AND MEMBER_LEVEL_NO = #{memberLevelNo}
	</if>
</where>
)

------------------------------------------------------------------------------------------------------------
--방문수에 따른 상세조회
SELECT *
FROM (SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
WHERE to_char(LOGIN_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
ORDER BY MEMBER_NICKNAME)
WHERE LOGHISTORY_COUNT >= 1
AND MEMBER_LEVEL_NO = 2;
------------------------------------------------------------------------
--가입일이나 최종 방문일에 따른 상세조회
SELECT * 
FROM "MEMBER"
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO) USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S')
AND to_char(LOGIN_DATE,'yyyy-mm-dd') 
BETWEEN to_char(TO_DATE('2022-11-20'),'yyyy-mm-dd') AND to_char(TO_DATE('2022-11-26'),'yyyy-mm-dd')
--AND to_char(ENROLL_DATE,'yyyy-mm-dd') 
--BETWEEN to_char(TO_DATE('2022-11-20'),'yyyy-mm-dd') AND to_char(TO_DATE('2022-11-26'),'yyyy-mm-dd')
ORDER BY 1;
--------------
SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
AND MEMBER_LEVEL_NO = 2
AND to_char(LOGIN_DATE,'yyyy-mm-dd') 
BETWEEN to_char(TO_DATE('2022-11-20'),'yyyy-mm-dd') AND to_char(TO_DATE('2022-11-26'),'yyyy-mm-dd')
--AND to_char(ENROLL_DATE,'yyyy-mm-dd') 
--BETWEEN to_char(TO_DATE('2022-11-20'),'yyyy-mm-dd') AND to_char(TO_DATE('2022-11-26'),'yyyy-mm-dd')
ORDER BY MEMBER_NICKNAME;
--------------------------------------------------------------------------------------------------------
--마이바티스 조건문
SELECT *
FROM (SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
<if test ="periodOption == 1">
	WHERE to_char(LOGIN_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
</if>
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c 
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
ORDER BY MEMBER_NICKNAME)
<where>
	<if test ="aboveOption == 1">
		LOGHISTORY_COUNT >= 1
	</if>
	<if test ="aboveOption == 0">
		LOGHISTORY_COUNT <= 1
	</if>
	<if test ="memberLevelNo != 0">
		AND MEMBER_LEVEL_NO = #{memberLevelNo}
	</if>
</where>


------------------------------------------
<where>
	<if test ="aboveOption == 1">
		WHERE LOGHISTORY_COUNT >= 2
	</if>
	<if test ="aboveOption == 0">
		WHERE LOGHISTORY_COUNT <= 2
	</if>
	<if test ="memberLevelNo != 0">
			AND MEMBER_LEVEL_NO = #{memberLevelNo}
	</if>
</where>

















SELECT *
FROM "MEMBER"
LEFT JOIN LOGIN_HISTORY
USING(MEMBER_NO);

SELECT COUNT(*) 
FROM (SELECT COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM (SELECT NVL(COMMENT_COUNT,0) COMMENT_COUNT, MEMBER_NO ,MEMBER_LEVEL_NO
FROM "MEMBER" m
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c
WHERE to_char(C_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE MEMBER_DEL_FL IN ('N','S'))
WHERE COMMENT_COUNT >=0
);




SELECT *
FROM 
(SELECT PROFILE_IMG, MEMBER_NICKNAME,
SUBSTR(MEMBER_EMAIL, 0, INSTR(MEMBER_EMAIL, '@')-1) MEMBER_EMAIL,
TO_CHAR(ENROLL_DATE ,'YYYY.MM.DD') ENROLL_DATE, 
(SELECT MEMBER_LEVEL_IMG FROM MEMBER_LEVEL ml WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_IMG,
(SELECT MEMBER_LEVEL_NAME FROM MEMBER_LEVEL ml  WHERE ml.MEMBER_LEVEL_NO = m.MEMBER_LEVEL_NO) MEMBER_LEVEL_NAME
,MEMBER_LEVEL_NO
,(SELECT AUTHORITY_IMG FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_IMG
,(SELECT AUTHORITY_NAME FROM AUTHORITY a  WHERE a.AUTHORITY_NO = m.AUTHORITY_NO) AUTHORITY_NAME
,TO_CHAR(LOGIN_DATE ,'YYYY.MM.DD') LOGIN_DATE
,NVL(LOGHISTORY_COUNT,0) LOGHISTORY_COUNT
,NVL(BOARD_COUNT,0) BOARD_COUNT
,NVL(COMMENT_COUNT,0) COMMENT_COUNT
FROM "MEMBER" m 
LEFT JOIN (SELECT MAX(LOGIN_DATE) LOGIN_DATE,MEMBER_NO ,COUNT(LOGIN_DATE) LOGHISTORY_COUNT 
FROM LOGIN_HISTORY lh
GROUP BY MEMBER_NO
ORDER BY 2) USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(BOARD_NO) BOARD_COUNT ,MEMBER_NO 
FROM BOARD b 
GROUP BY MEMBER_NO
ORDER BY 2)
USING(MEMBER_NO)
LEFT JOIN (SELECT COUNT(COMMENT_NO) COMMENT_COUNT,MEMBER_NO 
FROM "COMMENT" c
WHERE to_char(C_CREATE_DATE,'yyyy.mm.dd') BETWEEN to_char(add_months(sysdate,-1),'yyyy.mm.dd') AND to_char(SYSDATE,'yyyy.mm.dd')
GROUP BY MEMBER_NO  
ORDER BY 2)
USING(MEMBER_NO)
WHERE  MEMBER_DEL_FL IN ('N','Y')
ORDER BY MEMBER_NICKNAME)
WHERE COMMENT_COUNT >= 0
AND MEMBER_LEVEL_NO = 2;










