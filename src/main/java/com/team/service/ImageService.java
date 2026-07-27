package com.team.service;

import java.util.Map;

import com.team.dto.ImageDto;

public interface ImageService {
	boolean UploadImage(ImageDto imageDto);
	boolean UpdateProfileImage(Map<String, Object> paramMap);
	boolean DeleteImageReply(Map<String, Object> paramMap);
	boolean DeleteImageTask(Map<String, Object> paramMap);
	boolean DeleteImageProfile(int quit_user_no);
}
