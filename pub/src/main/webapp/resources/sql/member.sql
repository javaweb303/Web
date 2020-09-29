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
--overdue date,--연체기간
state number(38) not null,
admin char(4) default 'N'
);

drop table member CASCADE CONSTRAINTS;
select * from member;

insert into member (id,pw,name,email,gender,birth,regdate,state)
values('st4731','123456','범더기','st4731@naver.com','남자','19961212',sysdate,1)

insert into member (id,pw,name,email,gender,birth,regdate,state)
values('test','test','test','test@naver.com','남자','19961212',sysdate,1)

--수정
create table member(
id varchar2(100) primary key
,pw varchar2(100) not null
,name varchar2(100) not null
,gender varchar2(10) not null
,birth varchar2(100) not null
,zipNo varchar2(4000) not null --우편번호
,roadAddrPart1 varchar2(4000) not null --우편번호
,roadAddrPart2 varchar2(4000) not null -- 주소
,addrDetail varchar2(4000) not null --나머지 주소
,mem_phone01 varchar2(400) --폰번호
,mem_phone02 varchar2(400) --폰번호
,mem_phone03 varchar2(400) --폰번호
,email varchar2(4000) not null  --email아이디
,emailDomain varchar2(4000) --@다음 메일 도메인
,regdate date not null --가입날짜 (sysdate)
,deldate date --탈퇴날짜
,delcont varchar2(3000), --탈퇴사유
state number(38) not null, --가입회원1 , 탈퇴회원=2
admin char(4) default 'N'
);