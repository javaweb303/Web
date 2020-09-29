package org.pub.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pub.service.AdminOpenService;
import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminOpenController {

	@Autowired
	private AdminOpenService adminOpenService;
	
	//관리자 공지 목록
	@RequestMapping("/admin_bbs_list")
	public String admin_bbs_list(@ModelAttribute GongjiVO g, Model listM, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int listcount = this.adminOpenService.getListCount(g);
		List<GongjiVO> glist = this.adminOpenService.getGongjiList(g);
		
		listM.addAttribute("glist", glist);
		listM.addAttribute("listcount", listcount);
		
		return "admin/adBbs_list";
		
	} //admin_bbs_list()
	
	//관리자 공지 수정과 상세 정보
	@RequestMapping("/admin_gongji_cont")
	public String admin_gongji_cont(Model cm, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("no") int no, @RequestParam("state") String state) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		GongjiVO g = this.adminOpenService.getGongjiCont(no);
		String g_cont=g.getGongji_cont().replace("\n", "<br/>"); //textarea영역에서 엔터키 친 부분을 다음줄로 줄바꿈
		
		cm.addAttribute("g", g);
		cm.addAttribute("g_cont", g_cont);
		
		if(state.equals("cont")) {//내용보기
			return "admin/adBbs_cont";
			
		}else if(state.equals("edit")) {//수정
			return "admin/adBbs_edit";
		}
		return null;
	}//admin_gongji_cont()
	
	//관리자 공지 수정 완료
	@RequestMapping("/admin_gongji_edit_ok")
	public ModelAndView admin_gongji_edit_ok(GongjiVO g, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		this.adminOpenService.editGongji(g);//공지 수정
		return new ModelAndView("redirect:/admin_bbs_list");
	}//admin_gongji_edit_ok()
	
	//관리자 공지 삭제
	@RequestMapping("/admin_gongji_del")
	public String admin_gongji_del(@RequestParam("no") int no, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		this.adminOpenService.delG(no);//공지 삭제
		return "redirect:/admin_bbs_list";
	}//admin_gongji_del()
	
	//관리자 faq 목록
	@RequestMapping("/admin_faq_list")
	public String admin_faq_list(@ModelAttribute FaqContentVO f, Model list, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int listcount = this.adminOpenService.getFaqListCount(f);
		List<FaqContentVO> flist = this.adminOpenService.getFaqList(f);
		list.addAttribute("flist", flist);
		list.addAttribute("listcount", listcount);
		return "admin/adFaq_list";
		
	}//admin_faq_list()
	
	//관리자 공지 수정과 상세 정보
		@RequestMapping("/admin_faq_cont")
		public String admin_faq_cont(Model cm, HttpServletRequest request, HttpServletResponse response,
				@RequestParam("no") int no, @RequestParam("state") String state) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			FaqContentVO f = this.adminOpenService.getFaqCont(no);
			String f_cont=f.getAnswer().replace("\n", "<br/>"); //textarea영역에서 엔터키 친 부분을 다음줄로 줄바꿈
			
			cm.addAttribute("f", f);
			cm.addAttribute("f_cont", f_cont);
			
			if(state.equals("cont")) {//내용보기
				return "admin/adFaq_cont";
				
			}else if(state.equals("edit")) {//수정
				return "admin/adFaq_edit";
			}
			return null;
		}//admin_faq_cont()
		
		//관리자 공지 수정 완료
		@RequestMapping("/admin_faq_edit_ok")
		public ModelAndView admin_faq_edit_ok(FaqContentVO f, HttpServletRequest request,
				HttpServletResponse response) throws Exception{
			System.out.println("controller:"+f.getQuestion());
			this.adminOpenService.editFaq(f);//공지 수정
			return new ModelAndView("redirect:/admin_faq_list");
		}//admin_faq_edit_ok()
}
