package org.pub.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.pub.service.MailService;
import org.pub.service.MemberService;
import org.pub.vo.MailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MailService mailService;
	@Autowired
	private MemberService memverService;
	
	@RequestMapping("/sendmail")
	public ResponseEntity<String> sendMail(@RequestParam("email") String email, @RequestParam("domain") String domain, @RequestParam("type") String type,@RequestParam(value="code", required=false, defaultValue="") String code) {
		ResponseEntity<String> entity=null;
		MailVO v=new MailVO();
		v.setEmail(email);
		v.setDomain(domain);
		v.setType(type);
		try {
			if(type.equals("join")) {
				code=mailService.r_code();
				v.setCode(code);
				mailService.mailsend(v);
				mailService.sendCode(v);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}else if(type.equals("check")) {
				String dbcode=mailService.code(email).trim();
				System.out.println("넘겨받은 code = "+code);
				System.out.println(dbcode);
				if(code.equals(dbcode)) {
					mailService.delCode(email);
					entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
				}else {
					entity=new ResponseEntity<String>("FAIL",HttpStatus.OK);
				}
			}else if(type.equals("find_pwd")) {
				//memverService.updatePwd(m);
			}
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/chk")
	public ResponseEntity<String> chk(@RequestBody Map<String,Object> list, Model m){
		ResponseEntity<String> entity=null;
		String email=(String)list.get("email");
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
	
	
}

