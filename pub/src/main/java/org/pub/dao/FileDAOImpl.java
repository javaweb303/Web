package org.pub.dao;

import java.util.ArrayList;
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

	@Override
	public List get_fileupload(List<FileVO> list) {
		List i=new ArrayList();
		int count=0;
		for(FileVO vo:list) {
		i.add(sqlSession.selectOne("get_fileupload", vo));
		count++;
		}
		return i;
	}

	@Override
	public List<FileVO> getFile(List<Integer> file_no) {
		List<FileVO> list=new ArrayList<FileVO>();
		for(int i:file_no) {
			FileVO v=new FileVO();
			v=sqlSession.selectOne("get_file", i);
			list.add(v);
		}
		return list;
	}
}
