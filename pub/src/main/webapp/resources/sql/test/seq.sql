create sequence e_no_seq --전자책 시퀀스
increment by 1 
start with 1 
nocache;

create sequence file_no_seq --파일번호 시퀀스
increment by 1 
start with 1 
nocache;

create sequence reply_no_seq -- 댓글번호 시퀀스
increment by 1 
start with 1 
nocache;

drop sequence e_no_seq;
drop sequence file_no_seq;
drop sequence reply_no_seq;