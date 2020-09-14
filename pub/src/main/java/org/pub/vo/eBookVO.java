package org.pub.vo;

import java.util.List;

import lombok.Data;

@Data
public class eBookVO {
	private int e_no;//전자책 코드 ?
	private String e_title;//제목
	private String e_author;//저자
	private String e_publisher;//출판사
	private int e_publication_year;//출판연도
	private String e_introduce;//책소개
	private String e_group;//KDC분류코드
	private String e_status;//도서현황
	private int e_recommend;//추천수
	private String file_no;//파일 인덱스 번호.
	
	private FileVO img_file;
	private FileVO file;
	
	private int startrow;//시작행번호
	private int endrow;//끝행번호
	
	//검색기능
    private String find_name;//검색어
    private String find_field;//검색필드
    private String find_theme;//검색 테마.
}
