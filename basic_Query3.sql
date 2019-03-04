-- EMPLOYEES ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = ����� ]
--[ job_id = ����ID ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = ���ID]
--[ department_id = �μ�ID]

-- *******
-- ����001. 
-- HR ��Ű�� ���̺��� ��� ���?
-- ******* 
-- �� : 

SELECT * FROM TAB;

-- *******
-- ����002. 
-- HR ��Ű�� ���̺� ���� �?
-- *******
-- �� : 

SELECT count(*) FROM TAB;

-- *******
-- ����003. 
-- ���, ��, �̸����?
-- *******
-- �� : 

SELECT employee_id, last_name, first_name FROM EMPLOYEES;

-- *******
-- ����004. 
-- �̸��� s�� ������ ������ �̸� ���?
-- *******
-- �� : 

SELECT first_name FROM EMPLOYEES WHERE first_name LIKE '%s';

-- *******
-- ����005. 
-- �̸��� s�� �����ϴ� ������ �̸� ���?
-- *******
-- �� :

 SELECT first_name FROM EMPLOYEES WHERE first_name LIKE 'S%';

-- *******
-- ����006. 
-- �޿��� ���� ������ �̸�,�μ��ڵ�,�޿� ��ȸ 
-- *******
-- �� : 

SELECT first_name, department_id, salary FROM EMPLOYEES order by salary asc;

-- *******
-- ����007.
-- �޿��� 12000 �̻��� ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- *******
-- �� :

SELECT employee_id, first_name, department_id, salary FROM EMPLOYEES WHERE salary>=12000;

-- *******
-- ����008.
-- �޿��� 1500�̻� 2500���ϸ� �޴� ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- ( AND ��� )
-- *******
-- �� : 

SELECT employee_id, first_name, department_id, salary FROM EMPLOYEES WHERE salary>=1500 and salary<=2500;

-- *******
-- ����009.
-- �޿��� 1500�̻� 2500���ϸ� �޴� 
-- ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ (BETWEEN ���) 
-- *******
-- �� : 

SELECT employee_id, first_name, department_id, salary FROM EMPLOYEES WHERE salary between 1500 and 2500;

-- *******
-- ����010.
-- 2005�⵵�� �Ի��� ������ �̸��� �μ��ڵ�, 
-- �Ի����ڸ� ��ȸ
-- *******
-- �� : 

SELECT first_name, department_id, hire_date FROM EMPLOYEES WHERE hire_date BETWEEN '2005/01/01' AND '2005/12/31';

create table Account(
account_num varchar2(10)
);

drop table Test;
commit;
select * from tab;

alter table Test
add test2 varchar2(10);

select * from test;

alter table Test
drop column test2;

select * from member;

ALTER TABLE member
ADD PRIMARY KEY (id);

create table account(
account_num varchar2(9) primary key,
created_date DATE default sysdate,
money number default 0,
id varchar2(10) not null,
constraint account_fk_member foreign key(id)
    references member(id)
);

create table member(
id varchar2(10) primary key,
name varchar2(10),
pass varchar2(10),
ssn varchar2(14)
);

create table admin(
admin_num varchar2(10) primary key,
name varchar2(10) not null,
pass varchar2(10) not null,
auth varchar2(10) default '���'
);

create sequence art_seq
start with 1000
increment by 1;

create table article(
art_seq number primary key,
title varchar2(20) default '�������',
content varchar2(50),
regdate DATE default sysdate,
id varchar2(10) not null,
constraint article_fk_member foreign key(id)
    REFERENCES member(id)

);
drop table member;





create table customers(
    customer_id varchar2(15) primary key,
    customer_name varchar2(15) not null,
    contact_name varchar2(15) not null,
    address varchar2(15) not null,
    city varchar2(15) not null,
    postal_code varchar2(15) not null,
    conutry varchar2(15) not null
);

create table employees(
    employee_id varchar2(15) primary key,
    last_name varchar2(15) not null,
    first_name varchar2(15) not null,
    birth_date varchar2(15) not null,
    photo varchar2(15) not null,
    notes varchar2(15) default '�޸�'
);

create table shippers(
    shipper_id varchar2(15) primary key,
    shipper_name varchar2(15) not null,
    phone varchar2(15) unique
);

create table suppliers(
    supplier_id varchar2(15) primary key,
    supplier_name varchar2(15) not null,
    contact_name varchar2(15) not null,
    address varchar2(15) not null,
    city varchar2(15) not null,
    postal_code varchar2(15) not null,
    country varchar2(15) not null,
    phone varchar2(15) unique
);

create sequence category_id
start with 1
increment by 1;

create table categories(
    category_id number primary key,
    category_name varchar2(15) not null,
    description varchar2(15) not null
);

create sequence product_id
start with 1
increment by 1;

create table products(
    product_id number primary key,
    product_name varchar2(15) not null,
    supplier_id varchar2(15) not null,
    category_id number not null,
    unit varchar2(15) not null,
    price number not null,
    constraint products_fk_suppliers foreign key(supplier_id)
    references suppliers(supplier_id),
    
    constraint products_fk_categories foreign key(category_id)
    references categories(category_id)
);

create sequence order_detail_id
start with 1
increment by 1;

create table order_details(
    order_detail_id number primary key,
    order_id varchar2(15),
    product_id number,
    constraint order_details_fk_products foreign key(product_id)
    references products(product_id),
    quantity number default 0
);

create sequence order_id
start with 1
increment by 1;

create table orders(
    order_id number primary key,
    customer_id varchar2(15),
    constraint orders_fk_customers foreign key(customer_id)
    references customers(customer_id),
    employee_id varchar2(15),
    constraint orders_fk_employees foreign key(employee_id)
    references employees(employee_id),
    order_date DATE default sysdate,
    shipper_id varchar2(15),
    constraint orders_fk_shippers foreign key(shipper_id)
    references shippers(shipper_id)
);

drop table order_details;
select * from tab;







drop table countries;
drop table employees;
drop table shippers;
drop table suppliers;
select * from tab;
drop sequence product_id;

select e.LAST_NAME �̸�, d.DEPARTMENT_NAME �μ�
from departments d
inner join employees e
on e.department_id like d.department_id;

;

select department_name "���� �μ�"
from departments
where department_id like
    (select department_id
    from employees
    where last_name like 'Fay');
    
