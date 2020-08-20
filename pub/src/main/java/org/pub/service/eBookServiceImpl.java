package org.pub.service;

import java.util.List;

import org.pub.dao.eBookDAO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class eBookServiceImpl implements eBookService {
	@Autowired
	private eBookDAO eBookDAO;

	@Override
	public void upload(eBookVO book, String board,List<Integer> files_no) {
		System.out.println("제목 "+book.getE_title());
		System.out.println("저자 "+book.getE_author());
		System.out.println("출판사 "+book.getE_publisher());
		System.out.println("출판년도 "+book.getE_publication_year());
		System.out.println("분류코드 "+book.getE_group());
		System.out.println(files_no);
		String file_no="";
		for(int i:files_no) {
			file_no+=i+",";
		}
		file_no=file_no.substring(0, file_no.lastIndexOf(","));
		System.out.println(file_no);
		book.setFile_no(file_no);
		System.out.println("파일 번호 "+book.getFile_no());
		eBookDAO.upload(book);
	}

	@Override
	public List<eBookVO> select() {
		return eBookDAO.select();
	}

	@Override
	public eBookVO selectOne(int no) {
		return eBookDAO.selectOne(no);
	}

	@Override
	public int addBook(eBookVO book) {//전자책 등록
		return eBookDAO.addBook(book);
	}

	@Override
	public eBookVO getEbook(int e_no) {//전자책 가져오기
		return eBookDAO.getEbook(e_no);
	}

	@Override
	public void recommand(String id, int e_no) {//전자책 추천
		eBookDAO.recommand(id,e_no);
	}

	@Override
	public String getRecommand(String id, int e_no) {
		return eBookDAO.getRecommand(id,e_no);
	}

	@Override
	public void non_recommand(String id, int e_no) {
		eBookDAO.non_recommand(id,e_no);
	}

	
}
