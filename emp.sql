CREATE TABLE DEPT
        (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
         DNAME VARCHAR2(14),
     LOC   VARCHAR2(13) ) ;
CREATE TABLE EMP
        (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
     ENAME VARCHAR2(10),
      JOB   VARCHAR2(9),
     MGR   NUMBER(4),
     HIREDATE DATE,
     SAL   NUMBER(7,2),
     COMM  NUMBER(7,2),
     DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
rem  insert DEPT 4 data
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
rem  insert EMP  14 data
INSERT INTO EMP  VALUES (7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'), 800,NULL,20);
INSERT INTO EMP  VALUES (7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300, 30);
INSERT INTO EMP  VALUES (7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500, 30);
INSERT INTO EMP  VALUES (7566,'JONES','MANAGER',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP  VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP  VALUES (7698,'BLAKE','MANAGER',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP  VALUES (7782,'CLARK','MANAGER',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP  VALUES (7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP  VALUES (7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP  VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,   30);
INSERT INTO EMP  VALUES (7876,'ADAMS','CLERK',    7788,to_date('13-07-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP  VALUES (7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'), 950,NULL,30);
INSERT INTO EMP  VALUES (7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP  VALUES (7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);
COMMIT;

SELECT * FROM EMP;
DESC EMP;
--SAL 월급
--MGR 매니저
--JOB 업무
--HIREDATE 입사일
--ENAME 사원명
--EMPNO 사원
--DEPTNO 부서코드
--COMM 커미션

SELECT * FROM DEPT;
DESC DEPT;
--LOC 회사위치
--DNAME 부서명
--DEPTNO 부서코드

--EMP_TEST_01
--CASE 표현
SELECT ENAME,
    CASE WHEN SAL > 2000
        THEN SAL
        ELSE 2000
    END REVISED_SALARY
FROM EMP;

--문법
-- CASE WHEN 조건식
--      THEN 참일 경우
--      ELSE 거짓일 경우
-- END 컬럼명으로 처리


-- EMP_TEST_01
-- CASE 표현
SELECT ENAME,
    CASE WHEN SAL > 2000
        THEN SAL
        ELSE 2000
    END REVISED_SALARY
FROM EMP;

--EMP_TEST_02
--부서정보에서 부서위치를 미국의 동부, 중부, 서부로 구분하라
-- 뉴욕 - EAST, 보스턴 - EAST, 시카고 - CENTER, 달라스 - CENTER
-- 컬렴명 - AREA
SELECT * FROM DEPT;
SELECT * FROM EMP;

SELECT DEPTNO, DNAME, LOC,
       CASE WHEN LOC LIKE 'NEW YORK'
            THEN '동부'
            WHEN LOC LIKE 'BOSTON'
            THEN '동부'
            ELSE '중부'
       END REVISDE_LOC
FROM DEPT;
-------------------------------------------------------------------------------
SELECT DEPTNO, DNAME, LOC,
       CASE WHEN LOC IN ('NEW YORK', 'BOSTON')
            THEN '동부'            
            ELSE '중부'
       END "AREA"
FROM DEPT;

--EMP_TEST_03
-- 급여가 3000이상이면 HIGH,
-- 1000이상이면 MID,
-- 미만이면 LOW
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO,
       CASE WHEN SAL >= 3000
            THEN 'HIGH'
            WHEN SAL >= 1000
            THEN 'MID'
            ELSE 'LOW'
        END "정도"
FROM EMP;
              
--EMP_TEST_04
-- 급여가 2000이상이면 보너스 1000,
-- 1000이상이면 500,
-- 1000미만이면 0으로 계산하시오
-- 컬렴명은 BONUS
SELECT ENAME, SAL,
        CASE WHEN SAL >= 2000
             THEN '1000'
             WHEN SAL >= 1000
             THEN '500'
             WHEN SAL < 1000
             THEN '0'
        END "BONUS"
FROM EMP;  

-- EMP_TEST_05
-- 매니저가 "BLAKE" 이면 NULL 표시, 같지 않으면 MGR 표시
SELECT ENAME,
        CASE WHEN ENAME LIKE 'BLAKE'
             THEN 'NULL'
            
        END RIVISED_ENAME
FROM EMP
;
            
--EMP_TEST_06
-- 개별 입사정보에서 월별 데이터를 추출하기
-- EXTRACT()
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT ENAME, DEPTNO, EXTRACT(MONTH FROM HIREDATE) 입사월, SAL
FROM EMP;

--EMP_TEST_07
-- 추출된 MONTH 데이터를 12개의 월별 칼럼으로 구분하기
SELECT ENAME, DEPTNO,      
       CASE MONTH WHEN 1 THEN SAL END "1월",
       CASE MONTH WHEN 2 THEN SAL END "2월",
       CASE MONTH WHEN 3 THEN SAL END "3월",
       CASE MONTH WHEN 4 THEN SAL END "4월",
       CASE MONTH WHEN 5 THEN SAL END "4월",
       CASE MONTH WHEN 6 THEN SAL END "4월",
       CASE MONTH WHEN 7 THEN SAL END "7월",
       CASE MONTH WHEN 8 THEN SAL END "8월",
       CASE MONTH WHEN 9 THEN SAL END "9월",
       CASE MONTH WHEN 10 THEN SAL END "10월",
       CASE MONTH WHEN 11 THEN SAL END "11월",
       CASE MONTH WHEN 12 THEN SAL END "12월"
FROM (SELECT
            ENAME,
            DEPTNO,
            EXTRACT(MONTH FROM HIREDATE) MONTH,
            SAL
FROM EMP);

-- 위 코드를 오라클의 DECODE 함수 사용한 예제
 -- 그러나 위의 ANSI 쿼리를 더 추천합니다.  
SELECT ENAME, 
    DEPTNO,
    DECODE(MONTH, 1, SAL) "1월",
    DECODE(MONTH, 2, SAL) "2월"
FROM (SELECT ENAME, DEPTNO, 
    EXTRACT(MONTH FROM HIREDATE) MONTH, SAL
    FROM EMP)    
;

--EMP_TEST_08
-- 추출된 MONTH 데이터를 12개의 월별 칼럼으로 구분하고
-- 부서별로 구분하기
SELECT (SELECT DNAME
        FROM DEPT D
        WHERE D.DEPTNO LIKE T.DEPTNO)DEPTNO,      
       AVG(CASE MONTH WHEN 1 THEN SAL END) "1월",
       AVG(CASE MONTH WHEN 2 THEN SAL END) "2월",
       AVG(CASE MONTH WHEN 3 THEN SAL END) "3월",
       AVG(CASE MONTH WHEN 4 THEN SAL END) "4월",
       AVG(CASE MONTH WHEN 5 THEN SAL END) "4월",
       AVG(CASE MONTH WHEN 6 THEN SAL END) "4월",
       AVG(CASE MONTH WHEN 7 THEN SAL END) "7월",
       AVG(CASE MONTH WHEN 8 THEN SAL END) "8월",
       AVG(CASE MONTH WHEN 9 THEN SAL END) "9월",
       AVG(CASE MONTH WHEN 10 THEN SAL END) "10월",
       AVG(CASE MONTH WHEN 11 THEN SAL END) "11월",
       AVG(CASE MONTH WHEN 12 THEN SAL END) "12월"
FROM (SELECT            
            E.DEPTNO,
            EXTRACT(MONTH FROM HIREDATE) MONTH,
            SAL
            FROM EMP E) T
GROUP BY T.DEPTNO;

--EMP_TEST_09
-- 계층형 쿼리
-- LEVEL : 루트 데이터이면 1, 그 하위 데이터이면 2이다
-- 리프(LEAF) 데이터까지 1씩 증가한다
-- CONNECT _BY_ISLEAF 전개 과정에서 해당 데이터가 리프데이터이면
-- 1, 그렇지 않으면 0이다
SELECT LEVEL,
        LPAD(' ', 4 * (LEVEL-1)) || EMPNO 사원,
        MGR 관리자,
        CONNECT_BY_ISLEAF ISLEAF
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO LIKE MGR;

--EMP_TEST_10
-- 재귀호출(셀프조인)
SELECT E1.EMPNO 사번, E1.MGR 관리자, E2.MGR "상위 관리자"
FROM EMP E1
    JOIN EMP E2
        ON E1.MGR LIKE E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;
-- 자신과 자신의 직속관리자는 동일한 행에서 구할 수 있으나
-- 차상위 관리자는 바로 구할 수 없다
-- 차상위 관리자를 구하기 위해서는 자신의 직속 관리자를
-- 기준으로 셀프조인을 수행해야 된다
-- 그러나, INNER JOIN을 사용함으로써 자신의 관리자가
-- 존재하지 않는 경우에는 E2테이블에서 조인할 대상이
-- 존재하지 않을 때문에 해당 데이터는 결과에서 누락된다
-- 이를 방지하기 위해서는 아우터 조인을 사용한다

SELECT E1.EMPNO 사번, E1.MGR 관리자, E2.MGR "상위 관리자"
FROM EMP E1
    LEFT JOIN EMP E2
        ON E1.MGR LIKE E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;

------------------------------------------------------------------------------
--EMP_TEST_11

-- ANSI에서 정의한 함수 세가지 - AGGREGATE FUNCTION,
                              -- GROUP FUNCTION,
                              -- WINDOW FUNCTION
-- AGGREGATE FUNCTION 집계함수 ex) sum(), count(), min()
------------------
-- GROUP FUNCTION 그룹 함수
-- 특정항목에 대한 소계를 하는 함수
-- ROLLUP : 소그룹간의 소계를 계산하는 함수
-- CUBE : 다차원적인 소계를 계산하는 함수
------------------
-- WINDOW FUNCTION 윈도우 함수 ex) RANK(), ROW_NUMBER()

--  GROUP FUNCTION 그룹함수
-- 일반적인 GROUP BY 함수

--ROLLUP안쓰고 그냥
SELECT DNAME 부서명,
       JOB 업무,
       COUNT(*) "전체 사원",
       SUM(SAL) "전체 급여"
FROM EMP E, DEPT D
WHERE E.DEPTNO LIKE D.DEPTNO
GROUP BY DNAME, JOB
;
--SALES	MANAGER	            1	2850
--SALES	CLERK	            1	950
--ACCOUNTING	MANAGER	    1	2450
--ACCOUNTING	PRESIDENT	1	5000
--ACCOUNTING	CLERK	    1	1300
--RESEARCH	MANAGER	        1	2975

--ROLLUP사용했을때
SELECT DNAME 부서명,
       JOB 업무,
       COUNT(*) "전체 사원",
       SUM(SAL) "전체 급여"
FROM EMP E, DEPT D
WHERE E.DEPTNO LIKE D.DEPTNO
GROUP BY ROLLUP(DNAME, JOB)
;
--SALES	   CLERK    1	950
--SALES	   MANAGER  1	2850
--SALES	   SALESMAN	4	5600
--SALES		        6	9400
--RESEARCH	CLERK	2	1900
--RESEARCH	ANALYST	2	6000
--RESEARCH	MANAGER	1	2975
--RESEARCH		    5	10875

---------------------------------------------------------------------------
--CUBE
SELECT CASE GROUPING(DNAME)
            WHEN 1 THEN 'ALL DEPT'
            ELSE DNAME
       END "부서명",
       CASE GROUPING(JOB)
            WHEN 1 THEN 'ALL JOBS'
            ELSE JOB
       END "업무",
        COUNT(*) "전체 사원",
        SUM(SAL) "전체 급여"       
FROM EMP E, DEPT D
WHERE E.DEPTNO LIKE D.DEPTNO
GROUP BY CUBE(DNAME, JOB)
;





