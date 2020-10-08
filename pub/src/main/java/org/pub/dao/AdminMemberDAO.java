package org.pub.dao;

import java.util.List;

import org.pub.vo.MemberVO;

public interface AdminMemberDAO {

	List<MemberVO> getMemberList(MemberVO m);

	MemberVO getMemInfo(String id);

	void editM(MemberVO m);

	void delM(String id);

	void register(MemberVO m);

	int getListCount(MemberVO m);
	//관리자 메인화면에서 회원 수
	int getMemberCount(MemberVO member);

}
