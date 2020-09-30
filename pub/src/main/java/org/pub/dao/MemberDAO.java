package org.pub.dao;

import java.util.Map;

import org.pub.vo.MemberVO;

public interface MemberDAO {

	void join(MemberVO m);

	MemberVO getMember(String id);

	String getOverDue(String id);

	void setOverDue(Map<String, Object> map);

}
