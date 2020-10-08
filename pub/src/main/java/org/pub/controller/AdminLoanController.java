package org.pub.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.service.AdminLoanService;
import org.pub.vo.LoanVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/*")
public class AdminLoanController {

	@Autowired
	private AdminLoanService adminLoanService;
	
	@RequestMapping("/admin_loan")
	private String adLoan(@RequestParam(required = false)String id, Model m, HttpServletRequest request,
			HttpServletResponse response )throws Exception{
		HttpSession session=request.getSession();
		
		System.out.println("id:"+id);
		if(id == null) {
			id=(String)session.getAttribute("id"); 
		}
		MemberVO mem = this.adminLoanService.getMem(id);
		List<LoanVO> lolist = this.adminLoanService.getLoan(id);
		List<eBookVO> elist = this.adminLoanService.getEbookList(id);
		List<eBookVO> relist = this.adminLoanService.getReturn(id);
		eBookVO ebook = this.adminLoanService.getEbook(id);
		//System.out.println("전자책 번호 :"+loan.get(4));
		//eBookVO ebook = this.adminLoanService.getEbook(loan.get(4));
		//eBookVO eBook = this.adminLoanService.getEbook();
		m.addAttribute("mem", mem);
		m.addAttribute("lolist", lolist);
		System.out.println(lolist);
		m.addAttribute("elist", elist);
		m.addAttribute("ebook",ebook);
		m.addAttribute("relist", relist);
		return "/admin/adLoan";
	}
	@RequestMapping("/admin_return")
	public ModelAndView admin_return(String e_no, String id) throws Exception{
		this.adminLoanService.delB(e_no);
		System.out.println("id:"+id);
		return new ModelAndView("redirect:/admin/admin_loan?id="+id);
	}
}
