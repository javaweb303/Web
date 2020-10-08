select m.id, m.name, b.e_no, b.loan_date, title
from member m, book_loan_info b, ebook e
where m.id=b.id and b.e_no=e.e_no;

select e.title, e.isbn, e.publisher,e.e_no
from member m, book_loan_info b, ebook e
where m.id=b.id and b.e_no=e.e_no and m.id='young' order by b.loan_date desc;

select * from(
select rowNum, e.title, e.isbn, e.publisher,e.e_no
from member m, book_loan_info b, ebook e
where m.id=b.id and b.e_no=e.e_no and m.id='young' and b.state=1 order by b.loan_date desc)
where rowNum=1;

select * from (
select rowNum rNum, e_no, title, author, publisher, publication_year from
(select * from ebook where title like '%초보자%'
order by e_no))
where rNum >=1 and rNum <=7;

select e.title, e.isbn, e.publisher, e.e_no
from member m, book_loan_info b, ebook e
where m.id=b.id and b.e_no=e.e_no and m.id='test' and b.state=2
order by b.loan_date desc

select count(*) from gongji;

select count(*) from FAQCONTENT;

select count(*) from member where state=1;
select count(*) from member;