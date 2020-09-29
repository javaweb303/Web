package org.pub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.pub.service.ReplyService;
import org.pub.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/reply_getList")
	public ModelAndView reply(Model m,HttpServletRequest request,@ModelAttribute ReplyVO replyVO, @RequestParam("e_no") int e_no,@RequestParam(value="page", required=false, defaultValue="1") int page){
		ModelAndView model=new ModelAndView();
		//int page=1;
		int limit=10;
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		replyVO.setE_no(e_no);
		replyVO.setStartrow((page-1)*10+1);
		replyVO.setEndrow(replyVO.getStartrow()+limit-1);
		
		List<ReplyVO> list=replyService.reply_getlist(replyVO);
		int ReplyCount=replyService.getReplyCount(e_no);
		
		int maxpage=(int)((double)ReplyCount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		model.setViewName("ebook/reply_box");
		model.addObject("list", list);
		model.addObject("page", page);
		model.addObject("maxpage", maxpage);
		model.addObject("startpage", startpage);
		model.addObject("endpage", endpage);
		model.addObject("e_no", e_no);
		
		return model;
	}

}

@RestController
class reply_Rest{
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/replyDel")
	public ResponseEntity<String> replydel(@RequestParam("r_no") int r_no){
		ResponseEntity<String> entity=null;
		try {
			replyService.reply_del(r_no);
			entity=new ResponseEntity<String>("OK",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/replyEdit")
	public ResponseEntity<String> replyedit(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity=null;
		try {
			replyService.reply_edit(vo);
			entity=new ResponseEntity<String>("OK",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/getreply")
	public ResponseEntity<ReplyVO> getreply(@RequestParam("r_no") int r_no){
		ResponseEntity<ReplyVO> entity=null;
		try {
			entity=new ResponseEntity<ReplyVO>(replyService.reply_get(r_no),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/reply_add")
	public ResponseEntity<String> reply_add(@RequestBody ReplyVO vo){
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
}
