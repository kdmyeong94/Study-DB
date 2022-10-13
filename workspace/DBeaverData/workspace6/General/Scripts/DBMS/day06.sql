
SELECT *
FROM 	EMPLOYEES e ;


CREATE  TABLE daddy(
	idx		number(10),
	mid		number(10) PRIMARY KEY
);


SELECT  *
FROM	DADDY d ;


CREATE  TABLE daughter(
	idx		number(10) PRIMARY KEY,
	mid		number(10) ,
	CONSTRAINTS fk_da FOREIGN KEY(mid) 
 	REFERENCES daddy(mid) ON DELETE CASCADE
);

SELECT  * FROM  DAUGHTER d ;

INSERT  INTO DADDY VALUES (1,10);
INSERT  INTO DADDY VALUES (2,20);
INSERT  INTO DADDY VALUES (4,40);



SELECT  * FROM  DADDY d ;

INSERT  INTO DAUGHTER VALUES (100, 10);
INSERT  INTO DAUGHTER VALUES (101, 20);
INSERT  INTO DAUGHTER VALUES (200, 20);
INSERT  INTO DAUGHTER VALUES (201, 10);
INSERT  INTO DAUGHTER VALUES (300, 40);

DELETE FROM DAUGHTER d WHERE IDX = 100;
DELETE FROM DADDY d2 WHERE IDX = 1;



--view
SELECT * FROM EMP_DETAILS_VIEW edv ;


--view create
CREATE VIEW v_emp(emp_id, first_name, job_id , hiredate, dept_id)
AS
SELECT  EMPLOYEE_ID , FIRST_NAME ,JOB_ID ,HIRE_DATE ,DEPARTMENT_ID
fROM	EMPLOYEES e
WHERE  	JOB_ID = 'ST_CLERK'
;

SELECT *FROM v_emp;

--삭제
--DROP VIEW V_EMP ;


CREATE VIEW v_emp2(emp_id, comm_pct, first_name, job_id, hiredate, dept_id)
AS
SELECT  EMPLOYEE_ID , nvl(COMMISSION_PCT, 0), FIRST_NAME ,JOB_ID 
	, HIRE_DATE , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
;

SELECT 	* 
FROM 	v_emp2 ve
WHERE  	FIRST_NAME = 'John'
AND 	job_ID = 'ST_CLERK'
;

UPDATE V_EMP2 SET FIRST_NAME = 'kim'
WHERE 	FIRST_NAME  = 'John'
AND		JOB_ID = 'ST_CLERK'
;

SELECT  *
FROM 	EMPLOYEES e 
WHERE 	EMPLOYEE_ID = 139;
;

UPDATE  EMPLOYEES SET FIRST_NAME = 'John' WHERE EMPLOYEE_ID = 139;


-- read only
CREATE VIEW v_emp3(emp_id, comm_pct, first_name, job_id, hiredate, dept_id)
AS
SELECT  EMPLOYEE_ID , nvl(COMMISSION_PCT, 0), FIRST_NAME ,JOB_ID 
	, HIRE_DATE , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WITH READ ONLY
;

SELECT 	*	FROM V_EMP3 ve;

UPDATE V_EMP3 SET FIRST_NAME = 'kim'
WHERE 	FIRST_NAME  = 'John'
AND		JOB_ID = 'ST_CLERK'
;



/* 부서가 50번 부서인 사원들의
 * EMPLOYEE_ID, first_name, last_name( 문자열 연결 조회),
 * DEPARTMENT_ID, HIRE_DATE 정보를 조회하는 view
 */
CREATE VIEW v_emp4(emp_id, name ,dept_ID, HIRE_DATE )
as
SELECT  EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME 
		, DEPARTMENT_ID , HIRE_DATE 
FROM 	EMPLOYEES e 
WHERE  DEPARTMENT_ID = 50
WITH READ ONLY
;

SELECT * FROM V_EMP4 ve ;
/*
 *  전 사원의 사번, 이름(first_name, last_name 문자 연결),
 * 부서번호, 부서명, 입사일을 조회한 view 생성
 */
 CREATE VIEW v_emp5 (사번, 이름, 부서번호, 부서명, 입사일)
 as
 SELECT e.EMPLOYEE_ID 
 	,	e.FIRST_NAME || ' ' || e.LAST_NAME  
 	,	d.DEPARTMENT_ID 
 	,	d.DEPARTMENT_NAME 
 	,	e.HIRE_DATE 
 FROM 	EMPLOYEES e 
 	LEFT OUTER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
 	;
 
  SELECT * FROM V_EMP5 ve ;
 
 
 --시퀀스
 CREATE SEQUENCE seq_serial_no
 INCREMENT BY 1
 START WITH 100
 MAXVALUE 	110
 MINVALUE 	99
 CYCLE
 cache 2;


CREATE TABLE good(
	good_no		number(3),
	good_name 	varchar(10)
);

SELECT * FROM  good;

-- nextval : 다음 값
INSERT  INTO good VALUES (seq_serial_no.nextval, '제품5');

-- cuurval : 현재 값
INSERT  INTO good VALUES (seq_serial_no.currval, '제품5');

SELECT seq_serial_no.currval FROM dual;
--시퀀스 삭제
DROP SEQUENCE seq_serial_no;



----index
SELECT * FROM  EMPLOYEES3 e ;

CREATE TABLE EMPLOYEES3
AS
select * FROM EMPLOYEES e ;

INSERT INTO EMPLOYEES3 (employee_id, FIRST_name, LAST_NAME)
VALUES (100, 'Ismael', 'Kim');

SELECT  * FROM EMPLOYEES3 e  ORDER BY EMPLOYEE_ID ;


-- unique index 생성
CREATE UNIQUE INDEX idx_employee3_id
oN employees3(employee_id);

DELETE FROM EMPLOYEES3 e 
WHERE  FIRST_NAME = 'Ismael'
AND 	LAST_NAME = 'Kim'
;


-- index
CREATE INDEX idx_employee3_first
ON EMPLOYEES3(first_name)
;

INSERT INTO EMPLOYEES3 (employee_id, FIRST_name, LAST_NAME)
VALUES (500, 'Steven', 'King');

SELECT *FROM EMPLOYEES3 e 
WHERE FIRST_NAME ='Steven';