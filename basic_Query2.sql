DESC EMPLOYEES;
CREATE VIEW EMP AS 
SELECT EMPLOYEE_ID EID,
    FIRST_NAME FNAME,
    LAST_NAME LNAME,
    EMAIL,
    PHONE_NUMBER PHONE,
    HIRE_DATE HDATE,
    JOB_ID JID,
    SALARY SAL,
    COMMISSION_PCT COMM,
    MANAGER_ID MID,
    DEPARTMENT_ID DID 
FROM EMPLOYEES;

DROP VIEW EMP;




DESC JOBS;
CREATE VIEW JOB AS
SELECT
    JOB_ID JID,
    JOB_TITLE TITLE,
    MIN_SALARY MINSAL,
    MAX_SALARY MAXSAL
FROM JOBS;

DESC DEPARTMENTS;
CREATE VIEW DEP AS
SELECT 
    DEPARTMENT_ID DID,
    DEPARTMENT_NAME DNAME,
    MANAGER_ID MID,
    LOCATION_ID LID
FROM DEPARTMENTS;

DESC LOCATIONS;
CREATE VIEW LOC AS
SELECT
    LOCATION_ID LID,
    STREET_ADDRESS ADDR,
    POSTAL_CODE ZIP,
    CITY,
    STATE_PROVINCE PROV,
    COUNTRY_ID CID
FROM LOCATIONS;

DESC JOB_HISTORY;
CREATE VIEW HIS AS
SELECT
    EMPLOYEE_ID EID,
    START_DATE SDATE,
    END_DATE EDATE,
    JOB_ID JID,
    DEPARTMENT_ID DID
FROM JOB_HISTORY;
    
-- Employees 테이블
--[ employee_id = 사번 ] [ first_name = 이름 ] 
--[ last_name = 성 ] [ email = 이메일 ] 
--[ phone_number = 전화번호 ] [ hire_date = 입사일 ]
--[ job_id = 업무코드 ] [ salary = 급여]
--[ commission_pct = 커미션비율 ] [ manager_id = 상사아이디]
--[ department_id = 부서코드]

--  Jobs 테이블
-- job_id 업무코드
-- job_title 업무타이틀
-- min_salary  최저급여
-- max_salary 최고급여


-- *******
-- 문제011. 
-- 커미션을 받지 못하는 직원의 이름,업무코드,급여,커미션비율을 조회
-- *******
SELECT first_name, job_id, salary, commission_pct FROM Employees WHERE commission_pct is null;

-- *******
-- 문제012. 
-- 사번이 110,120,130인 사원의 사번, 성, 이름 조회
-- *******
SELECT employee_id, first_name, last_name FROM Employees WHERE employee_id in(110, 120, 130);

-- *******
-- 문제013. 
-- 부서코드는 오름차순, 급여는 내림차순으로 
-- 부서코드, 급여, 사번, 이름, 성 정렬
-- 오름차순 0,1,2 ... 내림차순 9,8,7...
-- ******
SELECT department_id, salary, employee_id, first_name, last_name FROM Employees ORDER BY department_id ASC, salary DESC;

-- *******
-- 문제014. 
-- 이름에 am 이란 글자가 포함된 직원의 사번,이름, 성
-- *******
SELECT employee_id, first_name, last_name FROM Employees WHERE first_name LIKE '%am%';

-- *******
-- 문제015. 
-- 이메일에 'GG' 와 'KK'두단어 중 하나만 포함되어도 조회
-- 단, 대소문자 구분함
-- *******

-- *******
-- 문제016. 
-- 이메일주소가 A 로 시작하지 않는 이메일 갯수
-- *******

-- *******
-- 문제017.
-- 성의 두번째,세번째 글자가 동시에 e 인 직원의 이름, 성
-- *******

-- *******
-- 문제018
 -- 최저임금이 10000불 이상인 업무 의 상세 내역을 표시한다
-- *******
select job_id, job_title, min_salary, max_salary
from job
where min_salary >10000;

-- *******************
-- [문제19]
-- 2002년부터 2005년까지 
-- 가입한 직원의 이름과 가입 일자를 표시한다.
-- ************
SELECT first_name, hire_date
from employees
where hire_date between '2002/01/01' and '2005/12/31'
order by hire_date asc;

-- *******************
-- [문제020]
-- IT Programmer 또는 Sales Man인 
-- 직원의 이름, 입사일, 업무코드 표시.
-- ******************* 

select first_name 이름, hire_date 입사일, job_id 업무코드
from employees
where job_id like 'IT_PROG' or job_id like 'SA_MAN';

select FNAME 이름, HDATE 입사일, JID 업무코드
FROM EMP
WHERE JID in ('IT_PROG', 'SA_MAN');

-- *******************
-- [문제021]
-- JOB_TITLE 가 "Programmer" 또는 "Sales Manager"인 
-- 직원의 이름, 입사일, 업무명 표시.
-- 직원의 이름을 오름차순으로 정렬하시오
-- *******************
SELECT E.FNAME 이름, E.HDATE 입사일, J.TITLE 업무명 
FROM EMP E
    JOIN JOB J
ON E.JID LIKE J.JID
WHERE J.TITLE IN('Programmer','Sales Manager');

SELECT E.FNAME 이름, E.HDATE 입사일, J.TITLE 업무명
FROM JOB J
    INNER JOIN EMP E
    ON J.JID LIKE E.JID
WHERE J.TITLE IN('Programmer','Sales Manager')
ORDER BY E.FNAME;

-- *******************
-- [문제022]
-- 부서명 및 관리자이름 표시
-- (단, 컬럼명은 관리자 [공백] 이름 이 되도록 ...)
-- DEPARTMENTS 에서 MANAGER_ID 가 관리자 코드
-- *******************  
SELECT * FROM DEP;
SELECT * FROM EMP;
  
SELECT DNAME 부서명,
    FNAME "관리자 이름"
FROM DEP D
    INNER JOIN EMP E
    ON D.MID LIKE E.EID;
    
-- *******************
-- [문제023]
-- 마케팅(Marketing) 부서에서 근무하는 사원의 
-- 사번, 직책, 이름, 근속기간
-- (단, 근속기간은 JOB_HISTORY 에서 END_DATE-START_DATE로 구할 것)
-- EMPLOYEE_ID 사번, JOB_TITLE 직책임
-- *******************
SELECT D.DID
FROM DEP D
WHERE D.DNAME LIKE 'Marketing';

select * from JOB_HISTORY;
select * from departments;
select * from employees;

SELECT D.DID
    FROM DEP D
    WHERE D.DNAME LIKE 'Marketing';
    --답:20

SELECT EID 사번, J.TITLE 직책, E.FNAME이름, H.EDATE - H.SDATE 근속일수
FROM HIS H
    JOIN JOB J
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE 20;

SELECT E.EID 사번, J.TITLE 직책, E.FNAME이름, H.EDATE - H.SDATE 근속일수
FROM HIS H
    JOIN JOB J
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE (SELECT D.DID
    FROM DEP D
    WHERE D.DNAME LIKE 'Marketing');
            
    -- *******************
-- [문제024]
--  직책이 "Programmer"인 사원의 정보를 출력
-- DEPARTMENT_NAME 부서명, 이름(FIRST_NAME + [공백] + LAST_NAME)까지 출력
-- 이름은 중복되어서 출력됨. 즉 한명이 여러부서에서 업무를 수행함
-- *******************


SELECT D.DNAME 부서명, E.FNAME ||''|| E.LNAME 이름
FROM DEP D
    JOIN EMP E
    ON D.MID LIKE E.MID
    JOIN JOB J
    ON J.
WHERE TITLE LIKE 'Programmer';



-- *******************
-- [문제025]
-- 부서명, 관리자 이름, 부서위치 도시 표시
-- 부서명 오름차순
-- ******************* 
SELECT D.DNAME 부서명, E.FNAME ||' '||E.LNAME "관리자 이름", L.CITY "부서위치 도시"
FROM DEP D
    JOIN EMP E
    ON D.MID LIKE E.EID
    JOIN LOC L
    ON D.LID LIKE L.LID
ORDER BY D.DNAME;

-- *******************
-- [문제026]
--  부서명, "부서별 평균 급여" 를 출력하시오
-- *******************    
SELECT * FROM EMPLOYEES;

SELECT E.DNAME 부서명, E. "부서별 평균 급여"
FROM EMP E
    



-- *******************
-- [문제028]
-- 올해 연봉에서 10% 인상된 급액이 내년 연봉으로
-- 책정되었습니다. 내년 전사원의 내년급여를
-- 출력하세요.
-- 단, 연봉 = 급여 * 12 입니다
-- *********************

