package com.team.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.FilesDto;

@Repository
public class FilesDaoImpl implements FilesDao {
	@Autowired
	SqlSession sqlSession;
	
	//명세 11.1
	// input : space_key, task_no, reply_no, file_name, file_path
	// output : -
	//file_name, file_path : 유저입력
	// created_at : SYSDATE
	// space_key, task_no, reply_no : current값
	@Override
	public boolean UploadFile(FilesDto filesDto) {
		boolean isUploaded = false;

		try {
			int result = sqlSession.insert("com.team.mapper.FilesMapper.uploadFile", filesDto);

			if (result > 0) {
				isUploaded = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUploaded;
	}

}
