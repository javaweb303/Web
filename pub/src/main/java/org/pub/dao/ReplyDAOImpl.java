package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reply_add(ReplyVO vo) {
		sqlSession.insert("reply_add", vo);
	}

	@Override
	public List<ReplyVO> reply_getlist(int e_no) {
		return sqlSession.selectList("reply_getList", e_no);
	}

	@Override
	public void reply_del(int r_no) {
		sqlSession.delete("reply_del", r_no);
	}

	@Override
	public ReplyVO reply_get(int r_no) {
		return sqlSession.selectOne("reply_get", r_no);
	}

	@Override
	public void reply_edit(ReplyVO vo) {
		sqlSession.update("reply_edit", vo);
	}

	@Override
	public Long count(int no) {
		return sqlSession.selectOne("count", no);
	}

	@Override
	public List<ReplyVO> reply_getlist(ReplyVO replyVO) {
		return sqlSession.selectList("reply_getlist", replyVO);
	}

	@Override
	public int getReplyCount(Integer e_no) {
		return sqlSession.selectOne("replyCount", e_no);
	}
}
