package com.team.dao;

import java.util.List;

import com.team.dto.ReplyListDto;

public interface ReplyDao {
	boolean WriteReply(ReplyListDto replyDto);
	boolean UpdateReply(ReplyListDto replyDto);
	boolean DeleteReply(ReplyListDto replyDto);
	List<ReplyListDto> ShowReplyList(ReplyListDto replyDto);
}
