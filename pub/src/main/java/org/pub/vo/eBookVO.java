package org.pub.vo;

import lombok.Data;

@Data
public class eBookVO {
	private int e_code;//전자책 코드 ?
	private String e_title;//제목
	private String e_author;//저자
	private String e_publisher;//출판사
	private int e_publication_year;//출판연도
	private String e_group;//KDC분류코드
	private String e_status;//도서현황
	private int e_recommend;//추천수
	private String file_idxs;//파일 인덱스 번호.
	private String boardcd;//게시판
}
