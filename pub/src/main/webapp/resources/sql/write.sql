create table tbl_notice(
notice_no number(38) primary key
,notice_name varchar2(50) not null --작성자
,notice_title varchar2(200) not null -- 제목
,notice_pwd varchar2(20) not null -- 비번
,notice_cont varchar2(4000) not null--내용
,notice_hit number(38) default 0 -- 조회수
,notice_date date default sysdate -- 글등록날짜 
);
--번호 제목 내용 작성자 작성시간 조회수 

create sequence notice_no_seq
start with 1 
increment by 1
nocache; --임시메모리 사용x