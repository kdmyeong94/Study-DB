SELECT  *
FROM 	SAMPLE s 
;


-- sample 테이블에서 deptNO = 50 업데이트
-- 조건 deptNO = 30

UPDATE SAMPLE 
SET DEPTNO = 50
WHERE DEPTNO = 30
;

-- 영업부서의 영업지(deptloc)를 인천으로 수정
UPDATE SAMPLE 
SET	DEPTLOC ='인천'
WHERE DEPTNAME = '영업실'
;

-- 영업부 삭제

DELETE SAMPLE
WHERE DEPTNAME = '영업실'
;


SELECT *FROM SAMPLE s ;
DELETE sample WHERE deptno = 20;

COMMIT;

ROLLBACK;



-- not null
CREATE TABLE null_test(
	col1 	varchar2(20) NOT NULL,
	col2 	varchar2(20) NULL,
	col3    varchar2(20)
)
;

INSERT INTO NULL_TEST (col1,COL2)
VALUES ('aa','bb')
;

INSERT INTO NULL_TEST (col1,COL3)
VALUES ('aa','bb')
;

INSERT INTO NULL_TEST (col1,COL3)
VALUES ('cc','dd')
;
SELECT *FROM NULL_TEST nt ;


-- unique
CREATE TABLE UNIQUE_test(
	col1 	varchar2(20) UNIQUE NOT NULL,
	col2 	varchar2(20) UNIQUE,
	col3    varchar2(20) NOT null,
	col4 	varchar2(20) NOT NULL,
	CONSTRAINTS temp_unique UNIQUE(col3, col4)
)
;

INSERT INTO UNIQUE_TEST (col1,COL2,COL3,COL4)
VALUES ('aa','bb','cc','dd')
;

INSERT INTO UNIQUE_TEST (col1,COL2,COL3,COL4)
VALUES ('a2','b2','c2','d2')
;

SELECT *FROM UNIQUE_TEST ut ;

UPDATE UNIQUE_TEST 
SET		COL1 ='aa'
WHERE 	COL2  = 'b2'
;


INSERT  INTO UNIQUE_TEST 
VALUES ('a3', NULL, 'c3', 'c4');
INSERT  INTO UNIQUE_TEST 
VALUES ('a4', NULL, 'c4', 'c3');


CREATE TABLE UNIQUE_TEST2 (
	col1		varchar2(20),
	col2		varchar2(20),
	CONSTRAINTS temp_unique2 unique(col1,col2)
);

SELECT *FROM UNIQUE_TEST2 ut ;

INSERT INTO UNIQUE_TEST2 
VALUES ('aa', 'aa');
INSERT INTO UNIQUE_TEST2 
VALUES ('aa', 'bb');
INSERT INTO UNIQUE_TEST2 
VALUES ('aa', 'cc');



-- check

CREATE TABLE check_test(
	gender varchar2(10) NOT NULL ,
	CONSTRAINTS check_gender check(gender IN('M', 'F'))
);

SELECT *FROM CHECK_TEST ct ;

INSERT  INTO CHECK_TEST VALUES ('F');



-- 기본키 (Primary key)
CREATE TABLE PRIMARY_test(
	student_id		number(10) PRIMARY KEY,
	name			varchar2(20)
);

SELECT * FROM PRIMARY_TEST ;

CREATE TABLE primary_test2(
	student_id		number(10),
	name			varchar2(20),
	CONSTRAINTS student_pk PRIMARY KEY (student_id)
);

CREATE TABLE PRIMARY_TEST3(
	student_id		number(10),
	name			varchar2(20)
);

ALTER TABLE PRIMARY_TEST3 
ADD CONSTRAINTS student_pk2 PRIMARY KEY(student_id);











