package org.pub.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.service.OpenService;
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
public class OpenController {
	@Autowired
	private OpenService openService;


	@RequestMapping("/bbs_list")
	public String list(@ModelAttribute GongjiVO g, Model listM, HttpServletRequest request,
			HttpServletResponse response) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();

		int page=1;//쪽번호
		int limit=7;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색
		//필드
		g.setFind_field(find_field);
		g.setFind_name("%"+find_name+"%");
		//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
		//매핑 대응

		int listcount=
				this.openService.getListCount(g);
		//전체 레코드 개수 또는 검색전후 레코드 개수
		//System.out.println("총 게시물수:"+listcount+"개");

		g.setStartrow((page-1)*7+1);//시작행번호
		g.setEndrow(g.getStartrow()+limit-1);//끝행번호

		List<GongjiVO> glist=
				this.openService.getGongjiList(g);
		//목록

		//총페이지수
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;

		listM.addAttribute("glist",glist);
		//glist 키이름에 값 저장
		listM.addAttribute("page",page);
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
		listM.addAttribute("listcount",listcount);	
		listM.addAttribute("find_field",find_field);
		listM.addAttribute("find_name", find_name);
		return "open/gongji_list";
	}

	//공지 내용보기
	@RequestMapping("/gongji_cont")
	public ModelAndView gongji_cont(
			@RequestParam("gongji_no") int gongji_no)
	{
		GongjiVO g=this.openService.getGCont(gongji_no);
		String g_cont=g.getGongji_cont().replace("\n","<br/>");

		ModelAndView gm=new ModelAndView("open/gongji_cont");
		gm.addObject("g",g);
		gm.addObject("g_cont",g_cont);
		return gm;


	}//gongji_cont()

	@RequestMapping("/faq")
	public String faq(Model faq, HttpServletRequest request, @ModelAttribute FaqContentVO f, @RequestParam(required=false)String displayCd) {
		System.out.println(displayCd);
		int page=1;
		int limit=6;
		int chkCId;
		if(displayCd != null) {
			chkCId = Integer.parseInt(displayCd);
			}else {
				chkCId=100;
			}
		if(request.getParameter("page")!=null) {
         page=Integer.parseInt(request.getParameter("page"));}
		 f.setStartrow((page-1)*6+1);
		 f.setEndrow(f.getStartrow()+limit-1);
		 f.setChkCId(chkCId);
        
		int totalCount=this.openService.getTotalFaqCount(chkCId);
		List<FaqContentVO> flist=this.openService.getFaqList(f);
		 int maxpage=(int)((double)totalCount/limit+0.95);
		 int startpage=(((int)((double)page/6+0.9))-1)*6+1;
         int endpage=maxpage;
         if(endpage>startpage+6-1) endpage=startpage+6-1;
         faq.addAttribute("totalCount", totalCount);
         faq.addAttribute("flist", flist);
         System.out.println(flist);
         //request.setAttribute("flist", flist);
         faq.addAttribute("startpage",startpage);
         faq.addAttribute("endpage",endpage);
         faq.addAttribute("maxpage",maxpage);
         faq.addAttribute("page",page);
         faq.addAttribute("chkCId", chkCId);
            return "open/faq";
	} //faq()
	
}
