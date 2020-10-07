package org.pub.dao;

import java.util.List;

import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;

public interface AdminOpenDAO {
	
	void insertG(GongjiVO g);

	List<GongjiVO> getGongjiList(GongjiVO g);

	int getListCount(GongjiVO g);

	GongjiVO getGongjiCont(int no);

	void editGongji(GongjiVO g);

	void delG(int no);

	int getFaqListCount(FaqContentVO f);

	List<FaqContentVO> getFaqList(FaqContentVO f);

	FaqContentVO getFaqCont(int no);

	void editFaq(FaqContentVO f);

	void insertF(FaqContentVO f);

	void delF(int no);

}
