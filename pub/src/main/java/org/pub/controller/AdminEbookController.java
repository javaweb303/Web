package org.pub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pub.service.AdminEbookService;
import org.pub.util.Add_EBook;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminEbookController {

	@Autowired
	private AdminEbookService adminEbookService;
	@Autowired
	private Add_EBook add_ebook;
	
	@RequestMapping("/admin_ebook_reg")
	public String admin_ebook_reg(Model list, HttpServletResponse response, eBookVO eb, HttpServletRequest request) {
		List<eBookVO> elist = this.adminEbookService.getEbookList(eb);
		list.addAttribute("elist", elist);
		return "admin/adEbook_register";
	}
	
	@RequestMapping("/Load_UI")
	public void UI() {
		add_ebook.UI();
	}
}
