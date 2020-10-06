package org.pub.dao;

import java.util.List;

import org.pub.vo.LoanVO;
import org.pub.vo.eBookVO;

public interface eBookDAO {

	int addBook(eBookVO book);

	eBookVO getEbook(int e_no);

	void recommand(String id, int e_no);

	String getRecommand(String id, int e_no);

	void non_recommand(String id, int e_no);

	Long count();

	int getebookCount(eBookVO vo);

	List<eBookVO> getebookList(eBookVO vo);

	List<LoanVO> getLoanList(String id);

	void book_Loan(LoanVO vo);

	int getLoanCount(String id);

	void book_Return(LoanVO vo);

	String getReturnDate(LoanVO vo);

	eBookVO getEbook(String isbn);

	int addBook_isbn(eBookVO vo);

	void delBook(String eno);

}
