SELECT * FROM TAB;
SELECT * FROM EMPLOYEES;
SELECT * FROM CUSTOMERS;

DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAILS CASCADE CONSTRAINTS;
DROP TABLE PRODUCTS CASCADE CONSTRAINTS;
DROP TABLE SHIPPERS CASCADE CONSTRAINTS;
DROP TABLE SUPPLIERS CASCADE CONSTRAINTS;
DROP TABLE CATEGORIES CASCADE CONSTRAINTS;

DROP SEQUENCE order_id;
DROP SEQUENCE category_id;
DROP SEQUENCE product_id;
DROP SEQUENCE order_detail_id;
DROP SEQUENCE employee_id;

SELECT * FROM TAB;

SELECT * FROM EMPLOYEES;
insert into EMPLOYEES(name, manager, birthday, photo, notes)
VALUES('����','1000','890201-2','���.jpg','�Ŵ���');
DROP TABLE EMPLOYEES;



DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAILS CASCADE CONSTRAINTS;
DROP TABLE PRODUCTS CASCADE CONSTRAINTS;
DROP TABLE SHIPPERS CASCADE CONSTRAINTS;
DROP TABLE SUPPLIERS CASCADE CONSTRAINTS;
DROP TABLE CATEGORIES CASCADE CONSTRAINTS;

DROP SEQUENCE order_id;
DROP SEQUENCE category_id;
DROP SEQUENCE product_id;
DROP SEQUENCE order_detail_id;
commit;