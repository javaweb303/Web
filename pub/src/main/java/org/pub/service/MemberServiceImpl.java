package org.pub.service;

import org.pub.dao.MemberDAO;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO pubDAO;
	
	@Override
	public void join(MemberVO m) {
		pubDAO.join(m);
	}

}
