package org.pub.dao;

import java.util.List;

import org.pub.vo.eBookVO;

public interface eBookDAO {

	void upload(eBookVO book);

	List<eBookVO> select();

	eBookVO selectOne(int no);

	void up_recommend();

}
