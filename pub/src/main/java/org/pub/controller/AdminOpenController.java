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
	//관리자 공지 작성
	@RequestMapping("/admin_gongji_write")
	public ModelAndView admin_gongji_write(Model m, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}

		m.addAttribute("page",page);
		ModelAndView gw=new ModelAndView("admin/adBbs_write");
		return gw;
	}

	//관리자 공지 저장
	@RequestMapping("/admin_gongji_write_ok")
	public String admin_gongji_write_ok(GongjiVO g, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		this.adminOpenService.insertG(g);//공지 저장
		return "redirect:/admin_bbs_list";
	}

	//관리자 공지 목록
	@RequestMapping("/admin_bbs_list")
	public String admin_bbs_list(@ModelAttribute GongjiVO g, Model listM, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		int page=1;
		int limit=7;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드
		//System.out.println("검색어:"+find_name);
		//System.out.println("검색필드:"+find_field);
		g.setFind_field(find_field);
		g.setFind_name("%"+find_name+"%");

		int listcount = this.adminOpenService.getListCount(g);

		g.setStartrow((page-1)*7+1);//시작행번호
		g.setEndrow(g.getStartrow()+limit-1);//끝행번호

		List<GongjiVO> glist = this.adminOpenService.getGongjiList(g);

		//총페이지수
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;


		listM.addAttribute("glist", glist);
		listM.addAttribute("page",page);
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
		listM.addAttribute("listcount", listcount);
		listM.addAttribute("find_field", find_field);
		listM.addAttribute("find_name", find_name);

		return "admin/adBbs_list";

	} //admin_bbs_list()

	//관리자 공지 수정과 상세 정보
	@RequestMapping("/admin_gongji_cont")
	public String admin_gongji_cont(Model cm, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("no") int no, @RequestParam("state") String state) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));		
		}

		GongjiVO g = this.adminOpenService.getGongjiCont(no);
		String g_cont=g.getGongji_cont().replace("\n", "<br/>"); //textarea영역에서 엔터키 친 부분을 다음줄로 줄바꿈

		cm.addAttribute("g", g);
		cm.addAttribute("g_cont", g_cont);
		cm.addAttribute("page",page);


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

	
	//관리자 faq 작성
	@RequestMapping("/admin_faq_write")
	public ModelAndView admin_faq_write(Model m, HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out= response.getWriter();
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}

		m.addAttribute("page",page);
		ModelAndView fw=new ModelAndView("admin/adFaq_write");
		return fw;
	}
	
	//관리자 faq 저장
		@RequestMapping("/admin_faq_write_ok")
		public String admin_faq_write_ok(FaqContentVO f, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			System.out.println("cid:"+f.getCId());
			this.adminOpenService.insertF(f);//공지 저장
			return "redirect:/admin_faq_list";
		}
	
	//관리자 faq 목록
	@RequestMapping("/admin_faq_list")
	public String admin_faq_list(@ModelAttribute FaqContentVO f, Model list, HttpServletRequest request,
			HttpServletResponse response) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		int page=1;
		int limit=7;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드

		f.setFind_field(find_field);
		f.setFind_name("%"+find_name+"%");

		int listcount = this.adminOpenService.getFaqListCount(f);

		f.setStartrow((page-1)*7+1);//시작행번호
		f.setEndrow(f.getStartrow()+limit-1);//끝행번호
		List<FaqContentVO> flist = this.adminOpenService.getFaqList(f);

		//총페이지수
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;

		list.addAttribute("flist", flist);
		list.addAttribute("page",page);
		list.addAttribute("startpage",startpage);
		list.addAttribute("endpage",endpage);
		list.addAttribute("maxpage",maxpage);
		list.addAttribute("listcount", listcount);

		list.addAttribute("find_field", find_field);
		list.addAttribute("find_name", find_name);

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
