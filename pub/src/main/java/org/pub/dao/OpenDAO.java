package org.pub.dao;

import java.util.List;

import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;

public interface OpenDAO {

	List<GongjiVO> getList();

	int getListCount(GongjiVO g);

	List<GongjiVO> getGongjiList(GongjiVO g);

	void updateHit(int gongji_no);

	GongjiVO getGCont(int gongji_no);

	int getTotalFaqCount();

	List<FaqContentVO> getFaqList(FaqContentVO f);

	int getTotalFaqCount(int chkCId);

//	GongjiVO getGprev(int gongji_no);

//	GongjiVO getGnext(int gongji_no);




}
