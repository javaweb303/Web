package org.pub.controller;

import java.util.ArrayList;
import java.util.List;

import org.pub.service.eBookService;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class eBookController {
	@Autowired
	private eBookService eBookService;
	
	@RequestMapping("/eBook")
	public String eBook(Model m) {
		List<eBookVO> list=new ArrayList<>();
		//list = eBookService.recent();
		m.addAttribute("list", list);
		return "ebook/ebook"; 
	}
}
