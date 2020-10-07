--공지사항
create table gongji(
gongji_no number(38) primary key --번호
,gongji_name varchar2(30) not null --작성자
,gongji_title varchar2(200) not null --공지 제목
,gongji_pwd varchar2(20) not null --공지비번
,gongji_cont varchar2(4000) not null --공지 내용
,gongji_hit number(38) default 0 --조회수
,gongji_date date --공지등록날짜
);

drop table gongji
drop sequence g_no_seq
 
select * from gongji order by gongji_no desc;

create sequence g_no_seq
start with 1
increment by 1
nocache;

insert into gongji (gongji_no,gongji_name,gongji_title,gongji_pwd,gongji_cont,
gongji_date)
values(g_no_seq.nextval,'관리자','첫번째 공지','777','세번째 공지에요.안녕하세요 오늘도 좋은 하루 보내세요. 코딩 너무 어렵네요^^',sysdate);

insert into gongji (gongji_no,gongji_name,gongji_title,gongji_pwd,gongji_cont,
gongji_date)
values(g_no_seq.nextval,'관리자','두번째 공지','777','세번째 공지에요.안녕하세요 오늘도 좋은 하루 보내세요. 코딩 너무 어렵네요^^',sysdate);

insert into gongji (gongji_no,gongji_name,gongji_title,gongji_pwd,gongji_cont,
gongji_date)
values(g_no_seq.nextval,'관리자','세번째 공지','777','세번째 공지에요.안녕하세요 오늘도 좋은 하루 보내세요. 코딩 너무 어렵네요^^',sysdate);


select g_no_Seq.nextval from dual;


-----------------------------------------------------------------------------------------------------------------
--faq 카테고리 (홈페이지, 전자도서관, ...)
create table faqCategory(
categoryId number(38) primary key
, categoryName varchar2(2000) not null
);

drop table faqCategory;

insert into faqCategory values(100,'홈페이지');
insert into faqCategory values(200,'전자도서관');
insert into faqCategory values(300,'도서관서비스');
insert into faqCategory values(400,'열린공간');

--faq에 들어갈 내용
create table faqContent(
faqNo number(38) primary key
, Question varchar2(4000) not null
, Answer varchar2(4000) not null
, cId number(38) constraint fk_faqContent references faqCategory(categoryId) on delete cascade
, chkCId number(38)
);

drop table faqContent;

create sequence faqCont_no_seq
start with 1
increment by 1
nocache;

drop sequence faqCont_no_seq;

insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '회원가입은 어떻게 하나요?','오른쪽 상단에서 자물쇠 아이콘을 선택하면 로그인 화면이 나옵니다. 해당 화면 맨 하단에 있는 회원가입을 선택하면 가입화면이 표시됩니다.',100 );
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '개인정보 수정은 어디서 하나요?','마이페이지에서 수정하실 수 있습니다.', 100);
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '아이디/비밀번호를 까먹었어요','아이디/비밀번호 찾기를 이용하시면 아이디 찾기와 비밀번호 변경이 가능합니다!', 100);
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '회원 탈퇴는 어떻게 하나요?','로그인 후 마이페이지에서 가능합니다', 100);
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '전자도서관을 이용하려면 회원으로 가입해야하나요?','회원이 아니더라도 검색 기능과 모두 이용 자료 열람은 가능하므로 이용 범위에 따라 필수는 아닙니다.전자도서관 회원가입시 다양한 개인화 서비스가 가능합니다',100 );
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '열린공간은 무엇인가요?','열린공간은 공지사항과 자주 묻는 질문에 대한 서비스를 제공하는 메뉴입니다.',400 );

insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '검색은 어떻게 하나요?','통합 검색은 메인페이지 상단에 검색 기능을 사용하시면 검색을 할 수 있습니다.',300 );
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '전자도서관이 무엇인가요?','전자도서관은 전자책을 대출할 수 있는 메뉴입니다.문아공간 회원만 전자책 대출이 가능하며,해당 메뉴를 이용하고자 할 시 로그인 된 상태이어야 합니다.
또한 대출 기간은 최대 7일로 대출 후 해당 서비스를 이용할 수 있습니다', 200);

select * from faqContent;
select * from faqCategory;


select faqContent.faqNo, faqContent.fQuestion,faqContent.fAnswer,faqContent.cId, faqCategory.categoryName
from faqContent,faqCategory
where faqContent.cId=faqCategory.categoryId and cid=100;

select count(*) from faqContent,faqCategory
where faqContent.cId=faqCategory.categoryId  and cid=100;

select * from (
select rowNum, faqNo,question,answer,cId,chkCId from
(select * from FAQCONTENT,faqCategory where faqContent.cId=faqCategory.categoryId order by faqContent.faqNo)
) where rowNum>=1 and rowNum<=10;