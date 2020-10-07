package org.pub.dao;

import java.util.List;

import org.pub.vo.eBookVO;

public interface AdminEbookDAO {

	List<eBookVO> getEbookList(eBookVO eb);

	int getEbookListCount(eBookVO eb);

}
