package org.pub.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


@Controller
public class LibraryController {

	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(required=false)String searchKeyword,HttpServletRequest request) {

		ModelAndView model=new ModelAndView();
		
		//검색어가 있으면 책 정보 리스트를 가져옴..
		if(searchKeyword != null) {
		String query = request.getParameter("searchKeyword");
		System.out.println(query);
		String queryType =request.getParameter("searchCondition");
		System.out.println(queryType);
		String categoryId = request.getParameter("searchCa");
		System.out.println(categoryId);
		//XML 데이터를 호출할 URL => 알라딘 api 사용
		String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbmys628111103001&Query="+query+"&QueryType="+queryType+"&CategoryId="+categoryId+"&MaxResults=20&start=1&SearchTarget=Book&output=xml&Version=20070901&Cover=Big";

		//System.out.println(url);
		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열  
		String[] fieldNames ={"title","author","publisher","pubDate","cover","isbn13"};

		String itemsname="item";

		//각 게시물하나에 해당하는 XML 노드를 담을 리스트
		ArrayList<Map> pubList = xmlp(url, fieldNames,itemsname);

		
		model.addObject("pubList", pubList);
		model.addObject("query", query);
		model.addObject("queryType", queryType);
		model.addObject("categoryId", categoryId);
		//System.out.println(pubList);
		}
		
		model.setViewName("library_services/srchBook");
		return model;

	}

	@RequestMapping("/new")
	public ModelAndView newBook() {

		//XML 데이터를 호출할 URL
		String url = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbmys628111103001&QueryType=ItemNewAll&MaxResults=20&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big";

		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열  
		String[] fieldNames ={"title","author","publisher","pubDate","cover","isbn13"};

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

	@GetMapping("/bookcont")
	public ModelAndView bookcont(HttpServletRequest request) {
		String isbn=request.getParameter("isbn");
		isbn=isbn.trim();
		String url="http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbmys628111103001&itemIdType=ISBN13&ItemId="+isbn+"&output=xml&Cover=Big&Version=20131101";
		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열 
		String[] fieldNames ={"title","author","publisher","pubDate","cover","isbn13","description"};
		String itemsname="item";
		ArrayList<Map> pubList=xmlp(url, fieldNames,itemsname);
		ModelAndView model=new ModelAndView();
		model.setViewName("library_services/bookcont");
		model.addObject("pubList", pubList);
		return model;
	}

	@RequestMapping("/recomm")
	public ModelAndView recomm(HttpServletRequest request) {

		//String categoryId = request.getParameter("categoryId");
		//System.out.println(categoryId);
		//XML 데이터를 호출할 URL => 파싱할 URL
		String url = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbmys628111103001&QueryType=ItemEditorChoice&CategoryId=1230&MaxResults=10&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big";

		//서버에서리턴될 XML데이터의 엘리먼트 이름 배열  
		String[] fieldNames ={"title","author","publisher","pubDate","cover","isbn13","description"};

		String itemsname="item";

		//각 게시물하나에 해당하는 XML 노드를 담을 리스트
		ArrayList<Map> pubList = xmlp(url, fieldNames,itemsname);

		ModelAndView model=new ModelAndView();
		model.addObject("pubList", pubList);
		model.setViewName("library_services/recBook");
		return model;
	}


	/*
	// tag값의 정보를 가져오는 메소드
	public String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node)nlList.item(0);
		if(nValue == null) return null;
		return nValue.getNodeValue();
	}
	 */
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

			/* list에 담긴 데이터 출력하기
			for(int temp=0; temp<items.getLength(); temp++) {
				Node nNode = items.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					System.out.println("#################");
					System.out.println(eElement.getTextContent()); //전체 정보
					System.out.println("제목 : "+getTagValue("title", eElement)); //입력한 tag 정보 출력
				}
			}
			 */
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
