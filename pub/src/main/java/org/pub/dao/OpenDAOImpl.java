package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OpenDAOImpl implements OpenDAO {

	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<GongjiVO> getList() {
		return this.sqlSession.selectList("g_list");
	}
	@Override
	public int getListCount(GongjiVO g) {
		return this.sqlSession.selectOne("g_count",g);
	}
	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.sqlSession.selectList("g_list", g);
	}
	
	@Override
	public void updateHit(int gongji_no) {
		this.sqlSession.update("g_hit",gongji_no);
	}
	@Override
	public GongjiVO getGCont(int gongji_no) {
		return this.sqlSession.selectOne("g_cont",gongji_no);
	}
	@Override
	public int getTotalFaqCount() {
		return this.sqlSession.selectOne("fs_count");
	}
	@Override
	public List<FaqContentVO> getFaqList(FaqContentVO f) {
		System.out.println("dao:"+f.getChkCId());
		return this.sqlSession.selectList("f_list", f);
	}
	@Override
	public int getTotalFaqCount(int chkCId) {
		System.out.println("dao count:"+chkCId);
		return this.sqlSession.selectOne("f_count",chkCId);
	}
	/*
	@Override
	public GongjiVO getGprev(int gongji_no) {
		return this.sqlSession.selectOne("g_prev", gongji_no);
	}
	@Override
	public GongjiVO getGnext(int gongji_no) {
		return this.sqlSession.selectOne("g_next", gongji_no);
	}*/

}
