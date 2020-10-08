package org.pub.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.pub.service.PubService;
import org.pub.util.XML_Parsing;
import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Controller
public class PubController {
	@Autowired
	private PubService pubService;
	
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		
		List<GongjiVO> glist=this.pubService.getList();
		//XML 데이터를 호출할 URL
		String new_url ="http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbmys628111103001&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big";
		String popular_url ="http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbmys628111103001&QueryType=Bestseller&MaxResults=20&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big";
		String recomm_url ="http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbmys628111103001&QueryType=ItemEditorChoice&MaxResults=10&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big&CategoryId=1230";
		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열 
		String[] fieldNames ={"title","author","publisher","pubDate","cover","isbn13"};
		String itemsname="item";
		XML_Parsing xml = new XML_Parsing();
		//각 게시물하나에 해당하는 XML 노드를 담을 리스트
		ArrayList<Map> new_List=xml.xmlp(new_url, fieldNames, itemsname);
		ArrayList<Map> popular_List= xml.xmlp(popular_url, fieldNames, itemsname);
		ArrayList<Map> recomm_List= xml.xmlp(recomm_url, fieldNames, itemsname);
		
		ModelAndView m=new ModelAndView();
		m.setViewName("index");
		m.addObject("newList", new_List);
		m.addObject("popularList", popular_List);
		m.addObject("recommList", recomm_List);
		m.addObject("glist", glist);
		return m;
	}
}
