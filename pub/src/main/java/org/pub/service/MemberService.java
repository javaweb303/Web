package org.pub.service;

import org.pub.vo.MemberVO;


public interface MemberService {

	void join(MemberVO m);

	MemberVO getMember(String id);

	String getOverDue(String id);//연체일 

	void setOverDue(String id, int i);

}
