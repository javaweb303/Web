package org.pub.vo;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class FaqContentVO {

	private int faqNo;
	private String Question;
	private String Answer;
	private int cId;
	private int chkCId;
	
	private int startrow;
	private int endrow;
	
	private String find_field; //검색 필드
	private String find_name; //검색어 
	
}
