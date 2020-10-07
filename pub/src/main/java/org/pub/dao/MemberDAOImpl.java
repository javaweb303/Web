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
	
	@Override
	public void updateMember(MemberVO m) {
		this.sqlSession.update("edit_ok",m);
		
	}




	@Override
	public void delMem(MemberVO dm) {
		this.sqlSession.update("m_del",dm);
		
	}




	@Override
	public MemberVO login_check(String login_id) {

		return this.sqlSession.selectOne("login_ck", login_id);
	}




	@Override
	public MemberVO idcheck(String id) {
		return this.sqlSession.selectOne("m_check",id);
	}




	@Override
	public Object insertMember(MemberVO m) {
		return this.sqlSession.insert("m_in",m);
	}




	@Override
	public MemberVO pwdMember(MemberVO m) {
		return this.sqlSession.selectOne("p_find",m);
	}




	@Override
	public void updatePwd(MemberVO m) {
		this.sqlSession.update("p_edit",m);
		
	}




	@Override
	public MemberVO findMember(MemberVO m) {
		return this.sqlSession.selectOne("i_find", m);
	}
}
