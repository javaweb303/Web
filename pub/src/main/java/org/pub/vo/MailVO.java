package org.pub.vo;

import lombok.Data;

@Data
public class MailVO {
	private String email;
	private String domain;
	private String code;
	private String type;
}
