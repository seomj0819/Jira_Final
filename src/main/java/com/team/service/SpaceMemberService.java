package com.team.service;

import java.util.List;

import com.team.dto.SpaceMemberDto;
import com.team.dto.UserInfoDto;

public interface SpaceMemberService {
	boolean isSpaceMemberDuplicate(String spaceKey, int userNo);	// 해당 스페이스에 유저가 있는지 조회
	void insertInviteCode(SpaceMemberDto dto);	// 초대코드 생성 후 멤버 저장
	boolean checkInviteCode(SpaceMemberDto dto);	// 초대 코드 확인 후 회원정보 업데이트(성공), 회원정보 삭제(실패)
	String searchUserRoll(SpaceMemberDto dto);	// 회원 역할 조회
	void deleteSpaceMember(SpaceMemberDto dto);	// 회원 삭제
	List<UserInfoDto> getSpaceMembers(int currentUserNo);	// 해당 스페이스에 본인을 제외한 멤버 조회
	List<UserInfoDto> getAllSpaceMembers(String spaceKey);	// 해당 스페이스에 본인을 포함한 멤버 조회
}
