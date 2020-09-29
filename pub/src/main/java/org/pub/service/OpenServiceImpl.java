package org.pub.service;

import java.util.List;

import org.pub.dao.OpenDAO;
import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OpenServiceImpl implements OpenService {
	int sort;
	@Autowired
	private OpenDAO openDAO;
	@Override
	public List<GongjiVO> getList() {
		return this.openDAO.getList();
	}
	@Override
	public int getListCount(GongjiVO g) {
		return this.openDAO.getListCount(g);
	}
	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.openDAO.getGongjiList(g);
	}
	@Override
	public GongjiVO getGCont(int gongji_no) {
		this.openDAO.updateHit(gongji_no);//조회수 증가
		return this.openDAO.getGCont(gongji_no);
	}
	
	@Override
	public List<FaqContentVO> getFaqList(FaqContentVO f) {
		System.out.println("service:"+f.getChkCId());
		return this.openDAO.getFaqList(f);
		
	}
	@Override
	public int getTotalFaqCount(int chkCId) {
		System.out.println("servcie count:"+chkCId);
		return this.openDAO.getTotalFaqCount(chkCId);
	}
	
}
