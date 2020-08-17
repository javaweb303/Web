create table member(
id varchar2(100) primary key,
pw varchar2(100) not null,
name varchar2(100) not null,
email varchar2(200) not null,
gender varchar2(10) not null,
birth varchar2(100) not null,
regdate date not null,
deldate date,
delcont varchar2(3000),
state number(38) not null,
admin char(4) default 'N'
);

drop table member;
select * from member;

insert into member (id,pw,name,email,gender,birth,regdate,state)
values('st4731','123456','범더기','st4731@naver.com','남자','19961212',sysdate,1)