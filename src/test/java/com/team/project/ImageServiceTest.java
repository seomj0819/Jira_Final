package com.team.project;

import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.dto.ImageDto;
import com.team.service.ImageService;

@RunWith(SpringJUnit4ClassRunner.class) //	테스트를 스프링과 함께 실행 함
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})

public class ImageServiceTest {
	@Autowired
	ImageService iSvc;
	
	// 1. 이미지 업로드 테스트
	@Test
	public void testUploadImage() {
		// Given
		ImageDto dto = new ImageDto();
		dto.setImage_title("testImage3939");
		dto.setImage_category("user");
		// When
		boolean isUploaded = iSvc.UploadImage(dto);
		// Then
		assertTrue("failed", isUploaded);
	}
	
	// 2. 프로필 이미지 업데이트 테스트
	@Test
	public void testUpdateProfileImage() {
		// Given
		String new_image_title ="newTestImageTitle3939";
		int user_no = 3;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("new_image_title", new_image_title);
		paramMap.put("user_no", user_no);
		// When
		boolean isUpdated = iSvc.UpdateProfileImage(paramMap);
		// Then
		assertTrue("failed", isUpdated);
	}
	
	// 3. 댓글 이미지 삭제 테스트
	@Test
	public void testDeleteImageReply() {
		// Given
		int reply_no = 1;
		int user_no = 1;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("reply_no", reply_no);
		paramMap.put("user_no", user_no);
		// When
		boolean isDeleted = iSvc.DeleteImageReply(paramMap);
		// Then
		assertTrue("failed", isDeleted);
	}
	
	// 4. 테스크 이미지 삭제 테스트
	@Test
	public void testDeleteImageTask() {
		// Given
		String space_key = "ABCD";
		int task_no = 1;
		int user_no = 1;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("space_key", space_key);
		paramMap.put("task_no", task_no);
		paramMap.put("user_no", user_no);
		// When
		boolean isDeleted = iSvc.DeleteImageTask(paramMap);
		// Then
		assertTrue("failed", isDeleted);
	}
	
	// 5. 탈퇴 회원 프로필 이미지 삭제 테스트
	@Test
	public void testDeleteImageProfile() {
		// Given
		int quit_user_no = 1;
		// When
		boolean isDeleted = iSvc.DeleteImageProfile(quit_user_no);
		// Then
		assertTrue("failed", isDeleted);
	}
}
