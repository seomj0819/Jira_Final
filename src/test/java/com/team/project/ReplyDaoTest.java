package com.team.project;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dao.ReplyDao;
import com.team.dto.ReplyListDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class ReplyDaoTest {
	@Autowired
	ReplyDao replyDao;
	
	// 1. 댓글 쓰기 테스트
	@Test
	public void testWriteReply() {
		// Given
		ReplyListDto dto = new ReplyListDto();
		dto.setSpaceKey("ABCD");
		dto.setTaskNo(1);
		dto.setWriterNo(1);
		dto.setReplyContent("testReply1");
		dto.setImageNo(2);
		// When
		boolean isWrited = replyDao.WriteReply(dto);
		// Then
		assertTrue("failed", isWrited);
	}
	
	// 2. 댓글 업데이트 테스트
	@Test
	public void testUpdateReply() {
		// Given
		ReplyListDto dto = new ReplyListDto();
		dto.setReplyContent("updatetest1");
		dto.setImageNo(1);
		dto.setWriterNo(1);
		dto.setReplyNo(1);
		// When
		boolean isUpdated = replyDao.UpdateReply(dto);
		// Then
		assertTrue("failed", isUpdated);
	}
	
	// 3. 댓글 삭제 테스트
	@Test
	public void testDeleteReply() {
		// Given
		ReplyListDto dto = new ReplyListDto();
		dto.setReplyNo(1);
		dto.setWriterNo(1);
		// When
		boolean isDeleted = replyDao.DeleteReply(dto);
		// Then
		assertTrue("failed", isDeleted);
	}
	
	// 4. 댓글 조회 테스트
	@Test
	public void testChangeOrderDown() {
		// Given
		ReplyListDto dto = new ReplyListDto();
		dto.setSpaceKey("ABCD");
		dto.setTaskNo(1);
		// When
		List<ReplyListDto> list = replyDao.ShowReplyList(dto);
		// Then
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getReplyNo()+"/"+list.get(i).getWriter_no()+"/"+list.get(i).getReplyContent()+"/"+list.get(i).getImageNo()+"/"+list.get(i).getCreatedAt());
		}
	}
}
