package org.pub.service;

import java.util.List;

import org.pub.dao.AdminMemberDAO;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;
	@Override
	public List<MemberVO> getMemberList(MemberVO m) {
		return this.adminMemberDAO.getMemberList(m);
	}
	@Override
	public MemberVO getMemInfo(String id) {
		return this.adminMemberDAO.getMemInfo(id);
	}
	@Override
	public void editM(MemberVO m) {
		this.adminMemberDAO.editM(m);
	}
	@Override
	public void delM(String id) {
		this.adminMemberDAO.delM(id);
	}
	@Override
	public void register(MemberVO m) {
		this.adminMemberDAO.register(m);
	}
	@Override
	public int getListCount(MemberVO m) {
		return this.adminMemberDAO.getListCount(m);
	}
	//관리자 메인화면에서 회원수
	@Override
	public int getMemberCount(MemberVO member) {
		return this.adminMemberDAO.getMemberCount(member);
	}

}
