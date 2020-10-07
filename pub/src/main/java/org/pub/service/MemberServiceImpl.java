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
	public String getOverDue(String id) {
		return this.MemberDAO.getOverDue(id);
	}

	@Override
	public void setOverDue(String id, int days) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("days", days);
		
		this.MemberDAO.setOverDue(map);
	}
	
	@Override
	public void updateMember(MemberVO m) {
		this.MemberDAO.updateMember(m);
		
	}



	@Override
	public void delMem(MemberVO dm) {
		this.MemberDAO.delMem(dm);
		
	}



	@Override
	public MemberVO login_check(String login_id) {
		return this.MemberDAO.login_check(login_id);
	}



	@Override
	public MemberVO idcheck(String id) {
		return this.MemberDAO.idcheck(id);
	}



	@Override
	public void insertMember(MemberVO m) {
		this.MemberDAO.insertMember(m);
		
	}



	@Override
	public MemberVO pwdMember(MemberVO m) {
		return this.MemberDAO.pwdMember(m);
	}



	@Override
	public void updatePwd(MemberVO m) {
	this.MemberDAO.updatePwd(m);
		
	}



	@Override
	public MemberVO findMember(MemberVO m) {
		return this.MemberDAO.findMember(m);
	}

}
