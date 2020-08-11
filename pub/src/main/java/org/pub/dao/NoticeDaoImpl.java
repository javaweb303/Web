package org.pub.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDaoImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession; //mybatis 수행객체 생성
}
