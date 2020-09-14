package org.pub.dao;

import java.util.List;

import org.pub.vo.eBookVO;

public interface eBookDAO {

	void upload(eBookVO book);

	List<eBookVO> select();

	eBookVO selectOne(int no);

	void up_recommend();

	int addBook(eBookVO book);

	eBookVO getEbook(int e_no);

	void recommand(String id, int e_no);

	String getRecommand(String id, int e_no);

	void non_recommand(String id, int e_no);

	Long count();

	int getebookCount(eBookVO vo);

	List<eBookVO> getebookList(eBookVO vo);

}
