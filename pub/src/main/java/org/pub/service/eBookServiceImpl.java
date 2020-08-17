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
		book.setBoardcd(board);
		System.out.println("파일 번호 "+book.getFile_no());
		System.out.println("게시판 "+book.getBoardcd());
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
	public void up_recommend() {
		eBookDAO.up_recommend();
	}

	
}