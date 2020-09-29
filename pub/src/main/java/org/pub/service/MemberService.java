package org.pub.service;

import org.pub.vo.MemberVO;


public interface MemberService {

	void join(MemberVO m);

	MemberVO getMember(String id);

	String getoverdue(String id);

	void setOverDue(String id, int days);

}
