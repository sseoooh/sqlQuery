
CREATE TABLE Customers(
customer_id VARCHAR2(15) PRIMARY KEY,
customer_name VARCHAR2(15) NOT NULL,
password VARCHAR2(15) NOT NULL,
ssn VARCHAR2(15) NOT NULL,
photo VARCHAR2(15) default 'default-photo',
phone VARCHAR2(15) NOT NULL,
city VARCHAR2(70) NOT NULL,
address VARCHAR2(70) NOT NULL,
postalcode VARCHAR2(15) NOT NULL
);

insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('ronaldo','ȣ����','1234','850205-1','default','010-1234-5678','����Ư���� ������ ������ 507','����������3������ 101�� 101ȣ','06132');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('messi','�޽�','1234','870624-1','default','010-2345-6789','����Ư���� ������ ������18�� 12','�����������Ʈ 202�� 202ȣ','06325');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('modric','��帮ġ','1234','850909-1','default','010-3456-7890','����Ư���� ������ ������� 740',' �� ������û�� 303�� 303ȣ','06075');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('ramos','���','1234','860330-1','default','010-4567-8901','����Ư���� ������ �е���64�� 7','�Ѽ־���Ʈ 404�� 404ȣ','06089');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('bruyne','�������','1234','910628-1','default','010-5678-9012','����Ư���� ������ ������90�� 56','�����̺����� 505�� 505ȣ','06194');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('degea','�����','1234','901107-1','default','010-6789-0123','����Ư���� ������ ������157�� 40','�ݵ���� 606�� 606ȣ','06033');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('marcelo','��������','1234','880512-1','default','010-7890-1234','����Ư���� ������ �е���11�� 29','�������Ͽ콺2 707�� 707ȣ','06043');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('neymar','���̸���','1234','920205-1','default','010-8901-2345','����Ư���� ������ �б�����29�� 72-1','�Ż�� 808�� 808ȣ','06004');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('kante','Ĳ��','1234','910329-1','default','010-9012-3456','����Ư���� ������ �ڰ�� 36','����ȿ���ظ�����Ʈ 909�� 909ȣ','06376');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('mbappe','������','1234','981220-1','default','010-0123-4567','����Ư���� ������ �����21�� 25','���̾����� 1000�� 1000ȣ','06370');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('varane','�ٶ�','1234','930425-1','default','010-1234-5670','����Ư���� ������ �����24�� 44-9','�������� 1001�� 1001ȣ','06370');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('vandijk','�ݵ���ũ','1234','910708-1','default','010-1234-5671','����Ư���� ������ ������110�� 50','���̾� ��ü���� 1002�� 1002ȣ','06344');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('rooney','���','1234','851024-1','default','010-1234-5672','����Ư���� ������ �����56�� 11','����6��������Ʈ 1003�� 1003ȣ','06368');
insert into CUSTOMERS(customer_id, customer_name, password, ssn, photo, phone, city, address, postalcode)
VALUES('aguero','�Ʊ�����','1234','880602-1','default','010-1234-5672','����Ư���� ������ ���ַ�30�� 57','Ÿ���Ӹ��� 1004�� 1004ȣ','06293');
INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME, PASSWORD, SSN, PHONE, PHOTO, CITY, ADDRESS, POSTALCODE)
VALUES('jang','�念��','1111','940506-1', '010-8765-4321',default,'����� �߱� �߸��� 244','�Ｚ����Ʈ��','100-859');
INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME, PASSWORD, SSN, PHONE, PHOTO, CITY, ADDRESS, POSTALCODE)
VALUES('woo','������','2222','960905-1',  '010-5689-4789',default,'����� ���ʱ� ��赿 424-28','���Ե�ĳ��','06676');
INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME, PASSWORD, SSN, PHONE, PHOTO, CITY, ADDRESS, POSTALCODE)
VALUES('jk55','����ȣ','3333','980203-1', '010-5986-7898',default,'����Ư���� ������ ȭ� 1165','������������Ʈ','07694');
INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME, PASSWORD, SSN, PHONE, PHOTO, CITY, ADDRESS, POSTALCODE)
VALUES('roll90','������','2222','950909-1','010-5989-5688',default,'����Ư���� ������ ���굿 450','����ÿ�������Ʈ','03936');
INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME, PASSWORD, SSN, PHONE, PHOTO, CITY, ADDRESS, POSTALCODE)
VALUES('hahalo','��â��','1111','960405-1','010-6545-5566',default,'����Ư���� ������ ����� 10','���뺥�ĺ�','04100');
INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME, PASSWORD, SSN, PHONE, PHOTO, CITY, ADDRESS, POSTALCODE)
VALUES('changjunzzang','��â��','2323','920606-1','010-6334-5566',default,'����Ư���� ������ ����� 205','��Ʈ���콺����Ʈ','04194');
INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME, PASSWORD, SSN, PHONE, PHOTO, CITY, ADDRESS, POSTALCODE)
VALUES('lalaland','������','090909','930106-1','010-0909-1190',default,'����Ư���� ��걸 �Ѱ����10�� 14','�Ѱ��νֿ뽺����Ȩ','04389');
INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME, PASSWORD, SSN, PHONE, PHOTO, CITY, ADDRESS, POSTALCODE)
VALUES('kimzzang','���̷�','06078','950506-1','010-7859-5566',default,'����Ư���� ���ʱ� ����19�� 67','���������Ʈ','06681');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Gameing','������','1234','901220-1','010-8452-6312','07728','����Ư���� ������ ������ 142','��ȭ������102ȣ');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Tomas','������','1234','900830-1','010-5245-8453','07727','����Ư���� ������ ȭ��� 176-21','�����101ȣ');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Rupi','��â��','1234','940234-1','010-3254-4512','07677','����Ư���� ������ �ʷϸ�����11�� 27','������������');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Ourusa','��â��','1234','950425-1','010-5491-4425','07677','����Ư���� ������ ��ġ���12�� 57','���̾ؿ��̺�����');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Smoker','����Ŀ','1234','940201-2','010-5598-7812','07679','����Ư���� ������ ��ġ��� 63','�����������ٷμ���');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Oarora','������','1234','951112-2','010-8265-4455','07726','����Ư���� ������ ������26�� 35-27','��ξ�Ʈ��120ȣ');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('ting','������','1234','900512-2','010-7751-1513','07676','����Ư���� ������ �ʷϸ�����21�� 6','�������202ȣ');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('skrad','��켮','1234','970118-1','010-5098-5412','07730','����Ư���� ������ ��ġ���4�� 98-10','�޺�������302ȣ');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('monga','����','1234','961211-1','010-5611-6312','07727','����Ư���� ������ ȭ��� 176-19','���缾Ʈ�������Ʈ102ȣ');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('rion','������','1234','960422-2','010-5131-1123','07721','����Ư���� ������ ȭ���34�� 22','�������Ͽ콺102ȣ');
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('tail','������','1234','940220-2','010-6151-8488','07730','����Ư���� ������ ��ġ���4�ٱ� 21','�Ƹ���Ʈ��102ȣ');

CREATE SEQUENCE employee_id
START WITH 1000
INCREMENT BY 1;

CREATE TABLE EMPLOYEES(
employee_id VARCHAR2(15) PRIMARY KEY,
manager VARCHAR2(20) NOT NULL,
name VARCHAR2(20) NOT NULL,
birth_date VARCHAR2(20) NOT NULL,
photo VARCHAR2(20),
notes VARCHAR2(20)
);





CREATE TABLE Shippers(
shipper_id VARCHAR2(15) PRIMARY KEY,
shipper_name VARCHAR2(15)  NOT NULL,
phone VARCHAR2(15) UNIQUE NOT NULL
);

CREATE SEQUENCE order_id
START WITH 1000
INCREMENT BY 1;

CREATE TABLE Orders(
order_id NUMBER PRIMARY KEY,
customer_id VARCHAR2(15),
employee_id VARCHAR2(15),
order_date DATE DEFAULT SYSDATE,
shipper_id VARCHAR2(15),
CONSTRAINT orders_fk_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
CONSTRAINT orders_fk_employees FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
CONSTRAINT orders_fk_shippers FOREIGN KEY(shipper_id) REFERENCES shippers(shipper_id)
);
CREATE TABLE Suppliers(
supplier_id VARCHAR2(15) PRIMARY KEY,
supplier_name VARCHAR2(15) NOT NULL,
contact_name VARCHAR2(15) NOT NULL,
address VARCHAR2(15) NOT NULL,
city VARCHAR2(15) NOT NULL,
postal_code VARCHAR2(15) NOT NULL,
country VARCHAR2(15) NOT NULL,
phone VARCHAR2(15) NOT NULL
);

CREATE SEQUENCE category_id
START WITH 1000
INCREMENT BY 1;

CREATE TABLE Categories(
category_id NUMBER PRIMARY KEY,
category_name VARCHAR2(15),
description VARCHAR2(15) 
);


CREATE SEQUENCE product_id
START WITH 1000
INCREMENT BY 1;
CREATE TABLE Products(
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(15) NOT NULL,
    supplier_id VARCHAR2(15),
    category_id NUMBER,
    unit VARCHAR2(15),
    price NUMBER,
    CONSTRAINT products_fk_suppliers FOREIGN KEY(supplier_id) REFERENCES  suppliers(supplier_id),
    CONSTRAINT products_fk_categories FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

CREATE SEQUENCE order_detail_id
START WITH 1000
INCREMENT BY 1;
CREATE TABLE Order_details(
order_detail_id NUMBER PRIMARY KEY,
order_id NUMBER,
product_id NUMBER,
quantity NUMBER,
CONSTRAINT orderdetails_order_id FOREIGN KEY(order_id) REFERENCES Orders(order_id),
CONSTRAINT orderdetails_product_id FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

insert into EMPLOYEES(employee_id, manager, name, birth_date, photo, notes)
VALUES(EMPLOYEE_ID.NEXTVAL,'MANAGER','����','890201-2','���.jpg','�Ŵ���');