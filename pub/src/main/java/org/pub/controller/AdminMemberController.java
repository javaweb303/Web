package org.pub.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pub.service.AdminMemberService;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	//관리자 회원 목록
	@RequestMapping("/admin_member_list")
	public String admin_member_list(Model listM, HttpServletResponse response, MemberVO m, HttpServletRequest request) throws Exception{
		List<MemberVO> blist = this.adminMemberService.getMemberList(m);
		listM.addAttribute("blist", blist);
		return "admin/adMember_list";
	}//admin_member_list()
	
	//관리자에서 회원 상세정보 + 수정폼
	@RequestMapping("/admin_member_info")
	public String admin_member_info(String id, String state, HttpServletRequest request, HttpServletResponse response,
			Model am) throws Exception{
		MemberVO m = this.adminMemberService.getMemInfo(id);
		am.addAttribute("m", m);
		
		if(state.equals("info")) {
			return "admin/adMember_info";
		} else if(state.equals("edit")) {
			return "admin/adMember_edit";
		}//state 구분값으로 한개 매핑주소로 2개의 기능 뷰페이지를 사용
		return null;
	}//admin_member_info()
	
	//관리자에서 회원정보 수정
	@RequestMapping("/admin_member_edit")
	public String admin_member_edit(MemberVO m, HttpServletRequest request, HttpServletResponse response) throws
	Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		this.adminMemberService.editM(m);//회원정보 수정
		out.println("<script>");
		out.println("alert('회원정보 수정');");
		out.println("location='admin_member_info?state=info&id="+m.getId()+"';");
		out.println("</script>");
		return null;
	}//admin_member_edit()
	
	//관리자에서 회원정보 삭제
	@RequestMapping("/admin_member_del")
	public ModelAndView admin_member_del(String id, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out= response.getWriter();
		this.adminMemberService.delM(id);
		out.println("<script>");
		out.println("alert('회원정보 삭제');");
		out.println("</script>");
		return new ModelAndView("redirect:/admin_member_list");
	}//admin_member_del()
	
	@RequestMapping("/admin_member_reg")
	public String admin_member_reg(Model m) {
		m.addAttribute("code", "null");
		return "admin/adMember_register";
	}
	//관리자에서 회원정보 등록
	@RequestMapping("/admin_member_reg_ok")
	public void admin_member_reg(@ModelAttribute MemberVO m, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		adminMemberService.register(m);
		out.println("<script>");
		out.println("alert('가입 완료!');");
		out.println("location='/admin_member_list';");
		out.println("</script>");
	}
}
