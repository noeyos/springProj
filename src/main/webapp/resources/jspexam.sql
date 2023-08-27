CREATE TABLE PRODUCT (
    PRODUCT_ID VARCHAR2(10),
    RNAME VARCHAR2(300),
    UNIT_PRICE NUMBER,
    DESCRIPTION VARCHAR2(4000),
    MANUFACTURER VARCHAR2(100),
    CATEGORY VARCHAR2(90),
    UNITS_IN_STOCK NUMBER,
    CONDITION VARCHAR2(90),
    FILENAME VARCHAR2(1000),
    QUANTITY NUMBER,
    CONSTRAINT PK_PRODUCT PRIMARY KEY(PRODUCT_ID)
);


create or replace FUNCTION FN_GETCAMEL(COLUMN_NAME IN VARCHAR2)
RETURN VARCHAR2
IS
RSLT VARCHAR2(30);
BEGIN
--카멜표기로 변환(SITE_NUM -> siteNum)
SELECT LOWER(SUBSTR(REPLACE(INITCAP(COLUMN_NAME),'_'),1,1))
|| SUBSTR(REPLACE(INITCAP(COLUMN_NAME),'_'),2) INTO RSLT
FROM DUAL;
--리턴
RETURN RSLT;
END;
/

--구글 카멜변환(https://heavenly-appear.tistory.com/270)
SELECT COLUMN_NAME
, DATA_TYPE
, CASE WHEN DATA_TYPE='NUMBER' THEN 'private int ' || FN_GETCAMEL(COLUMN_NAME) || ';'
WHEN DATA_TYPE IN('VARCHAR2','CHAR') THEN 'private String ' || FN_GETCAMEL(COLUMN_NAME) || ';'
WHEN DATA_TYPE='DATE' THEN 'private Date ' || FN_GETCAMEL(COLUMN_NAME) || ';'
ELSE 'private String ' || FN_GETCAMEL(COLUMN_NAME) || ';'
END AS CAMEL_CASE
, '' RESULTMAP
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'MEMBER';


----------------------------------------

--DML(Data Manipulation Language) : select, insert, update, delete

insert INTO product values('P1234', null, null, null, null, null, null, null, null, null);
insert INTO product values('P1235', null, null, null, null, null, null, null, null, null);
insert INTO product values('P1236', null, null, null, null, null, null, null, null, null);
insert INTO product values('P1237', null, null, null, null, null, null, null, null, null);


select dbms_xdb.gethttpport() from dual;

------------------------------------------------------------

-- 사용자(1)
CREATE TABLE USERS(
    USERNAME VARCHAR2(150),
    PASSWORD VARCHAR2(150),
    ENABLED VARCHAR2(1),
    CONSTRAINT PK_USERS PRIMARY KEY(USERNAME)
);

-- 권한들(N)
-- 기본키(P.K)와 외래키(F.K)의 자료형(데이터타입)과 크기는 동일해야 함
CREATE TABLE AUTHORITIES (
    USERNAME VARCHAR2(150),
    AUTHORITY VARCHAR2(150),
    CONSTRAINT PK_AUTH PRIMARY KEY(USERNAME, AUTHORITY),
    CONSTRAINT FK_AUTH FOREIGN KEY(USERNAME) REFERENCES USERS(USERNAME)
);

-- EUQI JOIN(=동등조인, 내부조인)
SELECT A.USERNAME, A.PASSWORD, A.ENABLED FROM USERS A, AUTHORITIES B
WHERE A.USERNAME = B.USERNAME AND A.USERNAME = 'admin';

-- ANSI표준. INNER JOIN
SELECT A.USERNAME, A.PASSWORD, A.ENABLED
FROM USERS A INNER JOIN AUTHORITIES B ON(A.USERNAME = B.USERNAME)
WHERE A.USERNAME = 'admin';

----------------------------------------------------------

-- 사용자 테이블을 이용한 인증/인가 처리
CREATE TABLE MEMBER (
    USER_NO NUMBER,
    USER_ID VARCHAR2(150),
    USER_PW VARCHAR2(300),
    USER_NAME VARCHAR2(300),
    COIN NUMBER,
    REG_DATE DATE,
    UPD_DATE DATE,
    ENABLED VARCHAR2(1),
    CONSTRAINT PK_MEMBER PRIMARY KEY(USER_NO)
);

CREATE TABLE MEMBER_AUTH (
    USER_NO NUMBER,
    AUTH VARCHAR2(150),
    CONSTRAINT PK_MA PRIMARY KEY (USER_NO, AUTH),
    CONSTRAINT FK_MA FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

SELECT A.USER_NO, A.USER_ID, A.USER_PW, A.USER_NAME, A.COIN,
       A.REG_DATE, A.UPD_DATE, A.ENABLED
FROM MEMBER A, MEMBER_AUTH B
WHERE A.USER_NO = B.USER_NO
  AND A.USER_NO = '202308001';

-- 인증
SELECT USER_NO, USER_PW, ENABLED
FROM MEMBER
WHERE USER_NO = '202308001';

-- 권한
SELECT A.USER_NO, B.AUTH
FROM MEMBER A, MEMBER_AUTH B
WHERE A.USER_NO = B.USER_NO
  AND A.USER_NO = '202308001';

-------------------------------------------------------

CREATE TABLE PERSISTENT_LOGINS (
  USERNAME VARCHAR2(200),
  SERIES VARCHAR2(200),
  TOKEN VARCHAR2(200),
  LAST_USED DATE,
  CONSTRAINT PK_PL PRIMARY KEY (SERIES)
);

