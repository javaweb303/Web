package org.pub.dao;

import java.util.List;

import org.pub.vo.LoanVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;

public interface AdminLoanDAO {

	MemberVO getMem(String id);

	List<LoanVO> getLoan(String id);

	List<eBookVO> getEbookList(String id);

	eBookVO getEbook(String id);

	void delB(String e_no);

	List<eBookVO> getReturn(String id);


}
