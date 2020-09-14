package org.pub.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.service.FileService;
import org.pub.service.ReplyService;
import org.pub.service.eBookService;
import org.pub.vo.FileListVO;
import org.pub.vo.FileVO;
import org.pub.vo.ReplyVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.sf.json.JSONObject;

@Controller
public class eBookController {
	@Autowired
	private eBookService eBookService;
	@Autowired
	private FileService fileService;
	@Autowired
	private ReplyService replyService;

	public String themechk(String themeval) {
		String theme = null;
		switch (themeval) {
		case "1":
			theme="";//컴퓨터/IT
		case "2":
			theme="";//교양/심리
		case "3":
			theme="";//철학/종교
		case "4":
			theme="";//사회
		case "5":
			theme="";//자연/기술과학
		case "6":
			theme="";//문화/예술
		case "7":
			theme="";//가정/생활
		case "8":
			theme="";//취미/여행
		case "9":
			theme="";//언어/외국어
		case "10":
			theme="";//문학
		case "11":
			theme="";//역사
		case "12":
			theme="";//유아/어린이
		default:
			theme=null;
		}
		return theme;
	}
	@RequestMapping("/eBook")
	public String eBook(Model m,HttpServletRequest request,@RequestParam(value="page", defaultValue = "1") int pageNum,@ModelAttribute eBookVO vo) {
		List<eBookVO> list=new ArrayList<>();
		eBookVO ebook=null;
		//
		int page=1;
		int limit=10;//한페이지 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		String find_theme=request.getParameter("theme");//테마
		String find_name=request.getParameter("inputbox");//검색어
		String find_field=request.getParameter("search_menu");//검색필드
		if(find_theme==null) {
			find_theme="0";
		}
		
		vo.setFind_field(find_field);
	    vo.setFind_name("%"+find_name+"%");
	    vo.setFind_theme(themechk(find_theme));
		
	    System.out.println("테마 : "+find_theme+"\n검색필드  : "+find_field+"\n검색어 :  "+find_name);
	    
		vo.setStartrow((page-1)*10+1);//시작행
		vo.setEndrow(vo.getStartrow()+limit-1);//끝행
		
		List<eBookVO> eblist=eBookService.getebookList(vo);
		
		//System.out.println(eblist);
		for(eBookVO book:eblist) {
			int no=book.getE_no();
			List<FileListVO> fileLists = fileService.get_e_no_file(no);
			for(FileListVO filelistvo:fileLists) {
				int file_no = filelistvo.getFile_no();
				int book_no = filelistvo.getE_no();
				if(no==book_no) {
					FileVO file=fileService.get_Fileno(file_no);
					String filename=file.getStored_file_name();
					String ext=filename.substring(filename.lastIndexOf('.'),filename.length());
					if(ext.equals(".jpg") || ext.equals(".png") || ext.equals(".jpeg")) {
						String d_y=filename.substring(0, 4);
						String d_m=filename.substring(4, 6);
						String d_d=filename.substring(6, 8);
						file.setY(d_y);
						file.setM(d_m);
						file.setD(d_d);
						book.setImg_file(file);
						list.add(book);
					}else {
						book.setFile(file);
					}
				}
			}
		}
		int ebookcount=eBookService.getebookCount(vo);
		
		//총페이지수
		int maxpage=(int)((double)ebookcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		m.addAttribute("list", list);//책정보
		m.addAttribute("page",page);//책갈피 기능때문에 쪽번호 저장
		m.addAttribute("startpage",startpage);//시작페이지
        m.addAttribute("endpage",endpage);//끝 페이지
        m.addAttribute("maxpage",maxpage);//총페이지
		return "ebook/ebook"; 
	}
	
	@RequestMapping("/ebookcont")//대출여부와 추천 여부를 확인할수 있는 무언가가 필요.
	public String eBookCont(Model m,@RequestParam("ebook_no") int e_no,@RequestParam("img") int img_no,
			@RequestParam("file") int file_no,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(session.getAttribute("id") != null) {
			String result=eBookService.getRecommand(id,e_no);
			if(result==null) {
				m.addAttribute("recommand", "추천");
			}else {
				m.addAttribute("recommand", "비추천");
			}
		}
		eBookVO book=eBookService.getEbook(e_no);
		FileVO imgfile=fileService.getFile(img_no);
		
		String filename=imgfile.getStored_file_name();
		String d_y=filename.substring(0, 4);
		String d_m=filename.substring(4, 6);
		String d_d=filename.substring(6, 8);
		imgfile.setY(d_y);
		imgfile.setM(d_m);
		imgfile.setD(d_d);
		
		book.setImg_file(imgfile);
		book.setFile(fileService.getFile(file_no));

		m.addAttribute("book", book);
		
		return "ebook/ebook_cont"; 
	}
	 
}

@RestController
class Rest{
	@Autowired
	private eBookService eBookService;
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/recommend")//전자책 번호, 세션에 담긴 아이디 필요 -완-
	public ResponseEntity<String> Recommend(@RequestParam("ebook_no") int e_no, HttpServletRequest request,HttpSession session){
		ResponseEntity<String> entity=null;
		if(session.getAttribute("id")==null) {
			entity=new ResponseEntity<String>("noLogin",HttpStatus.OK);
		}else {		
			try {
				String id=(String)session.getAttribute("id");
				eBookService.recommand(id,e_no);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}

		return entity;

	}
	
	@RequestMapping("/non_recommend")
	public ResponseEntity<String> non_Recommend(@RequestParam("ebook_no") int e_no,HttpServletRequest request,HttpSession session){
		ResponseEntity<String> entity=null;
		if(session.getAttribute("id")==null) {
			entity=new ResponseEntity<String>("noLogin",HttpStatus.OK);
		}else {		
			try {
				String id=(String)session.getAttribute("id");
				eBookService.non_recommand(id,e_no);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
		
	}
	
	@RequestMapping("/book_loan")
	public ResponseEntity<String> book_loan(HttpServletRequest request,HttpSession session){
		ResponseEntity<String> entity=null;
		if(session.getAttribute("id") == null) {
			entity=new ResponseEntity<String>("noLogin",HttpStatus.OK);
		}else {		
			try {
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}
	
	@RequestMapping("/reply_add")
	public ResponseEntity<String> reply_add(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity=null;
		System.out.println(vo.getE_no());
		System.out.println(vo.getReply_cont());
		System.out.println(vo.getId());
		try {
			replyService.reply_add(vo);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}






















