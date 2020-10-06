package org.pub.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.io.FileUtils;
import org.pub.service.FileService;
import org.pub.service.MemberService;
import org.pub.service.ReplyService;
import org.pub.service.eBookService;
import org.pub.util.PdfFile_Img;
import org.pub.vo.LoanVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Controller
public class eBookController {
	@Autowired
	private eBookService eBookService;
	@Autowired
	private FileService fileService;
	
	@RequestMapping("/mylib")//로그인이 되어있는지 확인
	public ModelAndView MyLibraryCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id!=null) {
			out.println("<script>");
			out.println("alert('내서재로 이동합니다.')");
			out.println("location='/mylibrary'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.')");
			out.println("location='/login'");
			out.println("</script>");
		}
		
		return null;
	}
	
	@RequestMapping("/mylibrary")
	public ModelAndView MyLibrary(HttpSession session) {
		ModelAndView model=new ModelAndView();
		String id=(String)session.getAttribute("id");
		if(id==null) {
			model.setViewName("member/login");
		}else {
			List<LoanVO> loanlist=eBookService.book_LoanList(id);//해당아이디에 해당하는 대출목록을 받아옴
			List<eBookVO> myloanlist=new ArrayList<>();
			//대출목록을 이용해서 파일 이미지를 가져옴 그리고 ebookVO에 해당 이미지 경로를 넣어줌.그리고 전자책 정보를 담아서 념김.
			for(LoanVO loan:loanlist) {
				int eno = loan.getE_no();//대출목록에있는 전자책번호를 저장.
				eBookVO vo=eBookService.getEbook(eno);
				vo.setLoan_date(loan.getLoan_date().substring(0, 10));
				vo.setReturn_date(loan.getReturn_date().substring(0, 10));
				myloanlist.add(vo);
			}//forend
			model.setViewName("redirect:mypage?tab_menu=lib");
			model.addObject("myloanlist", myloanlist);
			System.out.println(myloanlist);
		}
		return model;
	}
	
	@RequestMapping("/read")
	public ModelAndView BookRead(@RequestParam("e_no") int e_no) {
		ModelAndView model=new ModelAndView();
		eBookVO vo = eBookService.getEbook(e_no);
		
		int filecount=fileService.Dir_filecount(vo);
		model.setViewName("ebook/viewer");
		model.addObject("book", vo);
		model.addObject("book_imgfile", filecount);
		
		//fileService.open(path);
		return model;
	}
	//추가
	
	@RequestMapping("/eBook")
	public ModelAndView searchEbook(@RequestParam(required=false)String searchKeyword,HttpServletRequest request) {

		ModelAndView model=new ModelAndView();
		String url;
		eBookVO vo=new eBookVO();
		//검색어가 있으면 책 정보 리스트를 가져옴..
		if(searchKeyword != null) {
		String query = request.getParameter("searchKeyword");
		System.out.println(query);
		vo.setSearchKeyword(query);
		String queryType =request.getParameter("searchCondition");
		System.out.println(queryType);
		vo.setSearchCondition(queryType);
		String categoryId = request.getParameter("searchCa");
		System.out.println(categoryId);
		vo.setSearchCa(categoryId);
		//XML 데이터를 호출할 URL => 알라딘 api 사용
		url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbmys628111103001&Query="+query+"&QueryType="+queryType+"&CategoryId="+categoryId+"&MaxResults=20&start=1&SearchTarget=Book&output=xml&Version=20070901&Cover=Big";

		System.out.println(url);
		model.addObject("query", query);
		model.addObject("queryType", queryType);
		model.addObject("categoryId", categoryId);
		}else {
			url="http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbmys628111103001&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=xml&Version=20131101";
		}
		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열  
		String[] fieldNames ={"title","author","publisher","pubDate","cover","isbn13"};

		String itemsname="item";

		//각 게시물하나에 해당하는 XML 노드를 담을 리스트
		ArrayList<Map> pubList = xmlp(url, fieldNames,itemsname);

		
		model.addObject("pubList", pubList);
		//System.out.println(pubList);
		
		model.setViewName("ebook/srchEbook");
		return model;

	}
	@RequestMapping("/ebookcont")
	public ModelAndView bookcont(@RequestParam("isbn") String isbn,HttpServletRequest request) {
		ModelAndView model=new ModelAndView();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		eBookVO vo=null;
		String loan_status=null;
		vo = eBookService.getEbook(isbn);
		System.out.println(vo);
		if(vo == null) {
			System.out.println("isbn:"+isbn);
			//isbn=isbn.trim();
			String url="http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbmys628111103001&itemIdType=ISBN13&ItemId="+isbn+"&Cover=Big&output=xml&Version=20131101";
			String[] fieldNames ={"title","author","publisher","pubDate","cover","isbn13","description"};
			String itemsname="item";
			ArrayList<Map> pubList = xmlp(url, fieldNames,itemsname);
			System.out.println(pubList);
			for(Map map:pubList) {
				vo=new eBookVO();
				vo.setIsbn((String)map.get("isbn13"));
				vo.setTitle((String)map.get("title"));
				vo.setAuthor((String)map.get("author"));
				vo.setPublisher((String)map.get("publisher"));
				vo.setPublication_year((String)map.get("pubDate"));
				vo.setBook_introduce((String)map.get("description"));
				vo.setImgurl((String)map.get("cover"));
				int no=eBookService.addBook_isbn(vo);
				try {
					InputStream is=new FileInputStream(new File("C:/Users/st473/Downloads/book.pdf"));
					PdfFile_Img pdf = new PdfFile_Img();
					pdf.conversionPdf2Img(is, "ebook", no);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(session.getAttribute("id") != null) {
				String result=eBookService.getRecommand(id,vo.getE_no());
				List<LoanVO> loanlist=eBookService.book_LoanList(id);
				for(LoanVO loan:loanlist) {
					if(loan.getE_no()==vo.getE_no()) {
						loan_status="대출중";
					}
				}
				if(result==null) {
					model.addObject("recommand", "추천");
				}else {
					model.addObject("recommand", "비추천");
				}
			}
			vo = eBookService.getEbook(isbn);
		}else {
			if(session.getAttribute("id") != null) {
				String result=eBookService.getRecommand(id,vo.getE_no());
				List<LoanVO> loanlist=eBookService.book_LoanList(id);
				for(LoanVO loan:loanlist) {
					if(loan.getE_no()==vo.getE_no()) {
						loan_status="대출중";
					}
				}
				if(result==null) {
					model.addObject("recommand", "추천");
				}else {
					model.addObject("recommand", "비추천");
				}
			}
		}
		
		
		model.addObject("book", vo);
		model.addObject("loan_status", loan_status);
		//model.addObject("pubList", pubList);
		model.setViewName("ebook/bookcont");
		return model;
	}
	

public ArrayList<Map> xmlp(String url,String[] fieldNames,String itemsname) {
		ArrayList<Map> pubList= new ArrayList<Map>();
		try {
			//XML파싱 준비 => 페이지에 접근해줄 Document 객체 생성
			//여기서 생성한 document 객체를 통해 파싱할 url의 요소를 읽어들인다.
			DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
			DocumentBuilder b = f.newDocumentBuilder();
			//위에서 구성한 URL을 통해 XMl 파싱 시작
			//System.out.println(url);
			Document doc = b.parse(url);

			//root tag
			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); //Root element : result

			//서버에서 응답한 XML데이터를 (발행문서 1개 해당)태그로 각각 나눔(파라미터로 요청한 size항목의 수만큼)
			//파싱할 정보가 있는 tag에 접근
			NodeList items = doc.getElementsByTagName(itemsname);
			//System.out.println("파싱할 리스트 수: "+items.getLength());//파싱할 리스트수
			System.out.println(itemsname);

			//for 루프시작
			for (int i = 0; i < items.getLength(); i++) {
				//i번째 publication 태그를 가져와서
				Node n = items.item(i);
				//노드타입을 체크함, 노드 타입이 엘리먼트가 아닐경우에만 수행
				if (n.getNodeType() != Node.ELEMENT_NODE)
					continue;

				Element e = (Element) n;
				HashMap<String,Object> pub = new HashMap<>();
				//for 루프 시작
				for(String name : fieldNames){
					//fieldNames에 해당하는 값을 XML 노드에서 가져옴
					NodeList titleList = e.getElementsByTagName(name);
					Element titleElem = (Element) titleList.item(0);
					//System.out.println(titleElem);
					Node titleNode = titleElem.getChildNodes().item(0);
					// 가져온 XML 값을 맵에 엘리먼트 이름 - 값 쌍으로 넣음

					pub.put(name, titleNode.getNodeValue());
				}
				//데이터가 전부 들어간 맵을 리스트에 넣고 화면에 뿌릴 준비.
				pubList.add(pub);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pubList;
	}
}

@RestController
class Rest{
	@Autowired
	private eBookService eBookService;
	@Autowired
	private MemberService memberService;
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
	
	@RequestMapping("/book_loan")//대출
	public ResponseEntity<String> book_loan(HttpServletRequest request,HttpSession session,@RequestParam("e_no") int e_no) throws ParseException{
		ResponseEntity<String> entity=null;
		if(session.getAttribute("id") == null) {
			entity=new ResponseEntity<String>("noLogin",HttpStatus.OK);
		}else {
			String over=memberService.getOverDue((String)session.getAttribute("id"));
			SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
			String time = format.format(new Date());
			Date Date2=format.parse(time);
			Long calOverDate=(long) 0;
        	if(over != null) {
        		Date overdate=format.parse(over);
        		calOverDate=Date2.getTime()-overdate.getTime();
        		System.out.println(Date2);
        		System.out.println(overdate);
        	}
        	long calDateDays = calOverDate / ( 24*60*60*1000);
        	System.out.println("연체"+calDateDays);
        	if(calDateDays >= 0) {
				try {
					eBookService.book_Loan((String)session.getAttribute("id"),e_no);//서비스에서 vo에 담을예정.그후에 추가.
					entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
				}catch (Exception e) {
					e.printStackTrace();
					entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
				}
        	}else {
        		try {
					entity=new ResponseEntity<String>(Long.toString(Math.abs(calDateDays)),HttpStatus.OK);
				}catch (Exception e) {
					e.printStackTrace();
					entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
				}
        	}
		}
		
		return entity;
	}
	
	@RequestMapping("/book_return")//쿼리에서 반납날짜랑 반납예정일 비교해서 하면 더빠른가..?
	public ResponseEntity<String> book_return(HttpServletRequest request,HttpSession session,@RequestParam("e_no") int e_no) throws ParseException{
		ResponseEntity<String> entity=null;
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");//데이터타입 년월일로 출력형식변경 하기위한
		String time = format.format(new Date());//현재시간을 담음
		if(session.getAttribute("id") == null) {
			entity=new ResponseEntity<String>("noLogin",HttpStatus.OK);
		}else {		
			try {
				int state=2;//반납 상태 2 = 정상 반납, 3 = 연체됨.
				String date=eBookService.getReturnDate((String)session.getAttribute("id"),e_no);//반납일을 가져옴
				Long calOverDate=(long) 0;
				Date receiveDate=format.parse(date);//String을 date형식으로 변환 해당형식으로 변환
				Date Now=format.parse(time);
				long calDate=Now.getTime()-receiveDate.getTime();//시간 계산
				System.out.println(receiveDate);
				long calDateDays = calDate / ( 24*60*60*1000); //일자 구하는
				//calDateDays+=10;
		        //calDateDays = Math.abs(calDateDays);
		        System.out.println(calDateDays);//3일이 초과됨
		        if(calDateDays > 0) {//0보다 크면 아래 문장 실행
		        	System.out.println("연체됨");
		        	state=3;
		        	String over=memberService.getOverDue((String)session.getAttribute("id"));
		        	if(over != null) {
		        		Date overdate=format.parse(over);
		        		calOverDate=overdate.getTime()-Now.getTime();//남은 연체기간 계산?
		        	}
		        	long overDateDays = calOverDate / ( 24*60*60*1000);
		        	System.out.println("연체일 "+overDateDays);
		        	if(overDateDays > 0) {
		        		int days=(int)(overDateDays+calDateDays);
		        		System.out.println("계산도ㅣㄴ"+days);
		        		memberService.setOverDue((String)session.getAttribute("id"),(int)(overDateDays+calDateDays));
		        	}else {
		        		memberService.setOverDue((String)session.getAttribute("id"),(int)calDateDays);
		        	}
		        }
				eBookService.book_Return((String)session.getAttribute("id"),e_no,state);//서비스에서 vo에 담을예정.그후에 추가.
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}
	
	@RequestMapping("/book_loancount")//사용자가 대출한 개수
	public ResponseEntity<String> book_loancount(HttpServletRequest request,HttpSession session){
		ResponseEntity<String> entity=null;
		if(session.getAttribute("id") == null) {
			entity=new ResponseEntity<String>("noLogin",HttpStatus.OK);
		}else {		
			try {
				int loancount=eBookService.book_Loancount((String)session.getAttribute("id"));
				entity=new ResponseEntity<String>(""+loancount,HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}

}






















