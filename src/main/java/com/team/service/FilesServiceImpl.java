package com.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.FilesDao;
import com.team.dto.FilesDto;

@Service
public class FilesServiceImpl implements FilesService {
	@Autowired
	FilesDao filesDao;
	@Override
	public boolean UploadFile(FilesDto filesDto) {
		return filesDao.UploadFile(filesDto);
	}

}
