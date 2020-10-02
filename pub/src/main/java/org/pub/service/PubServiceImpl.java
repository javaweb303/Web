package org.pub.service;

import java.util.List;

import org.pub.dao.PubDAO;
import org.pub.vo.GongjiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PubServiceImpl implements PubService {

	@Autowired
	private PubDAO pubDAO;
	
	@Override
	public List<GongjiVO> getList() {
		return this.pubDAO.getList();
	}


}
