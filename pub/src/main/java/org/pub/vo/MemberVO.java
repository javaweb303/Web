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
	
	/*관리자 단 회원 관리 회원 목록 페이징(쪽 나누기) 관련 변수*/
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호
	
	/* 관리자 단 회원 목록 검색 필드와 검색어 저장변수*/
	private String find_name; //검색어
	private String find_field; //검색 필드
}
