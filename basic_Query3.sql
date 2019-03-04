-- EMPLOYEES 테이블
--[ employee_id = 사번 ] [ first_name = 이름 ] 
--[ last_name = 성 ] [ email = 이메일 ] 
--[ phone_number = 전화번호 ] [ hire_date = 고용일 ]
--[ job_id = 업무ID ] [ salary = 급여]
--[ commission_pct = 커미션비율 ] [ manager_id = 상사ID]
--[ department_id = 부서ID]

-- *******
-- 문제001. 
-- HR 스키마 테이블을 모두 출력?
-- ******* 
-- 답 : 

SELECT * FROM TAB;

-- *******
-- 문제002. 
-- HR 스키마 테이블 수는 몇개?
-- *******
-- 답 : 

SELECT count(*) FROM TAB;

-- *******
-- 문제003. 
-- 사번, 성, 이름출력?
-- *******
-- 답 : 

SELECT employee_id, last_name, first_name FROM EMPLOYEES;

-- *******
-- 문제004. 
-- 이름이 s로 끝나는 직원의 이름 출력?
-- *******
-- 답 : 

SELECT first_name FROM EMPLOYEES WHERE first_name LIKE '%s';

-- *******
-- 문제005. 
-- 이름이 s로 시작하는 직원의 이름 출력?
-- *******
-- 답 :

 SELECT first_name FROM EMPLOYEES WHERE first_name LIKE 'S%';

-- *******
-- 문제006. 
-- 급여가 많은 순으로 이름,부서코드,급여 조회 
-- *******
-- 답 : 

SELECT first_name, department_id, salary FROM EMPLOYEES order by salary asc;

-- *******
-- 문제007.
-- 급여가 12000 이상인 사번,이름,부서코드, 급여 조회 
-- *******
-- 답 :

SELECT employee_id, first_name, department_id, salary FROM EMPLOYEES WHERE salary>=12000;

-- *******
-- 문제008.
-- 급여가 1500이상 2500이하를 받는 직원의 사번,이름,부서코드, 급여 조회 
-- ( AND 사용 )
-- *******
-- 답 : 

SELECT employee_id, first_name, department_id, salary FROM EMPLOYEES WHERE salary>=1500 and salary<=2500;

-- *******
-- 문제009.
-- 급여가 1500이상 2500이하를 받는 
-- 직원의 사번,이름,부서코드, 급여 조회 (BETWEEN 사용) 
-- *******
-- 답 : 

SELECT employee_id, first_name, department_id, salary FROM EMPLOYEES WHERE salary between 1500 and 2500;

-- *******
-- 문제010.
-- 2005년도에 입사한 직원의 이름과 부서코드, 
-- 입사일자를 조회
-- *******
-- 답 : 

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
auth varchar2(10) default '사원'
);

create sequence art_seq
start with 1000
increment by 1;

create table article(
art_seq number primary key,
title varchar2(20) default '제목없음',
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
    notes varchar2(15) default '메모'
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

select e.LAST_NAME 이름, d.DEPARTMENT_NAME 부서
from departments d
inner join employees e
on e.department_id like d.department_id;

;

select department_name "페이 부서"
from departments
where department_id like
    (select department_id
    from employees
    where last_name like 'Fay');
    
