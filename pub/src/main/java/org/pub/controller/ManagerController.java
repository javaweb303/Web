package org.pub.controller;

import java.util.ArrayList;
import java.util.List;

import org.pub.service.FileService;
import org.pub.service.ManagerService;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private FileService fileService;
	
	@RequestMapping("/manager")
	public String page() {
		
		return "manager/manager_page";
	}

	@RequestMapping("/add")
	public String add(Model m,@RequestParam("e_title") String title,@RequestParam("e_author") String author,
			@RequestParam("e_publisher") String publisher,@RequestParam("e_publication_year") String publication_year,@RequestParam("e_group") String group,
			@RequestParam("e_bookimg") MultipartFile img,@RequestParam("e_bookfile") MultipartFile file) {
	
		eBookVO book=new eBookVO();
		book.setE_title(title);
		book.setE_author(author);
		book.setE_publisher(publisher);
		book.setE_publication_year(Integer.parseInt(publication_year));
		book.setE_group(group);
		
		List<MultipartFile> files=new ArrayList<>();
		files.add(img);files.add(file);
		fileService.upload(files,"ebook");
		
		return "/eBook";
	}
}
