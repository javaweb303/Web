package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {

	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<MemberVO> getMemberList(MemberVO m) {
		return this.sqlSession.selectList("ad_list", m);
	}//회원 목록
	@Override
	public MemberVO getMemInfo(String id) {
		return this.sqlSession.selectOne("ad_info", id);
	}//회원상세정보+수정폼
	@Override
	public void editM(MemberVO m) {
		this.sqlSession.update("ad_edit", m);
	}//관리자로 회원정보 수정
	@Override
	public void delM(String id) {
		this.sqlSession.delete("ad_del", id);
	}//관리자로 사용자 회원 삭제
	@Override
	public void register(MemberVO m) {
		this.sqlSession.insert("ad_join", m);
	}

}
