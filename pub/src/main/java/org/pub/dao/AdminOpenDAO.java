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

	//관리자 메인화면에서 공지사항 수
	int getGongjiCount(GongjiVO g);
	//관리자 메인화면에서 faq 수
	int getFaqCount(FaqContentVO f);
	//메인화면에서 최근 공지사항 출력
	List<GongjiVO> getMainGongjiList(GongjiVO g);
	//메인화면에서 최근 faq 출력
	List<FaqContentVO> getMainFaqList(FaqContentVO f);

}
