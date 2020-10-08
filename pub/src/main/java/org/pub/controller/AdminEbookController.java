package org.pub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pub.service.AdminEbookService;
import org.pub.service.eBookService;
import org.pub.util.Add_EBook;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import sun.net.www.protocol.http.logging.HttpLogFormatter;

@Controller
public class AdminEbookController {

	@Autowired
	private AdminEbookService adminEbookService;
	@Autowired
	private Add_EBook add_ebook;
	
	@RequestMapping("/admin_ebook_reg")
	public String admin_ebook_reg(Model list, HttpServletResponse response, eBookVO eb, HttpServletRequest request) {
		
		 int page=1;//쪽번호
		 int limit=7;//한페이지에 보여지는 목록 개수
		 if(request.getParameter("page") != null) {//get으로 전달된 쪽번호가 있다면
			 page=Integer.parseInt(request.getParameter("page"));
		 }
		 String searchKeyword = request.getParameter("searchKeyword");
		 String searchCondition = request.getParameter("searchCondition");
		 System.out.println("keyword: "+searchKeyword);
		 System.out.println("category: "+searchCondition);
		 eb.setSearchKeyword("%"+searchKeyword+"%");
		 eb.setSearchCondition(searchCondition);
		
		int listcount = this.adminEbookService.getEbookListCount(eb);
		
		eb.setStartrow((page-1)*7+1);
		eb.setEndrow(eb.getStartrow()+limit-1);
		
		List<eBookVO> elist = this.adminEbookService.getEbookList(eb);
		//총 페이지 수 
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		
		list.addAttribute("elist", elist);
		list.addAttribute("page", page);//쪽번호
		list.addAttribute("startpage", startpage);//시작페이지
		list.addAttribute("endpage", endpage);//끝페이지
		list.addAttribute("maxpage", maxpage);//총페이지
		list.addAttribute("listcount", listcount); //검색 전후 회원수
		list.addAttribute("searchKeyword", searchKeyword);//검색어
		list.addAttribute("searchCondition", searchCondition);//검색 필드
		return "admin/adEbook_register";
	}
	
	@RequestMapping("/Load_UI")
	public void UI() {
		add_ebook.UI();
	}
	
	/*
	@RequestMapping("/delBook")
	public String delBook() {
		this.adminEbookService.deleteBook(e_no);//게시물 삭제
	}*/

}
