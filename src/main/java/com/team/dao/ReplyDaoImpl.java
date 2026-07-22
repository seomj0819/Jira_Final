package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.ReplyListDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	@Autowired
	SqlSession sqlSession;
	
	// 명세 5.1
	// input : space_key, task_no, writer_no, reply_content, image_no
	// output : -
	// reply_content, image_no : 유저입력
	// created_at : SYSDATE
	// space_key, task_no, writer_no : current_
	@Override
	public boolean WriteReply(ReplyListDto replyDto) {
		boolean isWrited = false;

		try {
			int result = sqlSession.insert("com.team.mapper.ReplyMapper.writeReply", replyDto);

			if (result > 0) {
				isWrited = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isWrited;
	}

	// 명세 5.2
	// input : reply_no, writer_no, new_reply_content, new_image_no
	// output : -
	// reply_no : 수정하려는 댓글 번호
	// writer_no : 작성자의 유저번호, 작성자만 수정 가능
	// new_reply_content : 새로운 댓글내용
	// new_image_no : 새로운 이미지 번호
	@Override
	public boolean UpdateReply(ReplyListDto replyDto) {
		boolean isUpdated = false;

		try {
			int result = sqlSession.update("com.team.mapper.ReplyMapper.updateReply", replyDto);

			if (result > 0) {
				isUpdated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdated;
	}

	// 명세 5.3
	// input : reply_no, writer_no
	// output : -
	// reply_no : 지우려는 댓글 번호
	// writer_no : 작성자의 유저번호, 작성자만 삭제가능
	@Override
	public boolean DeleteReply(ReplyListDto replyDto) {
		boolean isDeleted = false;

		try {
			int result = sqlSession.delete("com.team.mapper.ReplyMapper.deleteReply", replyDto);

			if (result > 0) {
				isDeleted = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDeleted;
	}

	// 명세 5.4
	// input : space_key, task_no
	// output : List<ReplyListDto>
	// space_key, task_no : 현재 스페이스, 테스크
	@Override
	public List<ReplyListDto> ShowReplyList(ReplyListDto replyDto) {
		List<ReplyListDto> list = null;

		try {
			list = sqlSession.selectList("com.team.mapper.ReplyMapper.showReplyList", replyDto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
