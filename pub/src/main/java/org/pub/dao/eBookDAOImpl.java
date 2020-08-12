package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class eBookDAOImpl implements eBookDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void upload(eBookVO book) {
		sqlSession.insert("upload",book);
	}

	@Override
	public List<eBookVO> select() {
		return sqlSession.selectList("sel");
	}
}
