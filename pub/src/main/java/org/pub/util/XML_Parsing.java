package org.pub.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XML_Parsing {
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

