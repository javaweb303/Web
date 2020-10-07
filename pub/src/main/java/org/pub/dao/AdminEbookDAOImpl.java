package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminEbookDAOImpl implements AdminEbookDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<eBookVO> getEbookList(eBookVO eb) {
		return this.sqlSession.selectList("adEbook_list", eb);
	}

	@Override
	public int getEbookListCount(eBookVO eb) {
		return this.sqlSession.selectOne("adEbook_count", eb);
	}
	
	
}
