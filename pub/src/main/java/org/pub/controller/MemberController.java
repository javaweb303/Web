package org.pub.controller;

import javax.servlet.http.HttpServletRequest;

import org.pub.service.MemberService;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
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
	public ModelAndView join_ok(@ModelAttribute MemberVO m,HttpServletRequest request) {
		System.out.println(m.getId());
		
		//pubService.join(m);
		return null;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(RedirectAttributes rttr) {
		
		
		ModelAndView mv=new ModelAndView();
		return null;
	}
}
