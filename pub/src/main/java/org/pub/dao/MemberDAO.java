package org.pub.dao;

import java.util.Map;

import org.pub.vo.MemberVO;

public interface MemberDAO {

	void join(MemberVO m);

	MemberVO getMember(String id);

	String getOverDue(String id);

	void setOverDue(Map<String, Object> map);
	
	void updateMember(MemberVO m);


	void delMem(MemberVO dm);


	MemberVO login_check(String login_id);


	MemberVO idcheck(String id);


	Object insertMember(MemberVO m);


	MemberVO pwdMember(MemberVO m);


	void updatePwd(MemberVO m);


	MemberVO findMember(MemberVO m);
}
