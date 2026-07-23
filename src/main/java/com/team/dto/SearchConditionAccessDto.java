package com.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SearchConditionAccessDto {
	int searchConditionNo;
	int currentUserNo;
	int accessUserNo;
	String accessSpaceKey;
	String accessType;
}
