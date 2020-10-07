package org.pub.dao;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.MailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailDAOImpl implements MailDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void sendCode(MailVO v) {
		String code=this.sqlSession.selectOne("code", v.getEmail());
		if(code!=null) {
			sqlSession.delete("delcode", v.getEmail());
		}
		this.sqlSession.insert("sendcode", v);
	}

	@Override
	public String code(String email) {
		return this.sqlSession.selectOne("code", email);
	}

	@Override
	public void delCode(String email) {
		sqlSession.delete("delcode", email);
	}
}
