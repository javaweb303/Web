package org.pub.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {
	
	@RequestMapping(value="/sendmail")
	public String sendMail(@RequestBody String email) {
		String sendcode=mailTest(email);
		
		return sendcode;
	}
	public String mailTest(String email) {
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
		JavaMailSenderImpl mailSender = (JavaMailSenderImpl)ctx.getBean("mailSender");
		
		// 메일 제목, 내용
		String subject = "제목입니당";
		String content = "내용입니당~  ";
		String code=code();
		
		// 보내는 사람
		String from = "st4731@naver.com";
		
		// 받는 사람
		String to = email;
		
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
	public String code(){
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

