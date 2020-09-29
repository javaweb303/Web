create table dept71(
deptno number(38) constraint dept71_deptno_pk primary key,
dname varchar2(100) constraint dept71_dname_nn not null,
LOC varchar2(150)
);

insert into dept71 values(10,'관리부','서울');
insert into dept71 values(20,'영업부','부산');
insert into dept71 values(30,'개발부','판교');

select * from dept71;

create table emp71(
empno number(38) constraint emp71_empno_pk primary key,
ename varchar2(100) constraint emp71_dname_nn not null,
job varchar2(100),
deptno number(38), 
constraint emp71_deptno_fk FOREIGN KEY(deptno) REFERENCES dept71(deptno)
);

insert into emp71 values (11,'홍길동','관리원',10);
insert into emp71 values (12,'이순신','영업사원',20);

select * from emp71;

select a.constraint_name, a.table_name, b.column_name, a.constraint_type, a.r_constraint_name
from user_constraints a, user_cons_columns b
where
table_name=file_list;
