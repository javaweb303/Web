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


/* 책코드
 * 제목
 * 저자
 * 출판사
 * 출판연도
 * 이미지
 * 분류 코드(KDC)기준으로 분류.
 * 파일
 * 대출인원
 * 좋아요
 */
create table ebook(
e_num number(38) constraint ebook_pk primary key,
e_title varchar2(500) not null,
e_author varchar2(500) not null,
e_publisher varchar2(500) not null,
e_publication_year number(38) not null,
e_group number(38) not null,
e_bookimg varchar2(500) not null,
e_file varchar2(500) not null,
e_status number(38) default 5,
e_recommend number(38) default 0
);

create sequence e_num_seq
increment by 1 
start with 1 
nocache;

