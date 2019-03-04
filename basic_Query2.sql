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
    
-- Employees ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = �Ի��� ]
--[ job_id = �����ڵ� ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]
--[ department_id = �μ��ڵ�]

--  Jobs ���̺�
-- job_id �����ڵ�
-- job_title ����Ÿ��Ʋ
-- min_salary  �����޿�
-- max_salary �ְ�޿�


-- *******
-- ����011. 
-- Ŀ�̼��� ���� ���ϴ� ������ �̸�,�����ڵ�,�޿�,Ŀ�̼Ǻ����� ��ȸ
-- *******
SELECT first_name, job_id, salary, commission_pct FROM Employees WHERE commission_pct is null;

-- *******
-- ����012. 
-- ����� 110,120,130�� ����� ���, ��, �̸� ��ȸ
-- *******
SELECT employee_id, first_name, last_name FROM Employees WHERE employee_id in(110, 120, 130);

-- *******
-- ����013. 
-- �μ��ڵ�� ��������, �޿��� ������������ 
-- �μ��ڵ�, �޿�, ���, �̸�, �� ����
-- �������� 0,1,2 ... �������� 9,8,7...
-- ******
SELECT department_id, salary, employee_id, first_name, last_name FROM Employees ORDER BY department_id ASC, salary DESC;

-- *******
-- ����014. 
-- �̸��� am �̶� ���ڰ� ���Ե� ������ ���,�̸�, ��
-- *******
SELECT employee_id, first_name, last_name FROM Employees WHERE first_name LIKE '%am%';

-- *******
-- ����015. 
-- �̸��Ͽ� 'GG' �� 'KK'�δܾ� �� �ϳ��� ���ԵǾ ��ȸ
-- ��, ��ҹ��� ������
-- *******

-- *******
-- ����016. 
-- �̸����ּҰ� A �� �������� �ʴ� �̸��� ����
-- *******

-- *******
-- ����017.
-- ���� �ι�°,����° ���ڰ� ���ÿ� e �� ������ �̸�, ��
-- *******

-- *******
-- ����018
 -- �����ӱ��� 10000�� �̻��� ���� �� �� ������ ǥ���Ѵ�
-- *******
select job_id, job_title, min_salary, max_salary
from job
where min_salary >10000;

-- *******************
-- [����19]
-- 2002����� 2005����� 
-- ������ ������ �̸��� ���� ���ڸ� ǥ���Ѵ�.
-- ************
SELECT first_name, hire_date
from employees
where hire_date between '2002/01/01' and '2005/12/31'
order by hire_date asc;

-- *******************
-- [����020]
-- IT Programmer �Ǵ� Sales Man�� 
-- ������ �̸�, �Ի���, �����ڵ� ǥ��.
-- ******************* 

select first_name �̸�, hire_date �Ի���, job_id �����ڵ�
from employees
where job_id like 'IT_PROG' or job_id like 'SA_MAN';

select FNAME �̸�, HDATE �Ի���, JID �����ڵ�
FROM EMP
WHERE JID in ('IT_PROG', 'SA_MAN');

-- *******************
-- [����021]
-- JOB_TITLE �� "Programmer" �Ǵ� "Sales Manager"�� 
-- ������ �̸�, �Ի���, ������ ǥ��.
-- ������ �̸��� ������������ �����Ͻÿ�
-- *******************
SELECT E.FNAME �̸�, E.HDATE �Ի���, J.TITLE ������ 
FROM EMP E
    JOIN JOB J
ON E.JID LIKE J.JID
WHERE J.TITLE IN('Programmer','Sales Manager');

SELECT E.FNAME �̸�, E.HDATE �Ի���, J.TITLE ������
FROM JOB J
    INNER JOIN EMP E
    ON J.JID LIKE E.JID
WHERE J.TITLE IN('Programmer','Sales Manager')
ORDER BY E.FNAME;

-- *******************
-- [����022]
-- �μ��� �� �������̸� ǥ��
-- (��, �÷����� ������ [����] �̸� �� �ǵ��� ...)
-- DEPARTMENTS ���� MANAGER_ID �� ������ �ڵ�
-- *******************  
SELECT * FROM DEP;
SELECT * FROM EMP;
  
SELECT DNAME �μ���,
    FNAME "������ �̸�"
FROM DEP D
    INNER JOIN EMP E
    ON D.MID LIKE E.EID;
    
-- *******************
-- [����023]
-- ������(Marketing) �μ����� �ٹ��ϴ� ����� 
-- ���, ��å, �̸�, �ټӱⰣ
-- (��, �ټӱⰣ�� JOB_HISTORY ���� END_DATE-START_DATE�� ���� ��)
-- EMPLOYEE_ID ���, JOB_TITLE ��å��
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
    --��:20

SELECT EID ���, J.TITLE ��å, E.FNAME�̸�, H.EDATE - H.SDATE �ټ��ϼ�
FROM HIS H
    JOIN JOB J
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE 20;

SELECT E.EID ���, J.TITLE ��å, E.FNAME�̸�, H.EDATE - H.SDATE �ټ��ϼ�
FROM HIS H
    JOIN JOB J
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE (SELECT D.DID
    FROM DEP D
    WHERE D.DNAME LIKE 'Marketing');
            
    -- *******************
-- [����024]
--  ��å�� "Programmer"�� ����� ������ ���
-- DEPARTMENT_NAME �μ���, �̸�(FIRST_NAME + [����] + LAST_NAME)���� ���
-- �̸��� �ߺ��Ǿ ��µ�. �� �Ѹ��� �����μ����� ������ ������
-- *******************


SELECT D.DNAME �μ���, E.FNAME ||''|| E.LNAME �̸�
FROM DEP D
    JOIN EMP E
    ON D.MID LIKE E.MID
    JOIN JOB J
    ON J.
WHERE TITLE LIKE 'Programmer';



-- *******************
-- [����025]
-- �μ���, ������ �̸�, �μ���ġ ���� ǥ��
-- �μ��� ��������
-- ******************* 
SELECT D.DNAME �μ���, E.FNAME ||' '||E.LNAME "������ �̸�", L.CITY "�μ���ġ ����"
FROM DEP D
    JOIN EMP E
    ON D.MID LIKE E.EID
    JOIN LOC L
    ON D.LID LIKE L.LID
ORDER BY D.DNAME;

-- *******************
-- [����026]
--  �μ���, "�μ��� ��� �޿�" �� ����Ͻÿ�
-- *******************    
SELECT * FROM EMPLOYEES;

SELECT E.DNAME �μ���, E. "�μ��� ��� �޿�"
FROM EMP E
    



-- *******************
-- [����028]
-- ���� �������� 10% �λ�� �޾��� ���� ��������
-- å���Ǿ����ϴ�. ���� ������� ����޿���
-- ����ϼ���.
-- ��, ���� = �޿� * 12 �Դϴ�
-- *********************

