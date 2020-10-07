package org.pub.service;

import org.pub.vo.MailVO;

public interface MailService {

	void sendCode(MailVO v);

	String code(String email);

	void delCode(String email);

	String mailsend(MailVO v);

	String r_code();

	

}
