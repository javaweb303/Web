drop table file_list;
drop table tbl_file;
drop table board;
drop table email_code;
drop table book_loan_return;
drop table reply;
drop table recommand;
drop table ebook;
drop table member;


select * from member;
select * from ebook;
select * from file_list;
select * from tbl_file;
select * from email_code;
select * from recommand;
select * from reply;
select * from book_loan_return;

delete from recommand where e_no=2;

select * from ebook where isbn=9791158392239

delete from ebook where isbn=9791158392239