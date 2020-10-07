package org.pub.service;

import javax.mail.internet.MimeMessage;

import org.pub.dao.MailDAO;
import org.pub.vo.MailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender mailSender;
	
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
	public void delCode(String email) {
		this.mailDAO.delCode(email);
	}
	
	@Override
	public String mailsend(MailVO v) {
		// 메일 제목, 내용
		String subject = "회원가입 인증 코드";
		String content = "인증 코드는  ";
		if(v.getType().equals("join")) {
			subject = "회원가입 인증 코드";
			content = "인증 코드는  ";
		}else if(v.getType().equals("find_pwd")) {
			subject = "임시 비밀번호 발급해드립니다.";
			content = "임시 비밀번호는  ";
		}
		String code=v.getCode();
		
		// 보내는 사람
		String from = "st4731@naver.com";
		
		// 받는 사람
		String to = v.getEmail()+"@"+v.getDomain();
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

			// 메일 내용을 채워줌
            messageHelper.setFrom(from);	// 보내는 사람 셋팅
            messageHelper.setTo(to);		// 받는 사람 셋팅
            messageHelper.setSubject(subject);	// 제목 셋팅
            messageHelper.setText(content+code);	// 내용 셋팅

			// 메일 전송
			mailSender.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	
	@Override
	public String r_code(){
		String code="";
		for(int i=0;i<=5;i++) {
			int num=(int)(Math.random()*3);
			if(num == 0) {
				code+=""+(int)(Math.random()*10);
			}else if(num == 1) {
				code+=(char)((int)(Math.random()*26)+65);
			}else if(num == 2) {
				code+=(char)((int)(Math.random()*26)+97);
			}else {

			}
		}
		return code;

	}

}
