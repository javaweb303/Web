package org.pub.controller;

import java.util.ArrayList;
import java.util.List;

import org.pub.service.FileService;
import org.pub.service.ManagerService;
import org.pub.service.eBookService;
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
	@Autowired
	private eBookService ebookService;
	
	@RequestMapping("/manager")
	public String page() {
		
		return "manager/manager_page";
	}

	@RequestMapping("/add")
	public String add(Model m,@RequestParam("e_title") String title,@RequestParam("e_author") String author,
			@RequestParam("e_publisher") String publisher,@RequestParam("e_publication_year") String publication_year,@RequestParam("e_introduce") String introduce,@RequestParam("e_group") String group,
			@RequestParam("e_bookimg") MultipartFile img,@RequestParam("e_bookfile") MultipartFile file) {
	
		eBookVO book=new eBookVO();
		book.setE_title(title);
		book.setE_author(author);
		book.setE_publisher(publisher);
		book.setE_publication_year(Integer.parseInt(publication_year));
		book.setE_introduce(introduce);
		book.setE_group(group);
		System.out.println(book.getE_title());
		int bookno=ebookService.addBook(book);//전자책 등록
		
		List<MultipartFile> files=new ArrayList<>();
		files.add(img);files.add(file);
		List<Integer> file_no=fileService.upload(files);
		
		fileService.addFiles(bookno,file_no,"ebook");//bookno에 해당하는 파일번호,게시판코드를 디비에 저장하는
		
		//List<Integer> files_no=fileService.upload(files,"ebook");
		//ebookService.upload(book,"ebook",files_no);
		
		return "/ebook";
	}
}
