package org.pub.service;

import java.util.List;

import org.pub.vo.LoanVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;

public interface AdminLoanService {

	MemberVO getMem(String id);

	List<LoanVO> getLoan(String id);

	List<eBookVO> getEbookList(String id);

	eBookVO getEbook(String id);

	//void delB(String e_no);

	List<eBookVO> getReturn(String id);

	String getReturnDate(String id, int e_no);

	void book_Return(String id, int e_no, int state);


}
