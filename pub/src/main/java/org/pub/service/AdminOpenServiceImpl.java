package org.pub.service;

import java.util.List;

import org.pub.dao.AdminOpenDAO;
import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminOpenServiceImpl implements AdminOpenService {

	@Autowired
	private AdminOpenDAO adminOpenDAO;

	@Override
	public void insertG(GongjiVO g) {
		this.adminOpenDAO.insertG(g);
	}
	
	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.adminOpenDAO.getGongjiList(g);
	}

	@Override
	public int getListCount(GongjiVO g) {
		return this.adminOpenDAO.getListCount(g);
	}

	@Override
	public GongjiVO getGongjiCont(int no) {
		return this.adminOpenDAO.getGongjiCont(no);
	}

	@Override
	public void editGongji(GongjiVO g) {
		this.adminOpenDAO.editGongji(g);
	}

	@Override
	public void delG(int no) {
		this.adminOpenDAO.delG(no);
	}

	@Override
	public int getFaqListCount(FaqContentVO f) {
		return this.adminOpenDAO.getFaqListCount(f);
	}

	@Override
	public List<FaqContentVO> getFaqList(FaqContentVO f) {
		return this.adminOpenDAO.getFaqList(f);
	}

	@Override
	public FaqContentVO getFaqCont(int no) {
		return this.adminOpenDAO.getFaqCont(no);
	}

	@Override
	public void editFaq(FaqContentVO f) {
		this.adminOpenDAO.editFaq(f);
	}

	@Override
	public void insertF(FaqContentVO f) {
		this.adminOpenDAO.insertF(f);
	}

	@Override
	public void delF(int no) {
		this.adminOpenDAO.delF(no);
	}

	
	
	
}
