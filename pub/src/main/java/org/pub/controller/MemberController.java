package org.pub.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.service.MemberService;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	@Autowired//자동 의존성
	private MemberService memberService;
	
	
	@RequestMapping("/join")
	public String join(Model m) {
		m.addAttribute("code", "null");
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
		
		memberService.join(m);
		out.println("<script>");
		out.println("alert('회원가입 완료!')");
		out.println("location='/login'");
		out.println("</script>");
	}
	
	@RequestMapping("/login")
	public String login(RedirectAttributes rttr) {
		
		
		return "member/login";
	}
	
	@RequestMapping("/login_ok")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVO vo=memberService.getMember(id);
		System.out.println(vo.getPw());
		System.out.println(pwd);
		String dbpwd=vo.getPw();
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		if(pwd.equals(dbpwd)) {
			session.setAttribute("id", id);
			out.println("<script>");
			out.println("alert('정상로그인 되었습니다.')");
			out.println("location='/'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 비밀번호를 확인해주세요');");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		ModelAndView mv=new ModelAndView();
		
		return null;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");
		if(id != null) {
			session.invalidate();
			out.println("<script>");
			out.println("alert('정상로그아웃 되었습니다.')");
			out.println("location='/'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('로그인이 안되있는데 말도안되..');");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		return null;
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession session,HttpServletResponse response) {
		String id=(String)session.getAttribute("id");
		if(id != null) {
			
		}
		return null;
	}
}

@RestController
class rest_member {
	@Autowired//자동 의존성
	private MemberService memberService;
	
	@RequestMapping("/idcheck")
	public ResponseEntity<String> id_check(@RequestBody Map<String,Object> m){
		ResponseEntity<String> entity=null;
		try{
			MemberVO vo=memberService.getMember(m.get("id").toString());
			if(vo != null) {
				entity=new ResponseEntity<String>("FAIL",HttpStatus.OK);
			}else {
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
