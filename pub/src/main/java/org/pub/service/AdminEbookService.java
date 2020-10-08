package org.pub.service;

import java.util.List;

import org.pub.vo.eBookVO;

public interface AdminEbookService {

	List<eBookVO> getEbookList(eBookVO eb);

	int getEbookListCount(eBookVO eb);

	//관리자 메인화면에서 전자책 수
	int getEbookCount(eBookVO eb);

}
