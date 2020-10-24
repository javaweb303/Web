package org.pub.controller;

import java.util.List;

import org.pub.service.AdminEbookService;
import org.pub.service.AdminMemberService;
import org.pub.service.AdminOpenService;
import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*") //interceptor에서 admin으로 묶인 페이지는 관리자가 아닌 회원이 접속을 하지 못하도록 만들기 위해 사용함..
public class AdminController {

	@Autowired
	private AdminOpenService adminOpenService;
	@Autowired
	private AdminMemberService adminMemberService;
	@Autowired
	private AdminEbookService adminEbookService;
	
	//관리자 페이지 메인 화면
	@RequestMapping("/adIndex")
	public String adIndex(@ModelAttribute GongjiVO g, @ModelAttribute FaqContentVO f, @ModelAttribute MemberVO member,
			@ModelAttribute eBookVO eb,Model m) throws Exception {
		//공지수, faq 수, 회원 수, 전자책 수
		int gongji_count = this.adminOpenService.getGongjiCount(g);
		int faq_count = this.adminOpenService.getFaqCount(f);
		int member_count = this.adminMemberService.getMemberCount(member);
		int ebook_count = this.adminEbookService.getEbookCount(eb);
		
		//공지사항, faq 리스트
		List<GongjiVO> glist = this.adminOpenService.getMainGongjiList(g);
		List<FaqContentVO> flist = this.adminOpenService.getMainFaqList(f);
		
		m.addAttribute("gongji_count", gongji_count);
		m.addAttribute("faq_count", faq_count);
		m.addAttribute("member_count", member_count);
		m.addAttribute("ebook_count", ebook_count);
		
		m.addAttribute("glist", glist);
		m.addAttribute("flist", flist);
		return "admin/adIndex";
		
	}//adIndex()
}
