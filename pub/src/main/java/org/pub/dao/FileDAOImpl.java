package org.pub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.FileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOImpl implements FileDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void in_file(List<FileVO> list) {
		for(FileVO vo:list) {
			sqlSession.insert("in_file", vo);
		}
		
	}
}
