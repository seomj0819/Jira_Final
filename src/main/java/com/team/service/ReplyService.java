package com.team.service;

import java.util.List;

import com.team.dto.ReplyListDto;

public interface ReplyService {
	boolean WriteReply(ReplyListDto replyDto);
	boolean UpdateReply(ReplyListDto replyDto);
	boolean DeleteReply(ReplyListDto replyDto);
	List<ReplyListDto> ShowReplyList(ReplyListDto replyDto);
}
