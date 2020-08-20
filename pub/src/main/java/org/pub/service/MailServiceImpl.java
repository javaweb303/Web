package org.pub.service;

import org.pub.dao.MailDAO;
import org.pub.vo.MailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private MailDAO mailDAO;

	@Override
	public void sendCode(MailVO v) {
		this.mailDAO.sendCode(v);
	}

	@Override
	public String code(String email) {
		return this.mailDAO.code(email);
	}

	@Override
	public void del_code(String email) {
		mailDAO.del_code(email);
		
	}


}
