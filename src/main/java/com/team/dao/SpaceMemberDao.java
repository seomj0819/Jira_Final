package com.team.dao;

import java.util.List;

import com.team.dto.SpaceMemberDto;
import com.team.dto.UserInfoDto;

public interface SpaceMemberDao {
	boolean isSpaceMemberDuplicate(SpaceMemberDto dto);		// 해당 스페이스에 이미 멤버가 포함되어 있는지 확인
	void insertInviteCode(SpaceMemberDto dto);				// 초대 코드 발행 및 입력
	int checkInviteCode(SpaceMemberDto dto);				// 초대 코드 확인
	void updateSpaceMember(SpaceMemberDto dto);				// SpaceMember 권한 업데이트 및 추가
	void deleteSpaceMember(SpaceMemberDto dto);				// SpaceMember 삭제
	String searchUserRole(SpaceMemberDto dto);				// 유저 권한 조회
	List<UserInfoDto> getSpaceMembers(int currentUserNo);	// 현재 유저가 포함되어있는 스페이스의 멤버 조회 (현재 접속중인 유저 제외)
	List<UserInfoDto> getAllSpaceMembers(String spaceKey);	// 해당 스페이스의 모든 멤버 조회
	List<SpaceMemberDto> getSpacesByUserNo(int userNo);		// user가 속해있는 스페이스 전체 조회
	List<UserInfoDto> searchUser(String emailInput);		// 이메일을 통해 유저 리스트 검색
}
