package org.pub.controller;

import java.util.ArrayList;
import java.util.List;

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
	
	@RequestMapping("/eBook")
	public String eBook(Model m) {
		List<eBookVO> list=new ArrayList<>();
		eBookVO ebook=null;
		//List<Integer> file_no=null;
		List<FileListVO> filelist=fileService.getALL_FileList("ebook");//게시판코드에 해당하는 파일 리스트를 불러옴
		int file_no,e_no;
		int count=0;
		String boardcd,ext,filename;
		//System.out.println(filelist);
		for(FileListVO vo:filelist) {
			file_no=vo.getFile_no();
			FileVO fileVO=fileService.getFile(file_no);
			filename=fileVO.getStored_file_name();
			ext=filename.substring(filename.lastIndexOf('.'),filename.length());
			if(ext.equals(".jpg") || ext.equals(".png") || ext.equals(".jpeg")) {
				e_no=vo.getE_no();
				ebook=eBookService.getEbook(e_no);
				String d_y=filename.substring(0, 4);
				String d_m=filename.substring(4, 6);
				String d_d=filename.substring(6, 8);
				fileVO.setY(d_y);
				fileVO.setM(d_m);
				fileVO.setD(d_d);
				ebook.setImg_file(fileVO);
				list.add(ebook);
				count++;
			}else {
				ebook=(eBookVO)list.get(count-1);
				ebook.setFile(fileVO);
			}
		}
		
		m.addAttribute("list", list);//책정보
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
	public ResponseEntity<String> reply_add(@RequestParam ReplyVO vo){
		ResponseEntity<String> entity=null;
		try {
			replyService.reply_add(vo);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value ="/reply_getlist/{e_no}",method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> reply_getlist(@PathVariable("e_no") int e_no){
		ResponseEntity<List<ReplyVO>> entity=null;
		try {
			entity = new ResponseEntity<List<ReplyVO>>(replyService.reply_getlist(e_no),HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/reply_del")
	public ResponseEntity<String> reply_del(@RequestParam ReplyVO vo){
		ResponseEntity<String> entity=null;
		try {
			replyService.reply_del(vo);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/search_ebook")
	public ResponseEntity<List<eBookVO>> search_ebook(@RequestBody String json){
		ResponseEntity<List<eBookVO>> entity=null;
		JSONObject obj = JSONObject.fromObject(json);
		String search_text=obj.getString("search_text");//넘겨준 검색값 해당변수에 넣기
		String search_group=obj.getString("theme");
		String search_option=obj.getString("search_menu");
		//맵으로 값넘겨서 해당 값에 해당하는 파일을 가져오는걸루.
		System.out.println(search_text);
		System.out.println(search_group);
		System.out.println(search_option);
		try {
			//eBookService.getsearch_ebook();
			entity=new ResponseEntity<>(HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}






















