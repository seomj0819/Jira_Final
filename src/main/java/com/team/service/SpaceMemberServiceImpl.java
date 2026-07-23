package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dao.SpaceMemberDao;
import com.team.dto.SpaceMemberDto;
import com.team.dto.UserInfoDto;

@Service
public class SpaceMemberServiceImpl implements SpaceMemberService{
	@Autowired
	SpaceMemberDao spaceMemberDao;
	
	@Override
	public boolean isSpaceMemberDuplicate(String spaceKey, int userNo) {
		SpaceMemberDto dto = new SpaceMemberDto();
		dto.setSpaceKey(spaceKey);
		dto.setUserNo(userNo);
		return spaceMemberDao.isSpaceMemberDuplicate(dto);
	}

	@Override
	public void insertInviteCode(SpaceMemberDto dto) {
		spaceMemberDao.insertInviteCode(dto);
	}

	@Override
	public boolean checkInviteCode(SpaceMemberDto dto) {
		int temp = spaceMemberDao.checkInviteCode(dto);
		boolean chk = temp == 1? true: false;
		if(chk) {
			spaceMemberDao.updateSpaceMember(dto);
		}
		else {
			spaceMemberDao.deleteSpaceMember(dto);
		}
		
		return chk;
	}

	@Override
	public String searchUserRoll(SpaceMemberDto dto) {
		return spaceMemberDao.searchUserRole(dto);
	}

	@Override
	public void deleteSpaceMember(SpaceMemberDto dto) {
		spaceMemberDao.deleteSpaceMember(dto);
	}

	@Override
	public List<UserInfoDto> getSpaceMembers(int currentUserNo) {
		return spaceMemberDao.getSpaceMembers(currentUserNo);
	}

	@Override
	public List<UserInfoDto> getAllSpaceMembers(String spaceKey) {
		return spaceMemberDao.getAllSpaceMembers(spaceKey);
	}

	@Override
	public List<SpaceMemberDto> getSpacesByUserNo(int userNo) {
		return spaceMemberDao.getSpacesByUserNo(userNo);
	}

}
