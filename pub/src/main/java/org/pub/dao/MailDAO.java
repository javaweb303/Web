package org.pub.dao;

import org.pub.vo.MailVO;

public interface MailDAO {

	void sendCode(MailVO v);

	String code(String email);

	void delCode(String email);

}
