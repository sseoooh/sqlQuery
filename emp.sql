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
--SAL ����
--MGR �Ŵ���
--JOB ����
--HIREDATE �Ի���
--ENAME �����
--EMPNO ���
--DEPTNO �μ��ڵ�
--COMM Ŀ�̼�

SELECT * FROM DEPT;
DESC DEPT;
--LOC ȸ����ġ
--DNAME �μ���
--DEPTNO �μ��ڵ�

--EMP_TEST_01
--CASE ǥ��
SELECT ENAME,
    CASE WHEN SAL > 2000
        THEN SAL
        ELSE 2000
    END REVISED_SALARY
FROM EMP;

--����
-- CASE WHEN ���ǽ�
--      THEN ���� ���
--      ELSE ������ ���
-- END �÷������� ó��


-- EMP_TEST_01
-- CASE ǥ��
SELECT ENAME,
    CASE WHEN SAL > 2000
        THEN SAL
        ELSE 2000
    END REVISED_SALARY
FROM EMP;

--EMP_TEST_02
--�μ��������� �μ���ġ�� �̱��� ����, �ߺ�, ���η� �����϶�
-- ���� - EAST, ������ - EAST, ��ī�� - CENTER, �޶� - CENTER
-- �÷Ÿ� - AREA
SELECT * FROM DEPT;
SELECT * FROM EMP;

SELECT DEPTNO, DNAME, LOC,
       CASE WHEN LOC LIKE 'NEW YORK'
            THEN '����'
            WHEN LOC LIKE 'BOSTON'
            THEN '����'
            ELSE '�ߺ�'
       END REVISDE_LOC
FROM DEPT;
-------------------------------------------------------------------------------
SELECT DEPTNO, DNAME, LOC,
       CASE WHEN LOC IN ('NEW YORK', 'BOSTON')
            THEN '����'            
            ELSE '�ߺ�'
       END "AREA"
FROM DEPT;

--EMP_TEST_03
-- �޿��� 3000�̻��̸� HIGH,
-- 1000�̻��̸� MID,
-- �̸��̸� LOW
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO,
       CASE WHEN SAL >= 3000
            THEN 'HIGH'
            WHEN SAL >= 1000
            THEN 'MID'
            ELSE 'LOW'
        END "����"
FROM EMP;
              
--EMP_TEST_04
-- �޿��� 2000�̻��̸� ���ʽ� 1000,
-- 1000�̻��̸� 500,
-- 1000�̸��̸� 0���� ����Ͻÿ�
-- �÷Ÿ��� BONUS
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
-- �Ŵ����� "BLAKE" �̸� NULL ǥ��, ���� ������ MGR ǥ��
SELECT ENAME,
        CASE WHEN ENAME LIKE 'BLAKE'
             THEN 'NULL'
            
        END RIVISED_ENAME
FROM EMP
;
            
--EMP_TEST_06
-- ���� �Ի��������� ���� �����͸� �����ϱ�
-- EXTRACT()
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT ENAME, DEPTNO, EXTRACT(MONTH FROM HIREDATE) �Ի��, SAL
FROM EMP;

--EMP_TEST_07
-- ����� MONTH �����͸� 12���� ���� Į������ �����ϱ�
SELECT ENAME, DEPTNO,      
       CASE MONTH WHEN 1 THEN SAL END "1��",
       CASE MONTH WHEN 2 THEN SAL END "2��",
       CASE MONTH WHEN 3 THEN SAL END "3��",
       CASE MONTH WHEN 4 THEN SAL END "4��",
       CASE MONTH WHEN 5 THEN SAL END "4��",
       CASE MONTH WHEN 6 THEN SAL END "4��",
       CASE MONTH WHEN 7 THEN SAL END "7��",
       CASE MONTH WHEN 8 THEN SAL END "8��",
       CASE MONTH WHEN 9 THEN SAL END "9��",
       CASE MONTH WHEN 10 THEN SAL END "10��",
       CASE MONTH WHEN 11 THEN SAL END "11��",
       CASE MONTH WHEN 12 THEN SAL END "12��"
FROM (SELECT
            ENAME,
            DEPTNO,
            EXTRACT(MONTH FROM HIREDATE) MONTH,
            SAL
FROM EMP);

-- �� �ڵ带 ����Ŭ�� DECODE �Լ� ����� ����
 -- �׷��� ���� ANSI ������ �� ��õ�մϴ�.  
SELECT ENAME, 
    DEPTNO,
    DECODE(MONTH, 1, SAL) "1��",
    DECODE(MONTH, 2, SAL) "2��"
FROM (SELECT ENAME, DEPTNO, 
    EXTRACT(MONTH FROM HIREDATE) MONTH, SAL
    FROM EMP)    
;

--EMP_TEST_08
-- ����� MONTH �����͸� 12���� ���� Į������ �����ϰ�
-- �μ����� �����ϱ�
SELECT (SELECT DNAME
        FROM DEPT D
        WHERE D.DEPTNO LIKE T.DEPTNO)DEPTNO,      
       AVG(CASE MONTH WHEN 1 THEN SAL END) "1��",
       AVG(CASE MONTH WHEN 2 THEN SAL END) "2��",
       AVG(CASE MONTH WHEN 3 THEN SAL END) "3��",
       AVG(CASE MONTH WHEN 4 THEN SAL END) "4��",
       AVG(CASE MONTH WHEN 5 THEN SAL END) "4��",
       AVG(CASE MONTH WHEN 6 THEN SAL END) "4��",
       AVG(CASE MONTH WHEN 7 THEN SAL END) "7��",
       AVG(CASE MONTH WHEN 8 THEN SAL END) "8��",
       AVG(CASE MONTH WHEN 9 THEN SAL END) "9��",
       AVG(CASE MONTH WHEN 10 THEN SAL END) "10��",
       AVG(CASE MONTH WHEN 11 THEN SAL END) "11��",
       AVG(CASE MONTH WHEN 12 THEN SAL END) "12��"
FROM (SELECT            
            E.DEPTNO,
            EXTRACT(MONTH FROM HIREDATE) MONTH,
            SAL
            FROM EMP E) T
GROUP BY T.DEPTNO;

--EMP_TEST_09
-- ������ ����
-- LEVEL : ��Ʈ �������̸� 1, �� ���� �������̸� 2�̴�
-- ����(LEAF) �����ͱ��� 1�� �����Ѵ�
-- CONNECT _BY_ISLEAF ���� �������� �ش� �����Ͱ� �����������̸�
-- 1, �׷��� ������ 0�̴�
SELECT LEVEL,
        LPAD(' ', 4 * (LEVEL-1)) || EMPNO ���,
        MGR ������,
        CONNECT_BY_ISLEAF ISLEAF
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO LIKE MGR;

--EMP_TEST_10
-- ���ȣ��(��������)
SELECT E1.EMPNO ���, E1.MGR ������, E2.MGR "���� ������"
FROM EMP E1
    JOIN EMP E2
        ON E1.MGR LIKE E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;
-- �ڽŰ� �ڽ��� ���Ӱ����ڴ� ������ �࿡�� ���� �� ������
-- ������ �����ڴ� �ٷ� ���� �� ����
-- ������ �����ڸ� ���ϱ� ���ؼ��� �ڽ��� ���� �����ڸ�
-- �������� ���������� �����ؾ� �ȴ�
-- �׷���, INNER JOIN�� ��������ν� �ڽ��� �����ڰ�
-- �������� �ʴ� ��쿡�� E2���̺��� ������ �����
-- �������� ���� ������ �ش� �����ʹ� ������� �����ȴ�
-- �̸� �����ϱ� ���ؼ��� �ƿ��� ������ ����Ѵ�

SELECT E1.EMPNO ���, E1.MGR ������, E2.MGR "���� ������"
FROM EMP E1
    LEFT JOIN EMP E2
        ON E1.MGR LIKE E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;

------------------------------------------------------------------------------
--EMP_TEST_11

-- ANSI���� ������ �Լ� ������ - AGGREGATE FUNCTION,
                              -- GROUP FUNCTION,
                              -- WINDOW FUNCTION
-- AGGREGATE FUNCTION �����Լ� ex) sum(), count(), min()
------------------
-- GROUP FUNCTION �׷� �Լ�
-- Ư���׸� ���� �Ұ踦 �ϴ� �Լ�
-- ROLLUP : �ұ׷찣�� �Ұ踦 ����ϴ� �Լ�
-- CUBE : ���������� �Ұ踦 ����ϴ� �Լ�
------------------
-- WINDOW FUNCTION ������ �Լ� ex) RANK(), ROW_NUMBER()

--  GROUP FUNCTION �׷��Լ�
-- �Ϲ����� GROUP BY �Լ�

--ROLLUP�Ⱦ��� �׳�
SELECT DNAME �μ���,
       JOB ����,
       COUNT(*) "��ü ���",
       SUM(SAL) "��ü �޿�"
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

--ROLLUP���������
SELECT DNAME �μ���,
       JOB ����,
       COUNT(*) "��ü ���",
       SUM(SAL) "��ü �޿�"
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
       END "�μ���",
       CASE GROUPING(JOB)
            WHEN 1 THEN 'ALL JOBS'
            ELSE JOB
       END "����",
        COUNT(*) "��ü ���",
        SUM(SAL) "��ü �޿�"       
FROM EMP E, DEPT D
WHERE E.DEPTNO LIKE D.DEPTNO
GROUP BY CUBE(DNAME, JOB)
;





