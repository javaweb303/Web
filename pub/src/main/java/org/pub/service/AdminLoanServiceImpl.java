package org.pub.service;

import java.util.List;

import org.pub.dao.AdminLoanDAO;
import org.pub.vo.LoanVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminLoanServiceImpl implements AdminLoanService {

	@Autowired
	private AdminLoanDAO adminLoanDAO;

	@Override
	public MemberVO getMem(String id) {
		return this.adminLoanDAO.getMem(id);
	}

	@Override
	public List<LoanVO> getLoan(String id) {
		return this.adminLoanDAO.getLoan(id);
	}

	@Override
	public List<eBookVO> getEbookList(String id) {
		return this.adminLoanDAO.getEbookList(id);
	}

	@Override
	public eBookVO getEbook(String id) {
		return this.adminLoanDAO.getEbook(id);
	}

	@Override
	public void delB(String e_no) {
		this.adminLoanDAO.delB(e_no);
	}

	
}
