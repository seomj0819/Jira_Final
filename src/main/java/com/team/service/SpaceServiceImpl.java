package com.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.SpaceDao;
import com.team.dto.SpaceListDto;

@Service
public class SpaceServiceImpl implements SpaceService {
	@Autowired
	SpaceDao spaceDao;

	@Override
	public boolean CreateSpace(SpaceListDto spaceDto) {
		return spaceDao.CreateSpace(spaceDto);
	}

	@Override
	public boolean DeleteSpaceMemberFirstly(int userNo) {
		return spaceDao.DeleteSpaceMemberFirstly(userNo);
	}

	@Override
	public boolean DeleteSpace(String spaceKey) {
		return spaceDao.DeleteSpace(spaceKey);
	}

	@Override
	public boolean UpdateSpace(Map<String, Object> paramMap) {
		return spaceDao.UpdateSpace(paramMap);
	}

	@Override
	public List<SpaceListDto> showSpaceList(int userNo) {
		return spaceDao.showSpaceList(userNo);
	}

	@Override
	public SpaceListDto showSpaceProfile(String spaceKey) {
		return spaceDao.showSpaceProfile(spaceKey);
	}
}
