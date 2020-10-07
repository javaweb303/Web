package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOpenDAOImpl implements AdminOpenDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertG(GongjiVO g) {
		this.sqlSession.insert("adBbs_in", g);
	}
	
	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.sqlSession.selectList("adBbs_list", g);
	}

	@Override
	public int getListCount(GongjiVO g) {
		return this.sqlSession.selectOne("adBbs_count",g);
	}

	@Override
	public GongjiVO getGongjiCont(int no) {
		return this.sqlSession.selectOne("adBbs_cont",no);
	}

	@Override
	public void editGongji(GongjiVO g) {
		this.sqlSession.update("adBbs_edit", g);
	}

	@Override
	public void delG(int no) {
		this.sqlSession.delete("adBbs_del", no);
	}

	@Override
	public int getFaqListCount(FaqContentVO f) {
		return this.sqlSession.selectOne("adFaq_count", f);
	}

	@Override
	public List<FaqContentVO> getFaqList(FaqContentVO f) {
		return this.sqlSession.selectList("adFaq_list", f);
	}

	@Override
	public FaqContentVO getFaqCont(int no) {
		return this.sqlSession.selectOne("adFaq_cont", no);
	}

	@Override
	public void editFaq(FaqContentVO f) {
		System.out.println("dao:"+f.getQuestion());
		this.sqlSession.update("adFaq_edit", f);
	}

	@Override
	public void insertF(FaqContentVO f) {
		this.sqlSession.insert("adFaq_in", f);
	}

	@Override
	public void delF(int no) {
		this.sqlSession.delete("adFaq_del",no);
	}

	

}
