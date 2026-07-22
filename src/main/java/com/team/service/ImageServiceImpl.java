package com.team.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.ImageDao;
import com.team.dto.ImageDto;

@Service
public class ImageServiceImpl implements ImageService {
	@Autowired
	ImageDao imageDao;
	
	@Override
	public boolean UploadImage(ImageDto imageDto) {
		return imageDao.UploadImage(imageDto);
	}

	@Override
	public boolean UpdateProfileImage(Map<String, Object> paramMap) {
		return imageDao.UpdateProfileImage(paramMap);
	}

	@Override
	public boolean DeleteImageReply(Map<String, Object> paramMap) {
		return imageDao.DeleteImageReply(paramMap);
	}

	@Override
	public boolean DeleteImageTask(Map<String, Object> paramMap) {
		return imageDao.DeleteImageTask(paramMap);
	}

	@Override
	public boolean DeleteImageProfile(int quit_user_no) {
		return imageDao.DeleteImageProfile(quit_user_no);
	}

}
