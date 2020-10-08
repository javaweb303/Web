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
	@RequestMapping("/admin/admin_member_list")
	public String admin_member_list(Model listM, HttpServletResponse response, MemberVO m, HttpServletRequest request) throws Exception{
		
		int page=1;//쪽번호
		int limit=7;//한페이지에 보여지는 목록 개수
		if(request.getParameter("page") != null) { //get으로 전달된 쪽번호가 있다면
			page=Integer.parseInt(request.getParameter("page"));//쪽번호를 정수 숫자로 변경해서 변수에 저장
		}
		
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드
		m.setFind_field(find_field);
		m.setFind_name("%"+find_name+"%");
		
		int listcount = this.adminMemberService.getListCount(m);//전체 레코드 개수 또는 검색전후 레코드 개수
		
		m.setStartrow((page-1)*7+1);//시작행 번호
		m.setEndrow(m.getStartrow()+limit-1);//끝행 번호
		
		List<MemberVO> blist = this.adminMemberService.getMemberList(m);
		
		//총페이지 수
		int maxpage=(int)((double)listcount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		listM.addAttribute("blist", blist);
		listM.addAttribute("page", page);
		listM.addAttribute("startpage", startpage);
		listM.addAttribute("endpage", endpage);
		listM.addAttribute("maxpage", maxpage);
		listM.addAttribute("listcount", listcount);
		listM.addAttribute("find_field", find_field);
		listM.addAttribute("find_name", find_name);
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
	@RequestMapping("/admin/admin_member_edit")
	public String admin_member_edit(MemberVO m, HttpServletRequest request, HttpServletResponse response) throws
	Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		this.adminMemberService.editM(m);//회원정보 수정
		out.println("<script>");
		out.println("alert('회원정보 수정');");
		out.println("location='/admin_member_info?state=info&id="+m.getId()+"';");
		out.println("</script>");
		return null;
	}//admin_member_edit()
	
	//관리자에서 회원정보 삭제
	@RequestMapping("/admin/admin_member_del")
	public ModelAndView admin_member_del(String id, int page) throws Exception{
		this.adminMemberService.delM(id);
		return new ModelAndView("redirect:/admin/admin_member_list").addObject("page", page);
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
		out.println("location='/admin/admin_member_list';");
		out.println("</script>");
	}
}
