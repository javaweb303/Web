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
	
}
