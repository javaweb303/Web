package org.pub.service;

import org.pub.vo.MemberVO;


public interface MemberService {

	void join(MemberVO m);

	MemberVO getMember(String id);

	String getOverDue(String id);//연체일 

	void setOverDue(String id, int i);

	void updateMember(MemberVO m);


	void delMem(MemberVO dm);


	MemberVO login_check(String login_id);


	MemberVO idcheck(String id);


	void insertMember(MemberVO m);


	MemberVO pwdMember(MemberVO m);


	void updatePwd(MemberVO m);

	MemberVO findMember(MemberVO m);

}
