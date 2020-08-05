package org.pub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OpenController {
	
	@RequestMapping("/bbs_list")
	public String list() {
		
		return "open/bbs_list";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		
		return "open/faq";
	}
}
