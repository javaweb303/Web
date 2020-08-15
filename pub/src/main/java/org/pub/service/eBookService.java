package org.pub.service;

import java.util.List;

import org.pub.vo.eBookVO;

public interface eBookService {

	void upload(eBookVO book, String string, List<Integer> files_no);

	List<eBookVO> select();

	eBookVO selectOne(int no);

	void up_recommend();


}
