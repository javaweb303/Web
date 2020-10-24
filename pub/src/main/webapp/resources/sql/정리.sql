/* 테이블 */
/* 회원 */
CREATE TABLE member (
	id VARCHAR2(100) constraint Member_Id_PK primary key, /* 아이디 */
	pw VARCHAR2(100), /* 비밀번호 */
	name VARCHAR2(100), /* 이름 */
	email VARCHAR2(50), /* 이메일 */
	email_domain VARCHAR2(50), /* 이메일 도메인 */
	gender VARCHAR2(10), /* 성별 */
	birth VARCHAR2(100), /* 생일 */
	mem_phone1 VARCHAR2(10), /* 폰번호1 */
	mem_phone2 VARCHAR2(15), /* 폰번호2 */
	mem_phone3 VARCHAR2(15), /* 폰번호3 */
	zipNo VARCHAR(50), /* 우편번호 */
	roadAddrPart1 VARCHAR2(500), /* 도로명주소1 */
	roadAddrPart2 VARCHAR2(500), /* 도로명주소2 */
	addrDetail VARCHAR2(500), /* 상세주소 */
	regdate DATE, /* 가입날짜 */
	deldate DATE, /* 탈퇴날짜 */
	delcont VARCHAR2(3000), /* 탈퇴내용 */
	state NUMBER(10) DEFAULT 1, /* 회원상태 */
	overdue DATE /* 연체기간 */
);
/* 전자책 */
CREATE TABLE ebook (
	e_no NUMBER(38) constraint eBook_Eno_PK primary key, /* 전자책번호 */
	title VARCHAR2(500), /* 제목 */
	author VARCHAR2(500), /* 저자 */
	publisher VARCHAR2(500), /* 출판사 */
	publication_year VARCHAR2(30), /* 출판연도 */
	book_introduce VARCHAR2(3000), /* 소개 */
	category VARCHAR2(50), /* 분류 */
	status NUMBER(38) DEFAULT 5, /* 대출인원 */
	recommend NUMBER(38) DEFAULT 0, /* 추천수 */
	isbn VARCHAR2(100), /* isbn */
	imgurl VARCHAR2(3000) /* 외부이미지 */
);
/* 게시판 */
CREATE TABLE board (
	boardcd VARCHAR2(50) constraint Board_cd_PK primary key, /* 게시판코드 */
	boardnm VARCHAR2(100) /* 게시판이름 */
);

/* 추천 */
CREATE TABLE recommend (
	id VARCHAR2(100), /* 아이디 */
	e_no NUMBER(38) /* 전자책번호 */
);

/* 대출정보 */
CREATE TABLE book_loan_info (
	loan_date DATE, /* 대출날짜 */
	return_date DATE, /* 반납날짜 */
	state number(3) DEFAULT 1, /* 대출 상태 1 - 대출중, 2 - 정상 반납, 3 - 연체*/
	return_date_ok DATE, /* 반납 완료 날짜 */
	id VARCHAR2(100), /* 아이디 */
	e_no NUMBER(38) /* 전자책번호 */
);

/* 파일 */
CREATE TABLE tbl_file (
	file_no INT constraint tbl_file_pk primary key, /* 파일번호 */
	original_file_name VARCHAR2(260 BYTE), /* 원본이름 */
	stored_file_name VARCHAR2(60 BYTE), /* 저장이름 */
	file_size INT /* 파일크기 */
);

/* 댓글 */
CREATE TABLE reply (
	reply_no NUMBER(38) constraint reply_pk primary key, /* 댓글번호 */
	reply_cont VARCHAR2(3000), /* 댓글내용 */
	regdate DATE, /* 등록시간 */
	editdate DATE, /* 수정시간 */
	id VARCHAR2(100), /* 아이디 */
	e_no NUMBER(38) /* 전자책번호 */
);
/* 파일목록 */
CREATE TABLE file_list (
	file_no INT, /* 파일번호 */
	boardcd VARCHAR2(50), /* 게시판코드 */
	e_no NUMBER(38) /* 전자책번호 */
);

/* 이메일 인증코드 */
CREATE TABLE email_code (
	email VARCHAR2(100), /* 이메일 */
	code VARCHAR2(50) /* 인증코드 */
);

/* 공지사항 */
create table gongji(
gongji_no number(38) primary key --번호
,gongji_name varchar2(30) not null --작성자
,gongji_title varchar2(200) not null --공지 제목
,gongji_pwd varchar2(20) not null --공지비번
,gongji_cont varchar2(4000) not null --공지 내용
,gongji_hit number(38) default 0 --조회수
,gongji_date date --공지등록날짜
);

/* faq 카테고리 (홈페이지, 전자도서관, ...) */ 
create table faqCategory(
categoryId number(38) primary key
, categoryName varchar2(2000) not null
);

/* faq에 들어갈 내용 */
create table faqContent(
faqNo number(38) primary key
, Question varchar2(4000) not null
, Answer varchar2(4000) not null
, cId number(38) constraint fk_faqContent references faqCategory(categoryId) on delete cascade
, chkCId number(38)
);

/* 데이터 insert */
/* 공지사항 */
insert into gongji (gongji_no,gongji_name,gongji_title,gongji_pwd,gongji_cont,
gongji_date)
values(g_no_seq.nextval,'관리자','첫번째 공지','777','세번째 공지에요.안녕하세요 오늘도 좋은 하루 보내세요. 코딩 너무 어렵네요^^',sysdate);

insert into gongji (gongji_no,gongji_name,gongji_title,gongji_pwd,gongji_cont,
gongji_date)
values(g_no_seq.nextval,'관리자','두번째 공지','777','세번째 공지에요.안녕하세요 오늘도 좋은 하루 보내세요. 코딩 너무 어렵네요^^',sysdate);

insert into gongji (gongji_no,gongji_name,gongji_title,gongji_pwd,gongji_cont,
gongji_date)
values(g_no_seq.nextval,'관리자','세번째 공지','777','세번째 공지에요.안녕하세요 오늘도 좋은 하루 보내세요. 코딩 너무 어렵네요^^',sysdate);

/*faq 카테고리*/
insert into faqCategory values(100,'홈페이지');
insert into faqCategory values(200,'전자도서관');
insert into faqCategory values(300,'도서관서비스');
insert into faqCategory values(400,'열린공간');

/* faq */
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '회원가입은 어떻게 하나요?','오른쪽 상단에서 자물쇠 아이콘을 선택하면 로그인 화면이 나옵니다. 해당 화면 맨 하단에 있는 회원가입을 선택하면 가입화면이 표시됩니다.',100 );
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '개인정보 수정은 어디서 하나요?','마이페이지에서 수정하실 수 있습니다.', 100);
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '아이디/비밀번호를 까먹었어요','아이디/비밀번호 찾기를 이용하시면 아이디 찾기와 비밀번호 변경이 가능합니다!', 100);
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '회원 탈퇴는 어떻게 하나요?','로그인 후 마이페이지에서 가능합니다', 100);
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '전자도서관을 이용하려면 회원으로 가입해야하나요?','회원이 아니더라도 검색 기능과 모두 이용 자료 열람은 가능하므로 이용 범위에 따라 필수는 아닙니다.전자도서관 회원가입시 다양한 개인화 서비스가 가능합니다',100 );
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '열린공간은 무엇인가요?','열린공간은 공지사항과 자주 묻는 질문에 대한 서비스를 제공하는 메뉴입니다.',400 );

insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '검색은 어떻게 하나요?','통합 검색은 메인페이지 상단에 검색 기능을 사용하시면 검색을 할 수 있습니다.',300 );
insert into faqContent (faqNo,Question,Answer,cId) values(faqCont_no_seq.nextval, '전자도서관이 무엇인가요?','전자도서관은 전자책을 대출할 수 있는 메뉴입니다.문아공간 회원만 전자책 대출이 가능하며,해당 메뉴를 이용하고자 할 시 로그인 된 상태이어야 합니다.
또한 대출 기간은 최대 7일로 대출 후 해당 서비스를 이용할 수 있습니다', 200);

/*외래키*/
/*추천*/
ALTER TABLE recommend ADD CONSTRAINT FK_member_TO_recommend FOREIGN KEY (id) REFERENCES member (id);
ALTER TABLE recommend ADD CONSTRAINT FK_ebook_TO_recommend FOREIGN KEY (e_no) REFERENCES ebook (e_no);

/*대출정보*/
ALTER TABLE book_loan_info ADD CONSTRAINT FK_member_TO_book_loan_info FOREIGN KEY (id) REFERENCES member (id);
ALTER TABLE book_loan_info ADD CONSTRAINT FK_ebook_TO_book_loan_info FOREIGN KEY (e_no) REFERENCES ebook (e_no);

/*댓글*/
ALTER TABLE reply ADD CONSTRAINT FK_member_TO_reply FOREIGN KEY (id) REFERENCES member (id);
ALTER TABLE reply ADD CONSTRAINT FK_ebook_TO_reply FOREIGN KEY (e_no) REFERENCES ebook (e_no);

/*파일리스트*/
ALTER TABLE file_list ADD CONSTRAINT FK_tbl_file_TO_file_list FOREIGN KEY (file_no)	REFERENCES tbl_file (file_no);
ALTER TABLE file_list ADD CONSTRAINT FK_board_TO_file_list FOREIGN KEY (boardcd) REFERENCES board (boardcd);
ALTER TABLE file_list ADD CONSTRAINT FK_ebook_TO_file_list FOREIGN KEY (e_no) REFERENCES ebook (e_no);

/*테이블 삭제 - 생성된 역순으로 지워야함 외래키때문*/
drop table file_list;
drop table tbl_file;
drop table board;
drop table email_code;
drop table book_loan_info;
drop table reply;
drop table recommend;
drop table ebook;
drop table member;
drop table gongji;
drop table faqCategory;
drop table faqContent;

/*테이블 확인*/
select * from member;
select * from ebook;
select * from file_list;
select * from tbl_file;
select * from email_code;
select * from recommend;
select * from reply;
select * from book_loan_info;
select * from gongji order by gongji_no desc;
select * from faqContent;
select * from faqCategory;

/*
 * 관리자 계정 만들기
 * update member set state=5 where id='st4731'; 
 */

/*시퀀스*/
/* 전자책 번호 */
create sequence e_num_seq
increment by 1 
start with 1 
nocache;

/*파일 번호*/
create sequence file_no_seq
increment by 1 
start with 1 
nocache;

/* 댓글번호 */
create sequence reply_no_seq
increment by 1 
start with 1 
nocache;

/* 공지 번호 */
create sequence g_no_seq
start with 1
increment by 1
nocache;

/* faq 번호 */
create sequence faqCont_no_seq
start with 1
increment by 1
nocache;

/* 시퀀스 삭제*/
drop sequence e_num_seq;
drop sequence file_no_seq;
drop sequence reply_no_seq;
drop sequence g_no_seq;
drop sequence faqCont_no_seq;


update member set state=5 where id='admin'; --관리자 계정 생성

insert into member (id,pw,name,email,email_domain,gender,birth,mem_phone1,mem_phone2,mem_phone3,zipNo,roadAddrPart1,roadAddrPart2,addrDetail,regdate,state) values('test','test','a모','a','naver.com','남자','19961212','010','0000','0000','123','서울 특별시 동작구 1322','***빌딩','303호',sysdate,1);
insert into member (id,pw,name,email,email_domain,gender,birth,mem_phone1,mem_phone2,mem_phone3,zipNo,roadAddrPart1,roadAddrPart2,addrDetail,regdate,state) values('test2','test2','a모','a','naver.com','남자','19961212','010','0000','0000','123','서울 특별시 동작구 1322','***빌딩','303호',sysdate,1);
insert into member (id,pw,name,email,email_domain,gender,birth,mem_phone1,mem_phone2,mem_phone3,zipNo,roadAddrPart1,roadAddrPart2,addrDetail,deldate,state,delcont) values('test1','test1','홍길동','abc','naver.com','여자','19971212','010','0000','0000','123','서울 특별시 동작구 1322','***빌딩','303호',sysdate,2,'더이상 홈페이지를 사용하지 않게 되었습니다.');
insert into member (id,pw,name,email,email_domain,gender,birth,mem_phone1,mem_phone2,mem_phone3,zipNo,roadAddrPart1,roadAddrPart2,addrDetail,regdate,state) values('test3','test3','a모','a','naver.com','남자','19961212','010','0000','0000','123','서울 특별시 동작구 1322','***빌딩','303호',sysdate,5);
