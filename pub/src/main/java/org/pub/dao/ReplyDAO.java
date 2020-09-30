package org.pub.dao;

import java.util.List;

import org.pub.vo.ReplyVO;

public interface ReplyDAO {

	void reply_add(ReplyVO vo);

	List<ReplyVO> reply_getlist(int e_no);

	void reply_del(int r_no);

	ReplyVO reply_get(int r_no);

	void reply_edit(ReplyVO vo);

	Long count(int no);

	List<ReplyVO> reply_getlist(ReplyVO replyVO);

	int getReplyCount(Integer e_no);

}
