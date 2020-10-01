package org.pub.service;

import java.util.List;

import org.pub.vo.eBookVO;

public interface AdminEbookService {

	List<eBookVO> getEbookList(eBookVO eb);

}
