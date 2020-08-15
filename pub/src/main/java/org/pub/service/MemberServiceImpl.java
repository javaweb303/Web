package org.pub.service;

import org.pub.dao.MemberDAO;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO MemberDAO;
	
	@Override
	public void join(MemberVO m) {
		MemberDAO.join(m);
	}

	@Override
	public MemberVO getMember(String id) {
		return MemberDAO.getMember(id);
	}

}
