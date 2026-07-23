package com.team.dao;

import java.util.List;

import com.team.dto.SpaceMemberDto;
import com.team.dto.UserInfoDto;

public interface SpaceMemberDao {
	boolean isSpaceMemberDuplicate(SpaceMemberDto dto);
	void insertInviteCode(SpaceMemberDto dto);
	int checkInviteCode(SpaceMemberDto dto);
	void updateSpaceMember(SpaceMemberDto dto);
	void deleteSpaceMember(SpaceMemberDto dto);
	String searchUserRole(SpaceMemberDto dto);
	List<UserInfoDto> getSpaceMembers(int currentUserNo);
	List<UserInfoDto> getAllSpaceMembers(String spaceKey);
	List<SpaceMemberDto> getSpacesByUserNo(int userNo);
}
