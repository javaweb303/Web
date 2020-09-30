package org.pub.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String id;//아이디
	private String pw;//비번
	private String name;//이름
	private String email;//메일
	private String email_domain;//메일 도메인
	private String gender;//성별
	private String birth;//생일
	private String mem_phone1; //폰번호
	private String mem_phone2; //폰번호
	private String mem_phone3; //폰번호
	private String zipNo; //우편번호
	private String roadAddrPart1; //우편번호
	private String roadAddrPart2; //주소
	private String addrDetail; //나머지 주소
	private String regdate;//가입날짜
	private String deldate;//탈퇴날짜
	private String delcont;//탈퇴사유
	private int state;//회원 상태
	private boolean admin;
	private String overdue;
}
