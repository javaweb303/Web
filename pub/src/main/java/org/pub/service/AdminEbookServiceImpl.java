package org.pub.service;

import java.util.List;

import org.pub.dao.AdminEbookDAO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminEbookServiceImpl implements AdminEbookService {

	@Autowired
	private AdminEbookDAO adminEbookDAO;

	@Override
	public List<eBookVO> getEbookList(eBookVO eb) {
		return this.adminEbookDAO.getEbookList(eb);
	}

	@Override
	public int getEbookListCount(eBookVO eb) {
		return this.adminEbookDAO.getEbookListCount(eb);
	}

	//관리자 메인화면에서 전자책 수
	@Override
	public int getEbookCount(eBookVO eb) {
		return this.adminEbookDAO.getEbookCount(eb);
	}
	
	
}
