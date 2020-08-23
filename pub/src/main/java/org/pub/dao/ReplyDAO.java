package org.pub.dao;

import java.util.List;

import org.pub.vo.ReplyVO;

public interface ReplyDAO {

	void reply_add(ReplyVO vo);

	List<ReplyVO> reply_getlist(int e_no);

	void reply_del(ReplyVO vo);

}
