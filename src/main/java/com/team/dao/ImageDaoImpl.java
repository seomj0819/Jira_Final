package com.team.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.ImageDto;

@Repository
public class ImageDaoImpl implements ImageDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean UploadImage(ImageDto imageDto) {
		boolean isUploaded = false;

		try {
			int result = sqlSession.insert("com.team.mapper.ImageMapper.uploadImage", imageDto);
			
			if (result > 0) {
				isUploaded = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUploaded;
	}

	@Override
	public boolean UpdateProfileImage(Map<String, Object> paramMap) {
		boolean isUpdated = false;

		try {
			int result = sqlSession.update("com.team.mapper.ImageMapper.updateProfileImage", paramMap);

			if (result > 0) {
				isUpdated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdated;
	}

	@Override
	public boolean DeleteImageReply(Map<String, Object> paramMap) {
		boolean isDeleted = false;

		try {
			int result = sqlSession.delete("com.team.mapper.ImageMapper.deleteImageReply", paramMap);

			if (result > 0) {
				isDeleted = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDeleted;
	}

	@Override
	public boolean DeleteImageTask(Map<String, Object> paramMap) {
		boolean isDeleted = false;

		try {
			int result = sqlSession.delete("com.team.mapper.ImageMapper.deleteImageTask", paramMap);

			if (result > 0) {
				isDeleted = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDeleted;
	}

	@Override
	public boolean DeleteImageProfile(int quit_user_no) {
		boolean isDeleted = false;

		try {
			int result = sqlSession.delete("com.team.mapper.ImageMapper.deleteImageProfile", quit_user_no);

			if (result > 0) {
				isDeleted = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDeleted;
	}

}
