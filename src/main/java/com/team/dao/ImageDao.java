package com.team.dao;

import java.util.Map;

import com.team.dto.ImageDto;

public interface ImageDao {
	boolean UploadImage(ImageDto imageDto);
	boolean UpdateProfileImage(Map<String, Object> paramMap);
	boolean DeleteImageReply(Map<String, Object> paramMap);
	boolean DeleteImageTask(Map<String, Object> paramMap);
	boolean DeleteImageProfile(int quit_user_no);
}
