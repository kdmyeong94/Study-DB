-- 절대값 : abs()

SELECT 	ABS(-23)
FROM	dual
;

-- 반올림 : round()

SELECT 	ROUND(0.123), ROUND(0.543)
FROM	dual
;

-- 절사 : trunc()
SELECT TRUNC(1234.52345678)
FROM	dual
;

SELECT TRUNC(1234.52345678, 2)
FROM	dual
;


/* 1. 연봉이 12000 이상되는 직원들의
 * last_name, 연봉을 조회
 */
SELECT 	LAST_NAME ,
		SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY >= 12000
;
/*
 * 2. 사원번호가 176인 사람의
 *  last_name, 부서번호 조회
 */
SELECT 	LAST_NAME , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	EMPLOYEE_ID = 176
;
/* 
 * 3. 연봉이 5000이상, 12000이하의 범위 이외의 사람들의
 *  last_name, 연봉 조회
 */
SELECT 	LAST_NAME ,
		SALARY 
FROM 	EMPLOYEES e 
WHERE 	NOT SALARY BETWEEN 5000 AND 12000

;
/* 
 * 4. 20번 및 50번 부서에서 근무하는 모든 사원들의
 * last_name, 부서번호를 last_name의 알파벳순으로 조회
*/
SELECT  LAST_NAME ,
		DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 20
OR 		DEPARTMENT_ID = 50
ORDER BY LAST_NAME ASC 
;
/*
 * 5. 20번 및 50번 부서에 근무하며,
 * 연봉이 5000~12000 사이인 사원들의 last_name 및 연봉 조회
 */

SELECT 	LAST_NAME , DEPARTMENT_ID ,
		SALARY 
FROM 	EMPLOYEES e
WHERE 	DEPARTMENT_ID IN (20, 50)
AND 	SALARY BETWEEN 5000 AND 12000
;

/*
 * 6. last_name의 첫 글자가 A인 사원들의 last_name을 조회
*/
SELECT 	LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	LAST_NAME LIKE 'A%'
;
/*
 * 7. 매니저가 없는 사람들의 last_name 및 job_id를 조회
 */
SELECT 	LAST_NAME ,
		JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	MANAGER_ID IS NULL 
;
/* 
 * 8. 커미션을 버는 모든 사원들의 last_name, 연봉, 커미션을 조회
 * 단, 연봉 역순 정렬
 */
SELECT 	LAST_NAME ,
		SALARY ,
		COMMISSION_PCT 
FROM 	EMPLOYEES e 
WHERE 	COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC
;








-- concat 문자형 함수

SELECT  CONCAT('Hello', 'bye'), CONCAT('good','bad')
FROM	dual
;

SELECT  CONCAT('Hello', 'bye') concats, 'good' || 'bad'
FROM 	dual
;


-- 첫 글자를 대문자로
SELECT  INITCAP('good morning')
FROM 	dual
;


-- 대/ 소문자 처리
-- lower(char), upper(char)
SELECT LOWER('GOOD'), UPPER('good')
FROM	dual
;


-- lpad : lpad('값', '총문자길이', '채움문자')
-- rpad : rpad('값', '총문자길이', '채움문자')
SELECT 	LPAD('good', 6) ,
	 	LPAD('good', 7, '#'), 
	 	LPAD('good', 8, 'L') 
FROM	dual
;
	
SELECT 	RPAD('good', 6) ,
	 	RPAD('good', 7, '#'), 
	 	RPAD('good', 8, 'L') 
FROM	dual
;


-- substr('문자열', '시작위치', '길이')
SELECT  SUBSTR('good morning john', 1, 4)
FROM	dual
;

SELECT  SUBSTR('good morning john', 8, 4)
FROM	dual
;

SELECT  SUBSTR('good morning john', 8)
FROM	dual
;

SELECT  SUBSTR('good morning john', -4)
FROM	dual
;



-- replace()
SELECT 	REPLACE ('good morning tom', 'morning', 'evenning')
FROM	dual
;


-- sysdate
SELECT 	SYSDATE 
FROM	dual
;


-- add_months()
SELECT 	ADD_MONTHS(SYSDATE, 7)
FROM	dual
;


-- 현재 달의 마지막 날짜 - last_day
SELECT 	LAST_DAY(SYSDATE)
FROM	dual
;

SELECT	SYSDATE + (INTERVAL '1' YEAR ),
		SYSDATE + (INTERVAL '1' MONTH  ),
		SYSDATE + (INTERVAL '1' DAY  ),
		SYSDATE + (INTERVAL '1'	HOUR  ),
		SYSDATE + (INTERVAL '1' MINUTE  ),
		SYSDATE + (INTERVAL '1' SECOND  ),
	
FROM 	dual
;


-- to_char() : 문자열 변환
SELECT 	*
FROM 	EMPLOYEES e 
;

SELECT 	TO_CHAR(SYSDATE, 'yyyy-mm-dd'), SYSDATE
FROM	dual
;

SELECT 	TO_CHAR(SYSDATE, 'yyyymmdd'),
		TO_CHAR(SYSDATE, 'yyyy/mm/dd'),
		TO_CHAR(SYSDATE, 'yyyy-mm-dd'),
		TO_CHAR(SYSDATE, 'yyyy-mm-dd hh24:mi:ss')
FROM	DUAL
;



-- 날짜형으로 변환 : to_date()
SELECT TO_DATE('2015/03/04', 'yyyy/mm/dd')
FROM	dual
;



-- nvl() : null 값을 다른 데이터로 변경하는 함수
SELECT 	FIRST_NAME ,LAST_NAME ,
		NVL(COMMISSION_PCT,0) 
FROM 	EMPLOYEES e 
;

-- decode() : switch문의 역할을 하는 함수
SELECT 	*
FROM 	DEPARTMENTS d 
;


SELECT  DEPARTMENT_ID ,
		DECODE(DEPARTMENT_ID, 20 , 'MA', 60, 'IT', 90,'EX', 'ETC')
FROM 	EMPLOYEES e 
ORDER BY DEPARTMENT_ID 
;


--- case() : if ~ else if 문과 같은 역할을 하는 함수
SELECT 	FIRST_NAME , DEPARTMENT_ID ,
		CASE WHEN DEPARTMENT_ID  = 20 THEN 'MA'
			 WHEN DEPARTMENT_ID  = 60 THEN 'IT'
			 WHEN DEPARTMENT_ID  = 90 THEN 'EX'
			 ELSE ''
			 END department
FROM 	EMPLOYEES e 
ORDER BY DEPARTMENT_ID 
;



/* 1. EMPLOYEES 테이블에서 King의 정보를 소문자로 검색하고
 * 사원번호, 성명, 담당업무(job_id), 부서번호(department_id)를 출력하라
 * 단, 담당업무(job_id)는 소문자 출력
 */

SELECT 	EMPLOYEE_ID ,
		FIRST_NAME ,
		LAST_NAME ,
		LOWER(JOB_ID),
		DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	LOWER(LAST_NAME) = 'king'
;

/* 2. EMPLOYEES 테이블에서 King의 정보를 대문자로 검색하고
 * 사원번호, 성명, 담당업무(job_id), 부서번호(department_id)를 출력하라
 * 단, 담당업무(job_id)는 대문자 출력
 */
SELECT 	EMPLOYEE_ID ,
		FIRST_NAME ,
		LAST_NAME ,
		UPPER(JOB_ID)
		DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	UPPER(LAST_NAME) = 'KING'
;

/* 3.department 테이블에서 부서번호, 부서이름, 위치번호를
 * 합하여 출력하도록 하라.(||)
 */
 
SELECT 	DEPARTMENT_ID||DEPARTMENT_NAME||LOCATION_ID 
FROM 	DEPARTMENTS d 
;

/* 4. employees 테이블에서 30번 부서 중 사원번호, 이름, 담당 아이디를
 * 연결하여 출력하여라 (concat())
*/

SELECT 	CONCAT(CONCAT(EMPLOYEE_ID, LAST_NAME),MANAGER_ID) 
FROM 	EMPLOYEES e
WHERE 	DEPARTMENT_ID = 30
;


---------------------------------------------------------------------------
-- distinct, group by
-- DISTINCT : 중복을 제거한 컬럼이나 레코드를 조회하는 경우 사용한다.
SELECT 	DISTINCT DEPARTMENT_ID 
FROM 	EMPLOYEES e 
;

-- GROUP BY : 데이터를 그룹핑해서 그 결과를 가져오는 경우 사용한다.
-- 집계함수와 짝을 이루어 사용 할 수 있다.
SELECT 	DEPARTMENT_ID 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
;

-- 부서별 급여 합계
SELECT 	DISTINCT DEPARTMENT_ID ,
		SUM(SALARY) 
FROM 	EMPLOYEES e 
;

SELECT 	DEPARTMENT_ID ,
		SUM(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;


-- 부서별 사원수, 평균 급여, 급여의 합을 구해보기
SELECT 	DEPARTMENT_ID ,
		count(DEPARTMENT_ID),
		sum(SALARY),
		AVG(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;


SELECT  EMPLOYEE_ID 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;

SELECT  DEPARTMENT_ID, JOB_ID 
FROM 	EMPLOYEES e 
ORDER BY DEPARTMENT_ID , JOB_ID 
;

-- 부서별 직급별 사원수와 평균 급여를 구하기
SELECT 	DEPARTMENT_ID , JOB_ID, 
		SUM(SALARY), COUNT(EMPLOYEE_ID), AVG(SALARY)  
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID , JOB_ID 
ORDER BY DEPARTMENT_ID , JOB_ID 
;

/*
 * where 절에서는 집계함수를 사용 할 수 없다.
 * having 절 : 집계함수를 가지고 조건 비교를 할 때 사용한다.
 * 				having 절은 group by 절과 함께 사용이 된다.
 */
SELECT  DEPARTMENT_ID ,count(*)
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID  IS NOT NULL 
--AND     count(*) >= 10
GROUP BY DEPARTMENT_ID 
HAVING  count(*) >= 10
;


/*
 * 1. EMPLOYEES 테이블에서 job_id가 'SA'로 시작하는 사람에 대하여
 * 급여의 평균, 최고 급여, 최저 급여, 급여 합계를 출력
 */

SELECT 	AVG(SALARY),
		MAX(SALARY),
		MIN(SALARY),
		SUM(SALARY) 
FROM 	EMPLOYEES e 
WHERE 	JOB_ID LIKE 'SA%'
;
/*
 * 2. EMPLOYEES 테이블에 등록되어 있는 인원수,
 * 커미션이 null이 아닌 인원수, 연봉 평균, 현재 존재하는 부서의 수 출력
 */
SELECT 	COUNT(*),
		COUNT(COMMISSION_PCT),
		AVG(SALARY),
		COUNT(DISTINCT DEPARTMENT_ID)
FROM 	EMPLOYEES e 
;

/*
 * 3. EMPLOYEES 테이블에서 부서별로 인원수, 평균급여, 최저급여, 최고급여,
 * 급여의 합을 출력
 */
SELECT 	DEPARTMENT_ID,
		COUNT(*),
		AVG(SALARY),
		MIN(SALARY),
		MAX(SALARY),
		sum(SALARY)
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID
;

/*
 * 4. EMPLOYEES 테이블에서 각 부서별, 업무별(job_id) 그룹하여
 * 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합 출력
 */
SELECT 	JOB_ID ,
		DEPARTMENT_ID, 
		COUNT(*),
		AVG(SALARY),
		SUM(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY JOB_ID , DEPARTMENT_ID 
;

/*
 * 5. EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호,
 * 인원수, 급여의 합을 출력
 */
SELECT 	DEPARTMENT_ID , COUNT(*), SUM(SALARY)  
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) > 4 
;
/*
 * 6. EMPLOYEES 테이블에서 급여가 최대 10000이상인 부서에 대해서
 * 부서번호, 평균급여, 급여의 합을 출력
 */

SELECT 	DEPARTMENT_ID ,
		AVG(SALARY),
		SUM(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING SUM(SALARY) >= 10000 
;


/*
 * 7. EMPLOYEES 테이블에서 업무별(job_id) 급여의 평균이
 * 10000 이상인 업무에 대해서 업무명, 평균급여, 급여의 합 출력
 */
SELECT 	JOB_ID ,
		AVG(SALARY),
		SUM(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY JOB_ID 
HAVING AVG(SALARY) >= 10000 
;


/*
 * 8. EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는
 * 각 업무에 대해서 업무와, 급여의 합계를 출력
 * 단, 판매원(job_id가 'SA_...')은 제외하고, 월 급여의 합계로 내림차순 정렬
*/
SELECT 	JOB_ID ,
		SUM(SALARY) 
FROM 	EMPLOYEES e 
WHERE  	NOT JOB_ID LIKE 'SA%'
GROUP BY JOB_ID 
HAVING MIN(SALARY) > 10000 
ORDER BY SUM(SALARY) DESC
;

/*
 * 9. 각 job_id 별 최대 연봉, 최소 연봉, 연봉 총합 및 평균연봉을
 * job_id 내림차순으로 조회
 */
SELECT 	JOB_ID,
		MAX(SALARY) max,
		MIN(SALARY) min,
		SUM(SALARY) sum,
		AVG(SALARY) avg
FROM 	EMPLOYEES e 
GROUP BY JOB_ID 
ORDER BY JOB_ID DESC 
;
/*
 *  10. EMPLOYEES 테이블에서
 * salary + salary * commission_pct 이
 * 10000 이상이면 'good'
 * 5000 이상이면 'average'
 * 1이상 5000미만이면 'bad'
 * 0 이면 'no good' 으로 평가하고
 * EMPLOYEE_id, first_name, salary, commission_pct,
 * salary + salary * commission_pct 을 출력
 * 
 */
SELECT  CASE WHEN SALARY + SALARY * nvl(COMMISSION_PCT , 0) >= 10000 THEN 'good'
			 WHEN SALARY + SALARY * nvl(COMMISSION_PCT , 0) >= 5000 THEN 'averge'
			 WHEN SALARY + SALARY * nvl(COMMISSION_PCT , 0) >= 1 AND
			 	 SALARY  + SALARY *nvl(COMMISSION_PCT , 0) < 5000 THEN 'bad'
			 WHEN	SALARY  + SALARY * nvl(COMMISSION_PCT , 0) = 0 THEN 'no good' 
		END grade,
		EMPLOYEE_ID ,
		FIRST_NAME ,
		SALARY ,
		COMMISSION_PCT,
		SALARY + SALARY * nvl(COMMISSION_PCT , 0) sal
FROM 	EMPLOYEES e 
;







