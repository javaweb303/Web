package org.pub.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class eBookDAOImpl implements eBookDAO {
	@Autowired
	private SqlSession sqlSession;
}
