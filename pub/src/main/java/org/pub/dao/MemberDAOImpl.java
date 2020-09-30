package org.pub.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void join(MemberVO m) {
		sqlSession.insert("m_join", m);
	}
	@Override
	public MemberVO getMember(String id) {
		return sqlSession.selectOne("getMember", id);
	}
	@Override
	public String getOverDue(String id) {
		return sqlSession.selectOne("getOverDue",id);
	}
	
	@Override
	public void setOverDue(Map<String, Object> map) {
		sqlSession.update("setOverDue", map);
	}

}
