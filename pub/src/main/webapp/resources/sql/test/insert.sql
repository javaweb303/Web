/*게시판*/
insert into board values('ebook','전자도서관');
insert into board values('notice','공지사항');
insert into board values('faq','자주묻는질문');

/*회원*/
insert into member (id,pw,name,email,gender,birth,regdate,state)
values('test','test','test','test@naver.com','남자','19961212',sysdate,1);