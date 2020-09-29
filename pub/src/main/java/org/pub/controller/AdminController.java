package org.pub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/adIndex")
	public String adIndex() {
		return "admin/adIndex";
	}
}
