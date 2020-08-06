package org.pub.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.pub.service.MemberService;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	@Autowired//자동 의존성
	private MemberService pubService;
	
	
	@RequestMapping("/join")
	public String join() {
		return "member/join";
	}
	@RequestMapping("/join_ok")
	public void join_ok(@ModelAttribute MemberVO m,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		System.out.println(m.getId());
		System.out.println(m.getGender());
		System.out.println(m.getPw());
		System.out.println(m.getBirth());
		System.out.println(m.getName());
		System.out.println(m.getEmail());
		
		pubService.join(m);
		out.println("<script>");
		out.println("alert('회원가입 완료!')");
		out.println("location='/login'");
		out.println("</script>");
	}
	
	@RequestMapping("/login")
	public String login(RedirectAttributes rttr) {
		
		
		return "member/login";
	}
}
