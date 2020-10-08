package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.LoanVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminLoanDAOImpl implements AdminLoanDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO getMem(String id) {
		return this.sqlSession.selectOne("adMem_info", id);
	}

	@Override
	public List<LoanVO> getLoan(String id) {
		return this.sqlSession.selectList("adLoan_list", id);
	}

	@Override
	public List<eBookVO> getEbookList(String id) {
		return this.sqlSession.selectList("adLoanEbook_list", id);
	}

	@Override
	public eBookVO getEbook(String id) {
		return this.sqlSession.selectOne("adLoanEbook_info", id);
	}

	@Override
	public void delB(String e_no) {
		this.sqlSession.update("adLoanEbook_return", e_no);
	}

	@Override
	public List<eBookVO> getReturn(String id) {
		return this.sqlSession.selectList("adReturnEbook_list", id);
	}

	
}
