package org.pub.service;

import java.util.List;

import org.pub.dao.ReplyDAO;
import org.pub.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public void reply_add(ReplyVO vo) {
		replyDAO.reply_add(vo);
	}

	@Override
	public List<ReplyVO> reply_getlist(int e_no) {
		return replyDAO.reply_getlist(e_no);
	}

	@Override
	public void reply_del(int r_no) {
		replyDAO.reply_del(r_no);
	}

	@Override
	public ReplyVO reply_get(int r_no) {
		return replyDAO.reply_get(r_no);
	}

	@Override
	public void reply_edit(ReplyVO vo) {
		replyDAO.reply_edit(vo);
	}

	@Override
	public List<ReplyVO> reply_getlist(ReplyVO replyVO) {
		return replyDAO.reply_getlist(replyVO);
	}

	@Override
	public int getReplyCount(Integer e_no) {
		return replyDAO.getReplyCount(e_no);
	}
}
