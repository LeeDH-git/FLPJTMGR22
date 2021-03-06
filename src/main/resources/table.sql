-- 유저 생성 / 권한

-- 계정 생성
CREATE USER PRGMGTEST IDENTIFIED BY 12345;

-- 각종 테이블,인덱스,시퀀스 등등 권한 허용
GRANT CREATE SESSION TO PRGMGTEST;
GRANT CREATE DATABASE LINK TO PRGMGTEST;
GRANT CREATE MATERIALIZED VIEW TO PRGMGTEST;
GRANT CREATE PROCEDURE TO PRGMGTEST;
GRANT CREATE PUBLIC SYNONYM TO PRGMGTEST;
GRANT CREATE ROLE TO PRGMGTEST;
GRANT CREATE SEQUENCE TO PRGMGTEST;
GRANT CREATE SYNONYM TO PRGMGTEST;
GRANT CREATE TABLE TO PRGMGTEST;
GRANT DROP ANY TABLE TO PRGMGTEST;
GRANT CREATE TRIGGER TO PRGMGTEST;
GRANT CREATE TYPE TO PRGMGTEST;
GRANT CREATE VIEW TO PRGMGTEST;

GRANT CREATE ANY INDEX, ALTER ANY INDEX, DROP ANY INDEX TO PRGMGTEST;

----------------------------------------------------------------------------------

-- 공통 코드 테이블

CREATE TABLE FL_CODE
(
    PJT_COMM_C VARCHAR2(2)  NOT NULL
        CONSTRAINT PK_FL_CODE
            PRIMARY KEY,
    PJT_DESC_C VARCHAR2(50) NOT NULL,
    PJT_YN_C   VARCHAR2(1)  NOT NULL
);


CREATE TABLE FL_EMP_CODE
(
    PJT_LV_C  VARCHAR2(4) NOT NULL,
    PJT_POS_C VARCHAR2(4) NOT NULL,
    CONSTRAINT PK_FL_EMP_CODE
        PRIMARY KEY (PJT_LV_C, PJT_POS_C)
);


CREATE TABLE FL_PJT_CODE
(
    NO        NUMBER       NOT NULL,
    PJT_C     VARCHAR2(50) NOT NULL
        CONSTRAINT FL_PJT_CODE_PK
            PRIMARY KEY,
    PJT_DIV_C VARCHAR2(50),
    PJT_ST_C  VARCHAR2(50),
    PJT_ORG_C VARCHAR2(50)
);


CREATE UNIQUE INDEX FL_PJT_CODE_NO_UINDEX
    ON FL_PJT_CODE (NO);


CREATE UNIQUE INDEX FL_PJT_CODE_PJT_ST_C_UINDEX
    ON FL_PJT_CODE (PJT_ST_C);


/*----------------------------------------------------------------------------------*/

-- 직원 테이블

CREATE TABLE FL_EMP
(
    NO            NUMBER        NOT NULL,
    EMP_NO        NUMBER        NOT NULL,
    EMP_NM        VARCHAR2(30)  NOT NULL,
    EMP_PW        VARCHAR2(100) NOT NULL,
    EMP_EMAIL     VARCHAR2(100) NOT NULL,
    EMP_PHONE_NO  VARCHAR2(30)  NOT NULL,
    EMP_EMER_NO   VARCHAR2(30)  NOT NULL,
    EMP_JOIN_DATE VARCHAR2(10)  NOT NULL,
    PJT_LV_C      VARCHAR2(4)   NOT NULL,
    PJT_POS_C     VARCHAR2(4)   NOT NULL,
    CONSTRAINT FL_EMP_PK
        PRIMARY KEY (EMP_NO, EMP_EMAIL)
)
/

CREATE UNIQUE INDEX FL_EMP_NO_UINDEX
    ON FL_EMP (NO)
/

CREATE TABLE FL_EMP_ADMIN
(
    NO                NUMBER        NOT NULL,
    EMP_NO            NUMBER        NOT NULL
        CONSTRAINT PK_FL_EMP_ADMIN
            PRIMARY KEY,
    EMP_EMAIL         VARCHAR2(100) NOT NULL,
    LOGIN_DATE        VARCHAR2(20),
    JOIN_DATE         VARCHAR2(20)  NOT NULL,
    US_CHANGE_PW_DATE VARCHAR2(20),
    LOGIN_FAIL_COUNT  NUMBER,
    LIST_ACCESS_DATE  VARCHAR2(10),
    PJT_DUTY_C        VARCHAR2(3),
    PJT_JG_C          VARCHAR2(3),
    EMP_AUTH          VARCHAR2(5)   NOT NULL,

    CONSTRAINT FK_FL_EMP_ADMIN
        FOREIGN KEY (EMP_NO, EMP_EMAIL) REFERENCES FL_EMP
);


CREATE UNIQUE INDEX FL_EMP_ADMIN_NO_UINDEX
    ON FL_EMP_ADMIN (NO);

/*----------------------------------------------------------------------------------*/
-- 프로젝트 테이블

CREATE TABLE FL_PROJECT
(
    NO             NUMBER       NOT NULL,
    PJT_C          VARCHAR2(50) NOT NULL
        CONSTRAINT FL_PROJECT_PK
            PRIMARY KEY,
    PJT_CLIENT     VARCHAR2(50) NOT NULL,
    PJT_NM         VARCHAR2(50) NOT NULL,
    PJT_EMP_LIST   VARCHAR2(80) NOT NULL,
    PJT_PM         VARCHAR2(50) NOT NULL,
    PJT_START_DATE VARCHAR2(50) NOT NULL,
    PJT_END_DATE   VARCHAR2(50) NOT NULL,
    PJT_END_YN     VARCHAR2(50) NOT NULL,
    PJT_ST_C       VARCHAR2(10)
);

CREATE UNIQUE INDEX FL_PROJECT_NO_UINDEX
    ON FL_PROJECT (NO);


CREATE TABLE FL_PJT_EMP_ADMIN
(
    PJT_C         VARCHAR2(11)  NOT NULL
        CONSTRAINT PK_FL_PJT_EMP_ADMINT
            PRIMARY KEY,
    EMP_NO        NUMBER        NOT NULL,
    EMP_EMAIL     VARCHAR2(100) NOT NULL,
    PJT_EMP_DIV_C VARCHAR2(3)   NOT NULL,
    EMP_NM        VARCHAR2(10)  NOT NULL,
    PJT_CMT_START VARCHAR2(10)  NOT NULL,
    PJT_CMT_PD    VARCHAR2(8)   NOT NULL
);

-- 시퀀스 생성

-- 사번 시퀀스
CREATE SEQUENCE SEQ_EMP_EMPNO --시퀀스이름
    INCREMENT BY 001 -- 증감숫자 1
    START WITH 1 -- 시작숫자 1
    MINVALUE 001 -- 최소값 1
    MAXVALUE 10000 -- 최대값 10000
    NOCYCLE; -- 순환하지않음

-- NO 컬럼 시퀀스
CREATE SEQUENCE SEQ_EMP_NO --시퀀스이름
    INCREMENT BY 1 -- 증감숫자 1
    START WITH 1 -- 시작숫자 1
    MINVALUE 1 -- 최소값 1
    MAXVALUE 10000 -- 최대값 10000
    NOCYCLE; -- 순환하지않음

CREATE SEQUENCE SEQ_FLPJT_C_NO --시퀀스이름
    INCREMENT BY 1 -- 증감숫자 1
    START WITH 1 -- 시작숫자 1
    MINVALUE 1 -- 최소값 1
    MAXVALUE 10000 -- 최대값 10000
    NOCYCLE; -- 순환하지않음

-- 프로젝트 코드 컬럼 시퀀스
CREATE SEQUENCE SEQ_FLPJT_C --시퀀스이름
    INCREMENT BY 1 -- 증감숫자 1
    START WITH 100 -- 시작숫자 1
    MINVALUE 100 -- 최소값 1
    MAXVALUE 10000 -- 최대값 10000
    NOCYCLE; -- 순환하지않음

-- 프로시저

-- 로그인 프로시저
create PROCEDURE P_LOGIN_DATE(
    v_login_date IN varchar2,
    v_emp_email1 IN varchar2
)
    IS

    v_emp_email2 FL_EMP.EMP_EMAIL%TYPE;
    v_emp_pw     FL_EMP.EMP_PW%TYPE;

BEGIN

    SELECT EMP_EMAIL, EMP_PW
    INTO v_emp_email2,v_emp_pw
    FROM FL_EMP
    WHERE EMP_EMAIL = v_emp_email1;

    DBMS_OUTPUT.PUT_LINE('이메일 : ' || v_emp_email2);
    DBMS_OUTPUT.PUT_LINE('PW : ' || v_emp_pw);

    UPDATE FL_EMP_ADMIN
    SET LOGIN_DATE = v_login_date
    WHERE EMP_EMAIL = v_emp_email1;

    COMMIT;

END P_LOGIN_DATE;


-- 프로젝트 업데이트 프로시저
CREATE PROCEDURE P_UPDATE_PJT(
    v_pjtDivC IN varchar2,
    v_pjtOrgC IN varchar2,
    v_pjtStC IN varchar2,
    v_pjtEmpList IN varchar2,
    v_pjtPm IN varchar2,
    v_pjtStartDate IN varchar2,
    v_pjtEndDate IN varchar2,
    v_pjtEndYn IN varchar2
)
    IS

BEGIN

    MERGE INTO FL_PJT_CODE PJC
    USING FL_PROJECT PJT
    ON (PJC.PJT_C = PJT.PJT_C)
    WHEN MATCHED THEN
        UPDATE
        SET PJC.PJT_DIV_C = v_pjtDivC,
            PJC.PJT_ORG_C = v_pjtOrgC,
            PJC.PJT_ST_C  = v_pjtStC
        WHERE PJC.PJT_C = PJT.PJT_C;

    MERGE INTO FL_PROJECT PJT
    USING FL_PJT_CODE PJC
    ON (PJC.PJT_C = PJT.PJT_C)
    WHEN MATCHED THEN
        UPDATE
        SET PJT.PJT_EMP_LIST   = v_pjtEmpList,
            PJT.PJT_PM         = v_pjtPm,
            PJT.PJT_START_DATE = v_pjtStartDate,
            PJT.PJT_END_DATE   = v_pjtEndDate,
            PJT.PJT_END_YN     = v_pjtEndYn,
            PJT.PJT_ST_C       = v_pjtStC
        WHERE PJC.PJT_C = PJT.PJT_C;

    COMMIT;

END P_UPDATE_PJT;


