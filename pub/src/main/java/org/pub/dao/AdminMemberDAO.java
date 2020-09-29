package org.pub.dao;

import java.util.List;

import org.pub.vo.MemberVO;

public interface AdminMemberDAO {

	List<MemberVO> getMemberList(MemberVO m);

	MemberVO getMemInfo(String id);

	void editM(MemberVO m);

	void delM(String id);

	void register(MemberVO m);

}
