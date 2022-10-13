
--1. hr 계정의 EMPLOYEES 테이블과  동일한 컬럼과 데이터를 갖는 (테이블 복사)EMPLOYEES_NEW 테이블을 생성하는 SQL문을 작성하시오.( 구현된 인터페이스 명세서를 참조하여 구현 검증에 필요한 감시 및 도구를 준비할 수 있다.)(5)
CREATE TABLE EMPLOYEES_NEW
AS
SELECT	* FROM EMPLOYEES e ;

SELECT *
FROM EMPLOYEES_NEW en 
;

--2. hr 계정의 DEPARTMENTS 테이블과  동일한 컬럼과 데이터를 갖는(테이블 복사) DEPARTMENTS_NEW 테이블을 생성하는 SQL문을 작성하시오.( 인터페이스 구현 검증을 위하여 외부 시스템과의 연계 모듈 상태를 확인할 수 있다.)(5)

CREATE TABLE DEPARTMENTS_NEW
AS
SELECT	* FROM DEPARTMENTS d ;

SELECT *
FROM DEPARTMENTS_NEW dn
;

--3. EMPLOYEES_NEW 테이블에 가변길이 문자형 데이터타입인 USER_NAME 컬럼(문자 길이는 자유)을 추가하시오.( 개발하고자 하는 응용소프트웨어와 연계 대상 모듈 간의 세부 설계서를 확인하여 일관되고 정형화된 인터페이스 기능 구현을 정의할 수 있다..)(5)

ALTER TABLE EMPLOYEES_NEW ADD(
	USER_NAME varchar2(20)
);

--4. EMPLOYEES_NEW 테이블 EMPLOYEE_ID 컬럼에 Primary Key 제약조건(제약조건이름 자유)을 추가한다.( 개발하고자 하는 응용소프트웨어와 연계 대상 내외부 모듈 간의 연계 목적을 고려하여 인터페이스 기능 구현 실패 시 예외처리 방안을 정의할 수 있다.)(5)

ALTER TABLE EMPLOYEES_NEW 
ADD CONSTRAINTS empid_pk PRIMARY KEY(EMPLOYEE_ID);

--5. DEPARTMENTS_NEW 테이블 DEPARTMENT_ID 컬럼에 Primary Key 제약조건(제약조건이름 자유)을 추가한다.(개발하고자 하는 응용소프트웨어와 관련된 외부 및 내부 모듈 간의 연계가 필요한 인터페이스의 기능을 식별할 수 있다.)(5)

ALTER TABLE DEPARTMENTS_NEW 
ADD CONSTRAINTS dpid_pk PRIMARY KEY(DEPARTMENT_ID);

--6. EMPLOYEES_NEW 테이블의 DEPARTMENT_ID 컬럼과 DEPARTMENTS_NEW 테이블 DEPARTMENT_ID 컬럼을 EMPLOYEES_NEW 테이블이 자식 테이블, DEPARTMENTS_NEW 테이블 이 부모 테이블로 Foreign Key 제약 조건(제약조건이름 자유)을 추가한다.( 구현된 인터페이스 명세서를 참조하여 구현 검증에 필요한 감시 및 도구를 준비할 수 있다.)(5)

ALTER TABLE EMPLOYEES_NEW 
ADD CONSTRAINTS fk_em FOREIGN KEY(DEPARTMENT_ID)
REFERENCES DEPARTMENTS_NEW(DEPARTMENT_ID);
	
--7. EMPLOYEES_NEW 테이블과 DEPARTMENTS_NEW 테이블을 사용하여 DEPARTMENT_ID = 60인 사원의 EMPLOYEE_ID , FIRST_NAME , DEPARTMENT_ID, DEPARTMENT_NAME을 오름차순으로 조회 하시오.(구현된 인터페이스 명세서를 참조하여 구현 검증에 필요한 감시 및 도구를 준비할 수 있다.)(5)

SELECT en.EMPLOYEE_ID
	,  en.FIRST_NAME 
	,	en.DEPARTMENT_ID 
	,	dn.DEPARTMENT_NAME 
FROM  EMPLOYEES_NEW en INNER JOIN DEPARTMENTS_NEW dn
	ON en.DEPARTMENT_ID = dn.DEPARTMENT_ID 
WHERE en.DEPARTMENT_ID = 60
ORDER BY en.DEPARTMENT_ID ASC
;

--8. EMPLOYEES_NEW 테이블에서 DEPARTMENT_ID가 100인 사원들의 급여(SALARY) 평균을 구하여라. (인터페이스 구현 검증을 위하여 외부 시스템과의 연계 모듈 상태를 확인할 수 있다.)(5) 

SELECT AVG(SALARY) 
FROM EMPLOYEES_NEW en 
WHERE DEPARTMENT_ID = 100
;

--9. EMPLOYEES_NEW 테이블을 삭제 하시요. (인터페이스 구현 검증을 위하여 외부 시스템과의 연계 모듈 상태를 확인할 수 있다.)(5)

DROP TABLE EMPLOYEES_NEW ;

SELECT *
FROM EMPLOYEES_NEW en
;

--10. DEPARTMENTS_NEW 테이블을 삭제 하시요. (인터페이스 오류처리 사항을 확인하고 보고서를 작성할 수 있다.)(5)

DROP TABLE DEPARTMENTS_NEW ;

SELECT *
FROM DEPARTMENTS_NEW dn
;
--11. EMPLOYEES 테이블과 DEPARTMENTS 테이블을 사용하여 ‘Sales’ 부서이름에 속한 직원의 이름(FIRST_NAME), 급여(SALARY), 부서이름(DEPARTMENT_NAME)을 조회하시오. 단, 급여는 100번 부서의 평균보다 적게 받는 직원 정보만 출력되어야 한다.(총 16건)( 인터페이스 오류처리 사항을 확인하고 보고서를 작성할 수 있다.)(5)

SELECT e.FIRST_NAME 
,		e.SALARY 
,		d.DEPARTMENT_NAME 
FROM EMPLOYEES e INNER JOIN DEPARTMENTS d 
 ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
 WHERE d.DEPARTMENT_NAME = 'Sales'
AND e.SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES e2 WHERE DEPARTMENT_ID =100)
;
--12. EMPLOYEES 테이블과 DEPARTMENTS테이블을 사용하여, 커미션(COMMISSION_PCT)을 받는 사원의 이름(FIRST_NAME), 직업(JOB_ID), 부서번호(DEPARTMENT_ID),부서명(DEPARTMENT_NAME)을 출력하라.(총 35건) (개발하고자 하는 응용소프트웨어와 연계 대상 모듈 간의 세부 설계서를 확인하여 공통적인 인터페이스를 구현할 수 있다.)(5)
SELECT COMMISSION_PCT  
FROM EMPLOYEES e 
;

SELECT e.FIRST_NAME 
,	e.JOB_ID 
,	e.DEPARTMENT_ID 
,	d.DEPARTMENT_NAME 
FROM EMPLOYEES e LEFT outer JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE COMMISSION_PCT IS NOT NULL
;

--13. EMPLOYEES 테이블에서 사원번호가(EMPLOYEE_ID) 123인 사원의 직업(JOB_ID)과 같고 , 사원번호(EMPLOYEE_ID)가 192인 사원의 급여(SALARY)보다 많은 사원의 사원번호(EMPLOYEE_ID),이름(FIRST_NAME),직업(JOB_ID),급여(SALARY)를 출력하라.(총 5건) (개발하고자 하는 응용소프트웨어와 연계 대상 모듈 간의 세부 설계서를 확인하여 공통적인 인터페이스를 구현할 수 있다.)(5)

SELECT EMPLOYEE_ID 
,		FIRST_NAME 
,		JOB_ID 
,		SALARY 
FROM EMPLOYEES e 
WHERE JOB_ID = ( SELECT JOB_ID FROM EMPLOYEES e2 WHERE EMPLOYEE_ID = 123)
AND SALARY > (SELECT SALARY FROM EMPLOYEES e3 WHERE EMPLOYEE_ID = 192)
;
/*
14. 학생 관리를 위한 다음 조건을 만족시키는 STUDENT 테이블을 생성하여라.

(조건(컬럼명 자유) :

아이디(숫자-정수3자리,Primary Key), 

이름(문자-가변 문자 10자리,Not Null), 

전화번호(숫자-정수11자리,Not Null), 

주소(문자-가변 문자 100자리), 

과목수(숫자-정수1자리)
*/
CREATE TABLE STUDENT (
 student_id NUMBER(3) PRIMARY KEY,
 student_name varchar2(10) NOT NULL,
 phone_num number(11) NOT NULL,
 address varchar2(100) ,
 subject number(1)
);

--(응용소프트웨어와 관련된 내외부 모듈 간의 연계 데이터의 중요성을 고려하여 인터페이스 보안 기능을 적용할 수 있다.)(20)

--15. STUDENT 테이블의 이름 컬럼에 UNIQUE INDEX를 설정 하세요.( 응용소프트웨어와 관련된 내외부 모듈 간의 연계 데이터의 중요성을 고려하여 인터페이스 보안 기능을 적용할 수 있다.)(5)

CREATE UNIQUE INDEX st_name
ON Student(student_name)
;

--16. STUDENT 테이블에 임의의 데이터 5건을 입력하여라.(개발하고자 하는 응용소프트웨어와 관련된 외부 및 내부 모듈 간의 연계가 필요한 인터페이스의 기능을 식별할 수 있다.)(5)

CREATE SEQUENCE st_no
INCREMENT BY 1
START WITH 1
MAXVALUE 5
;




INSERT INTO STUDENT(student_id, student_name, phone_num, address, subject) VALUES (st_no.nextval, '사람'||st_no.nextval, 1234567||st_no.nextval, '주소'||st_no.nextval, 1 );

--17. STUDENT 테이블의 이름 컬럼에 UNIQUE INDEX를 삭제 하세요.(개발하고자 하는 응용소프트웨어와 관련된 외부 및 내부 모듈 간의 연계가 필요한 인터페이스의 기능을 식별할 수 있다.)(5)


DROP INDEX st_name;


















