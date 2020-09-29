package org.pub.service;

import java.util.HashMap;
import java.util.Map;

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

	@Override
	public String getoverdue(String id) {
		return MemberDAO.getoverdue(id);
	}

	@Override
	public void setOverDue(String id,int days) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("days", days);
		
		MemberDAO.setOverDue(map);
	}

}
