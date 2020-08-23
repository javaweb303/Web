package org.pub.service;

import java.util.List;

import org.pub.vo.ReplyVO;

public interface ReplyService {

	void reply_add(ReplyVO vo);

	List<ReplyVO> reply_getlist(int e_no);

	void reply_del(ReplyVO vo);

}
