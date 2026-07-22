package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.ReplyDao;
import com.team.dto.ReplyListDto;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	ReplyDao replyDao;

	@Override
	public boolean WriteReply(ReplyListDto replyDto) {
		return replyDao.WriteReply(replyDto);
	}

	@Override
	public boolean UpdateReply(ReplyListDto replyDto) {
		return replyDao.UpdateReply(replyDto);
	}

	@Override
	public boolean DeleteReply(ReplyListDto replyDto) {
		return replyDao.DeleteReply(replyDto);
	}

	@Override
	public List<ReplyListDto> ShowReplyList(ReplyListDto replyDto) {
		return replyDao.ShowReplyList(replyDto);
	}
}
