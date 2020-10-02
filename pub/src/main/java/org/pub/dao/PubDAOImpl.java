package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.GongjiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PubDAOImpl implements PubDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GongjiVO> getList() {
		return this.sqlSession.selectList("gongji_list");
	}


}
