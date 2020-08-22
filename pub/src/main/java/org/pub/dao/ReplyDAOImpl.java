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
}
