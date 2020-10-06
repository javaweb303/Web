package org.pub.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.pub.service.MailService;
import org.pub.vo.MailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MailService mailService;
	
	@RequestMapping("/sendmail")
	public ResponseEntity<String> sendMail(@RequestBody HashMap<String,String> map) {
		ResponseEntity<String> entity=null;
		String email=map.get("email");
		String code=code();
		MailVO v=new MailVO();
		v.setEmail(email);
		v.setCode(code);
		try {
			mailService.sendCode(v);
			mailTest(v);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/chk")
	public ResponseEntity<String> chk(@RequestBody Map<String,Object> list, Model m){
		ResponseEntity<String> entity=null;
		String email=(String)list.get("email"); cx"?
		String code=(String)list.get("code");
		try {
			String dbcode=mailService.code(email).trim();
			System.out.println("넘겨받은 code = "+code);
			System.out.println(dbcode);
			if(code.equals(dbcode)) {
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}else {
				entity=new ResponseEntity<String>("FAIL",HttpStatus.OK);
			}
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	public String mailTest(MailVO v) {
		// 메일 제목, 내용
		String subject = "회원가입 인증 코드";
		String content = "인증 코드는  ";
		String code=v.getCode();
		
		// 보내는 사람
		String from = "st4731@naver.com";
		
		// 받는 사람
		String to = v.getEmail();
		
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

