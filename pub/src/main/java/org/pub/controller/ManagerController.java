package org.pub.controller;

import org.pub.service.FileService;
import org.pub.service.ManagerService;
import org.pub.service.eBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		fileService.eBookAddUI();
		return "index";
	}
/*
	@RequestMapping("/add")
	public String add(Model m,@RequestParam("e_title") String title,@RequestParam("e_author") String author,
			@RequestParam("e_publisher") String publisher,@RequestParam("e_publication_year") String publication_year,@RequestParam("e_introduce") String introduce,@RequestParam("e_group") String group,
			@RequestParam("img") MultipartFile img,@RequestParam("book") File file) {
		PdfFile_Img cut=new PdfFile_Img();
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
		System.out.println(file);
		//List<String> li=cut.conversionPdf2Img(new FileInputStream(file), "132");
		//System.out.println(li);
		//fileService.addFiles(bookno,file_no,"ebook");//bookno에 해당하는 파일번호,게시판코드를 디비에 저장하는
		
		//List<Integer> files_no=fileService.upload(files,"ebook");
		//ebookService.upload(book,"ebook",files_no);
		
		return "/ebook";
	}
	
	@RequestMapping("/addd")
	public ModelAndView ad(@RequestParam("file") File file) throws FileNotFoundException {
		ModelAndView model=new ModelAndView();
		PdfFile_Img cut=new PdfFile_Img();
		System.out.println(file);
		List<String> li=cut.conversionPdf2Img(new FileInputStream(file), "132");
		System.out.println(li);
		return model;
	}*/
}
