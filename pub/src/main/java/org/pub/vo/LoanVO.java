package org.pub.vo;

import lombok.Data;

@Data
public class LoanVO {
	private String loan_date;
	private String return_date;
	private int state;
	private String return_date_ok;
	private String id;
	private int e_no;
}
