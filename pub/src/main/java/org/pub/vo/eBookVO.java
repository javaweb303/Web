package org.pub.vo;

import java.util.Date;

import lombok.Data;

@Data
public class eBookVO {
	private int e_no;//전자책 코드 ?
	private String e_title;//제목
	private String e_author;//저자
	private String e_publisher;//출판사
	private String e_publication_year;//출판연도
	private String book_introduce;//책소개
	private String author_introduce;//작가소개
	private String contents;//목차
	private String e_group;//분류
	private String e_status;//도서현황
	private int e_recommend;//추천수
	private String isbn;
	private String imgurl;
	
	//대출관련부분
	private String loan_date;//대출날짜
	private String return_date;//반납 날짜
	
	//페이징관련부분
	private int startrow;//시작행번호
	private int endrow;//끝행번호
	
	//검색기능
    private String searchKeyword;//검색어
    private String searchCondition;//작가,제목
    private String searchCa;//과학,어린이.
}
