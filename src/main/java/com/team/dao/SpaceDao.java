package com.team.dao;

import java.util.List;
import com.team.dto.SpaceListDto;

public interface SpaceDao {
	boolean CreateSpace(SpaceListDto spaceDto);
	boolean DeleteSpaceMemberFirstly(int userNo);
	boolean DeleteSpace(String spaceKey);
	boolean UpdateSpace(String space_key, String new_space_title, String new_space_key, int user_no);
	List<SpaceListDto> ShowSpaceList(int user_no);
	SpaceListDto ShowSpaceProfile(String space_key);
}
