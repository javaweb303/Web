package org.pub.service;

import java.util.List;

import org.pub.vo.FaqContentVO;
import org.pub.vo.GongjiVO;

public interface OpenService {

	List<GongjiVO> getList();
	int getListCount(GongjiVO g);

	List<GongjiVO> getGongjiList(GongjiVO g);

	GongjiVO getGCont(int gongji_no);
	
	List<FaqContentVO> getFaqList(FaqContentVO f);
	int getTotalFaqCount(int chkCId);
//	GongjiVO getGprev(int gongji_no);
//	GongjiVO getGnext(int gongji_no);

}
