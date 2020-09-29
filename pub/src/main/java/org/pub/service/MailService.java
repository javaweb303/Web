package org.pub.service;

import org.pub.vo.MailVO;

public interface MailService {

	void sendCode(MailVO v);

	String code(String email);

	

}
