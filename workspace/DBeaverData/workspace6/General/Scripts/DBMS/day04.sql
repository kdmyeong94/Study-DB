
SELECT  *
FROM 	EMPLOYEES e 
;


-- DDL
CREATE 	TABLE EMPLOYEES2(
	employees_id	number(10),
	name			varchar2(20),
	salary			number(7,2)
);


-- 기존 테이블과 동일하게 작성
CREATE TABLE EMPLOYEES3
AS
SELECT	* FROM EMPLOYEES e ;

SELECT  *
FROM 	EMPLOYEES3 e 
;


--SELECT  *
--FROM 	EMPLOYEES2 e 
--;


-- 컬럼 추가
ALTER TABLE EMPLOYEES2 ADD(
	manage_id	varchar2(10)
);

-- 컬럼 수정
ALTER TABLE	EMPLOYEES2 modify(
	manage_id	varchar2(20)
);

-- 컬럼을 삭제
ALTER TABLE	 EMPLOYEES2 DROP COLUMN manage_id;

SELECT *FROM EMPLOYEES2 e ;

-- 테이블 삭제
DROP TABLE EMPLOYEES2 ;

SELECT *FROM EMPLOYEES2 e ;

INSERT INTO EMPLOYEES2 VALUES (1,'테스트',30000);

-- 테이블에 있는 모든 데이터 삭제
TRUNCATE TABLE EMPLOYEES2 ;

SELECT *FROM EMPLOYEES3 e ;

TRUNCATE TABLE EMPLOYEES3 ;



CREATE TABLE sample(
	deptNo		number(20),
	deptName	varchar2(15),
	deptLoc		varchar2(15),
	deptManager	varchar2(10)
);


INSERT INTO sample values(10 , '기획실', '서울', '홍길동');
INSERT INTO sample values(20 , '전산실', '부산', '김말똥');
INSERT INTO sample (DEPTNO ,DEPTNAME ,DEPTLOC )values(30 , '영업실', '광주');












