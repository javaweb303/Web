create table tbl_file(
file_no number constraint file_no_pk primary key,
original_file_name varchar2(260 BYTE) not null,
stored_file_name varchar2(60 BYTE) not null,
file_size number,
boardcd varchar2(30),
constraint file_boardcd_fk foreign key(boardcd) references board(boardcd)
);

drop table tbl_file;


select * from tbl_file;
/* 파일 번호
 * 원본 파일 이름
 * 실제 저장된 파일이름
 * 저장된 시간
 * 파일크기
 * 작성자
 * 저장한 게시판?*/

create sequence file_no_seq
increment by 1 
start with 1 
nocache;

drop sequence file_no_seq;

--게시판을 구별하기위해.. 만듬
create table board(
boardcd varchar2(30) primary key,--게시판 
boardnm varchar2(100)-- 개시판 이름
);
insert into board values('ebook','전자도서관');
insert into board values('notice','공지사항');
insert into board values('faq','자주묻는질문');

create table recommend(
user_id,
e_num
);


insert into member (id,pw,name,email,gender,birth,regdate,state)
values('st4731','123456','범더기','st4731@naver.com','남자','19961212',sysdate,1)
