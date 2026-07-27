package com.team.project;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dao.FilesDao;
import com.team.dto.FilesDto;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class FilesDaoTest {
	@Autowired
	FilesDao filesDao;
	
	// 1. 파일 업로드 테스트
	@Test
	public void testUploadFile() {
		// Given
		FilesDto dto = new FilesDto();
		dto.setSpace_key("ABCD");
		dto.setTask_no(1);
		dto.setReply_no(null);
		dto.setFile_name("testFile1");
		dto.setFile_path("filepath#1");
		// When
		boolean isUploaded = filesDao.UploadFile(dto);
		// Then
		assertTrue("failed", isUploaded);
	}
	
}
