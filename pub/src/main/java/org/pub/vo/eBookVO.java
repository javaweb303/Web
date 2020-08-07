package org.pub.vo;

import lombok.Data;

@Data
public class eBookVO {
	private int e_code;//전자책 코드 ?
	private String e_title;//제목
	private String e_author;//저자
	private String e_publisher;//출판사
	private int e_publication_year;//출판연도
	private String e_bookimg;//파일이미지 이름.
	private String e_group;//KDC분류코드
	private String e_file;//전자책파일 이름 넣을곳 ?
	private String e_status;//도서현황
	private int e_recommend;//추천수
}
