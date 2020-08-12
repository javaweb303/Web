package org.pub.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.pub.service.FileService;
import org.pub.service.eBookService;
import org.pub.vo.FileVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class eBookController {
	@Autowired
	private eBookService eBookService;
	@Autowired
	private FileService fileService;
	
	@RequestMapping("/eBook")
	public String eBook(Model m) {
		List<eBookVO> list=new ArrayList<>();
		List<Integer> file_no=null;
		List<FileVO> filelist=null;
		int no=0;
		list = eBookService.select();
		for(eBookVO book:list) {
			filelist=new ArrayList<>();
			file_no=new ArrayList<>();
			String[] sarry=book.getFile_no().split(",");//자른다 ,기준
			for(String str:sarry) {
				no=Integer.parseInt(str);
				file_no.add(no);
			}
			filelist = fileService.getFile(file_no);//번호하나씩 검색해서 리스트에 넣음.
			for(FileVO file:filelist) {
				String filename=file.getStored_file_name();
				String ext=filename.substring(filename.lastIndexOf('.'),filename.length());
				file.setExt(ext);
				String d_y=filename.substring(0, 4);
				String d_m=filename.substring(4, 6);
				String d_d=filename.substring(6, 8);
				file.setY(d_y);
				file.setM(d_m);
				file.setD(d_d);
			}
			book.setFile(filelist);
		}
		m.addAttribute("list", list);//책정보
		return "ebook/ebook"; 
	}
	
	@RequestMapping("/ebookcont")
	public String eBookCont() {
		
		return "ebook/ebook_cont"; 
	}
}
