package org.pub.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.pub.dao.eBookDAO;
import org.pub.vo.LoanVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class eBookServiceImpl implements eBookService {
	@Autowired
	private eBookDAO eBookDAO;

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

	@Override
	public int getebookCount(eBookVO vo) {
		return eBookDAO.getebookCount(vo);
	}

	@Override
	public List<eBookVO> getebookList(eBookVO vo) {
		return eBookDAO.getebookList(vo);
	}

	@Override
	public List<LoanVO> book_LoanList(String id) {
		return eBookDAO.getLoanList(id);
	}

	@Override
	public void book_Loan(String id, int e_no) {
		LoanVO vo=new LoanVO();
		vo.setE_no(e_no);vo.setId(id);
		eBookDAO.book_Loan(vo);
	}

	@Override
	public int book_Loancount(String id) {
		return eBookDAO.getLoanCount(id);
	}

	@Override
	public void book_Return(String id, int e_no, int state) {
		LoanVO vo=new LoanVO();
		vo.setE_no(e_no);vo.setId(id);vo.setState(state);
		eBookDAO.book_Return(vo);
	}

	@Override
	public String getReturnDate(String id, int e_no) {
		LoanVO vo=new LoanVO();
		vo.setE_no(e_no);vo.setId(id);
		return eBookDAO.getReturnDate(vo);
	}

	@Override
	public eBookVO getEbook(String isbn) {
		return eBookDAO.getEbook(isbn);
	}

	@Override
	public int addBook_isbn(eBookVO vo) {
		return eBookDAO.addBook_isbn(vo);
	}

	@Override
	public void delBook(String eno) {
		eBookDAO.delBook(eno);
	}

	
}
