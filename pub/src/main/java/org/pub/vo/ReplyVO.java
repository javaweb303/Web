package org.pub.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int reply_no;//댓글번호
	private String reply_cont;//댓글내용
	private String regdate;//등록시간
	private String editdate;//수정시간
	private String id;//아이디
	private int e_no;//전자책번호
	
	
	private int startrow;//시작행번호
	private int endrow;//끝행번호
}
