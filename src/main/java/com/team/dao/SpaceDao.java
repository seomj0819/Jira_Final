package com.team.dao;

import java.util.List;
import java.util.Map;

import com.team.dto.SpaceListDto;

public interface SpaceDao {
	boolean CreateSpace(SpaceListDto spaceDto);
	boolean DeleteSpaceMemberFirstly(int userNo);
	boolean DeleteSpace(String spaceKey);
	boolean UpdateSpace(Map<String, Object> paramMap);
	List<SpaceListDto> showSpaceList(int userNo);
	SpaceListDto showSpaceProfile(String spaceKey);
}
