package org.pub.service;

import java.util.List;

import org.pub.vo.eBookVO;

public interface eBookService {

	void upload(eBookVO book, String string, List<Integer> files_no);

	List<eBookVO> select();

	eBookVO selectOne(int no);

	int addBook(eBookVO book);

	eBookVO getEbook(int e_no);

	void recommand(String id, int e_no);

	String getRecommand(String id, int e_no);

	void non_recommand(String id, int e_no);

	int getebookCount(eBookVO vo);

	List<eBookVO> getebookList(eBookVO vo);


}
