package org.pub.dao;

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

}
