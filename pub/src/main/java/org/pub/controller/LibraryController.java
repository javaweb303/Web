package org.pub.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


@Controller
public class LibraryController {

	@RequestMapping("/search")
	public String search() {

		return "library_services/srchBook";

	}
	@RequestMapping("/detail")
	public ModelAndView detail(HttpServletRequest request) {

		String query = request.getParameter("searchKeyword");
		System.out.println(query);
				
		
		//XML 데이터를 호출할 URL
		String url = "http://book.interpark.com/api/search.api?key=775CEC07D96BC2F595FF0721F61795ED217DE9FE1D0B1B223D27C3289CDB65E1&query="+query+"&inputEncoding=utf-8";

		System.out.println(url);
		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열  
		String[] fieldNames ={"title","publisher","pubDate","coverLargeUrl","isbn"};
		
		String itemsname="item";

		//각 게시물하나에 해당하는 XML 노드를 담을 리스트
		ArrayList<Map> pubList = xmlp(url, fieldNames,itemsname);

		ModelAndView model=new ModelAndView();
		model.addObject("pubList", pubList);
		System.out.println(pubList);
		model.setViewName("library_services/detailBook");
		return model;

	}
	

	@RequestMapping("/new")
	public ModelAndView newBook() {

		//XML 데이터를 호출할 URL
		String url = "http://book.interpark.com/api/newBook.api?key=775CEC07D96BC2F595FF0721F61795ED217DE9FE1D0B1B223D27C3289CDB65E1&categoryId=100&output=xml";

		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열  
		String[] fieldNames ={"title","publisher","pubDate","coverLargeUrl","isbn"};

		String itemsname="item";

		//각 게시물하나에 해당하는 XML 노드를 담을 리스트
		ArrayList<Map> pubList = xmlp(url, fieldNames,itemsname);

		ModelAndView model=new ModelAndView();
		model.addObject("pubList", pubList);
		model.setViewName("library_services/newBook");
		return model;
	}

	@RequestMapping("/popular")
	public ModelAndView popular() {
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		String end=dateFormat.format(cal.getTime());
		cal.add(Calendar.MONTH,-5);
		String start=dateFormat.format(cal.getTime());

		//XML 데이터를 호출할 URL
		String url = "http://data4library.kr/api/loanItemSrch?authKey=60ae2adbf5c860435596c14ca52a122889124505a03ee28c41a829ea7185fce0&startDt="+start+"&endDt="+end+"&gender=0&from_age=6&to_age=10&region=11;22&addCode=0&kdc=6&pageNo=1&pageSize=20";


		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열 
		String[] fieldNames ={"bookname","authors","publisher","publication_year","bookImageURL","isbn13"};

		String itemsname="doc";
		//각 게시물하나에 해당하는 XML 노드를 담을 리스트
		ArrayList<Map> pubList = xmlp(url, fieldNames,itemsname);

		ModelAndView model=new ModelAndView();
		model.addObject("pubList", pubList);
		model.setViewName("library_services/popular");
		return model;
	}

	/*@GetMapping("/bookcont")
	public ModelAndView bookcont(HttpServletRequest request) {
		String isbn=request.getParameter("isbn");
		isbn=isbn.trim();
		String url="http://data4library.kr/api/srchDtlList?authKey=60ae2adbf5c860435596c14ca52a122889124505a03ee28c41a829ea7185fce0&isbn13="+isbn+"&loaninfoYN=Y&displayInfo=age";
		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열 
		String[] fieldNames ={"bookname","authors","publisher","publication_year","bookImageURL","isbn","description"};
		String itemsname="book";
		ArrayList<Map> pubList=xmlp(url, fieldNames,itemsname);
		ModelAndView model=new ModelAndView();
		model.setViewName("library_services/bookcont");
		model.addObject("pubList", pubList);
		return model;
	}*/

	@RequestMapping("/recomm")
	public ModelAndView recomm() {

		//XML 데이터를 호출할 URL
		String url = "http://book.interpark.com/api/recommend.api?key=775CEC07D96BC2F595FF0721F61795ED217DE9FE1D0B1B223D27C3289CDB65E1&categoryId=100&output=xml";

		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열  
		String[] fieldNames ={"title","author","publisher","pubDate","coverLargeUrl","isbn"};

		String itemsname="item";

		//각 게시물하나에 해당하는 XML 노드를 담을 리스트
		ArrayList<Map> pubList = xmlp(url, fieldNames,itemsname);

		ModelAndView model=new ModelAndView();
		model.addObject("pubList", pubList);
		model.setViewName("library_services/recBook");
		return model;
	}



	public ArrayList<Map> xmlp(String url,String[] fieldNames,String itemsname) {
		ArrayList<Map> pubList= new ArrayList<Map>();
		try {
			//XML파싱 준비
			DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
			DocumentBuilder b = f.newDocumentBuilder();
			//위에서 구성한 URL을 통해 XMl 파싱 시작
			Document doc = b.parse(url);
			doc.getDocumentElement().normalize();
			
			//서버에서 응답한 XML데이터를 publication(발행문서 1개 해당)태그로 각각 나눔(파라미터로 요청한 size항목의 수만큼)
			NodeList items = doc.getElementsByTagName(itemsname);
			System.out.println(url);
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

					Node titleNode = titleElem.getChildNodes().item(0);
					// 가져온 XML 값을 맵에 엘리먼트 이름 - 값 쌍으로 넣음
					//System.out.println(titleNode.getNodeValue());
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
