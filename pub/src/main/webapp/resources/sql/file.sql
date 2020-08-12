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
create table tbl_ebook(
e_num number(38) constraint ebook_pk primary key,
e_title varchar2(500) not null,
e_author varchar2(500) not null,
e_publisher varchar2(500) not null,
e_publication_year number(38) not null,
e_group number(38) not null,
e_status number(38) default 5,
e_recommend number(38) default 0,
file_no varchar2(50),
boardcd varchar2(30),
--constraint ebook_file_no_fk foreign key(file_no) references tbl_file(file_no),
constraint ebook_boardcd_fk foreign key(boardcd) references board(boardcd)
);

drop table tbl_ebook;

select * from tbl_ebook;

create sequence e_num_seq
increment by 1 
start with 1 
nocache;

drop sequence e_num_seq;

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
