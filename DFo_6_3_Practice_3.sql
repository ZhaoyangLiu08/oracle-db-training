create table DEPT (
    dept_id number(8) ,
    dept_name varchar2(30),
    loc_id number(4),
    primary key (dept_id , loc_id)
);

create table SUPPLIERS (
    sup_id number(15) not null,
    sup_name varchar2(30) not null,
    contact_name number(4),
    primary key (sup_id , sup_name)
);

create table PRODUCTS (
    product_id number(10) primary key,
    sup_id number(15) not null,
    sup_name varchar2(30) not null,
    constraint fk_suppliers foreign key (sup_id , sup_name) references SUPPLIERS (sup_id , sup_name)
);

create table DEPT_SAMPLE (
    dept_id number(8) ,
    dept_name varchar2(30),
    loc_id number(4),
    constraint uq_dept_id_name unique (dept_id, dept_name)
);
 