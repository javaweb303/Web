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
 * 이미지
 * 파일
 * 대출인원
 * 좋아요
 */
create table ebook(

);
