package org.pub.service;

import java.util.List;

import org.pub.vo.LoanVO;
import org.pub.vo.eBookVO;

public interface eBookService {

	int addBook(eBookVO book);

	eBookVO getEbook(int e_no);

	void recommand(String id, int e_no);

	String getRecommand(String id, int e_no);

	void non_recommand(String id, int e_no);

	int getebookCount(eBookVO vo);

	List<eBookVO> getebookList(eBookVO vo);

	List<LoanVO> book_LoanList(String id);

	void book_Loan(String attribute, int e_no);

	int book_Loancount(String id);

	void book_Return(String id, int e_no);

	String getReturnDate(String id, int e_no);

	eBookVO getEbook(String isbn);//

	int addBook_isbn(eBookVO vo);


}
