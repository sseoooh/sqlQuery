SELECT * FROM EMPLOYEES;

ALTER TABLE EMPLOYEES RENAME COLUMN FIRST_NAME TO NAME;
ALTER TABLE EMPLOYEES RENAME COLUMN LAST_NAME TO MANAGER;
ALTER TABLE EMPLOYEES ADD NOTES VARCHAR2(20);

SELECT * FROM USER_SEQUENCES;
CREATE SEQUENCE EMP_SEQ
    START WITH 1000
    ;
INSERT INTO EMPLOYEES(EMPLOYEE_ID, MANAGER, NAME,BIRTH_DATE, PHOTO, NOTES)
VALUES(EMP_SEQ.NEXTVAL, 'MANAGER','����','9601010','KIM.JPG','�Ŵ���');

SELECT * FROM EMPLOYEES;
SELECT COUNT(*) FROM EMPLOYEES;

