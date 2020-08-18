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
e_introduce varchar2(3000),
e_group number(38) not null,
e_status number(38) default 5,
e_recommend number(38) default 0,
file_no varchar2(50),
boardcd varchar2(30),
--constraint ebook_file_no_fk foreign key(file_no) references tbl_file(file_no),
constraint ebook_boardcd_fk foreign key(boardcd) references board(boardcd)
);
select * from member;
drop table tbl_ebook;

select * from tbl_ebook;

update tbl_ebook set e_status=0 where e_num=2;

create sequence e_num_seq
increment by 1 
start with 1 
nocache;

drop sequence e_num_seq;



create table recommend(
id varchar2(100),
e_num number(38)
);

create table book_loan_return(
id varchar2(100),
e_num number(38),
loan_date date,
return_date date,
);