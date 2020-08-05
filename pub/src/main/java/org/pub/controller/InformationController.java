package org.pub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InformationController {

	@RequestMapping(value="/history")
	public String history() {
			
		return "information/history";
	}
	
	@RequestMapping(value="/guide")
	public String guide() {
		
		return "information/guide";
	}
	
	@RequestMapping(value="/status")
	public String status() {
		
		return "information/status";
	}
	
	@RequestMapping(value="/location")
	public String location() {
		
		return "information/location";
	}
	
}
