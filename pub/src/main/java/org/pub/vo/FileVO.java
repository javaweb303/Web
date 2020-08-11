package org.pub.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileVO {
	private int file_no; //파일번호
	private String original_file_name; //파일 원본 이름
	private String stored_file_name; // 저장되는 파일이름
	private Long file_size;// 파일크기
	private String boardcd; //
	private String ext;
	private MultipartFile file;
}
