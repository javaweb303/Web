package org.pub.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@RequestMapping("/adIndex")
	public String adIndex(HttpServletResponse response, HttpSession session) throws Exception {
			
		return "admin/adIndex";
		
	}//adIndex()
}
