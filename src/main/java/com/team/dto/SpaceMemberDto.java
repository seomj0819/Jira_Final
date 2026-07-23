package com.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SpaceMemberDto {
	String spaceKey;
	int userNo;
	String userRole;
	String inviteCode;
	String expireDate;
}
