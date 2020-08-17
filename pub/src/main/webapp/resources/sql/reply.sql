create table ebook_reply(
reply_number(38) primary key,
e_num number(38),
id varchar2(100),
reply_cont varchar2(3000),
regdate date
);

create sequence reply_num_seq
increment by 1 
start with 1 
nocache;

drop table member;
select * from member;

--vo,xml,쿼리,뷰페이지