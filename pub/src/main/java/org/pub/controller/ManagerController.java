package org.pub.controller;

import org.pub.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/manager")
	public String page() {
		
		return "manager/manager_page";
	}
}
