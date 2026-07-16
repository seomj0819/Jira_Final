package com.team.service;

import com.team.dto.SpaceListDto;

public interface SpaceService {
	boolean CreateSpace(SpaceListDto spaceDto);
	boolean DeleteSpaceMemberFirstly(int userNo);
	boolean DeleteSpace(String spaceKey);
}
