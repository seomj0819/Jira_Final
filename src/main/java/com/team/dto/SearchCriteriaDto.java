package com.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SearchCriteriaDto {
	int currentUserNo;
	String searchSpaceKey;
	String searchKeyWord;
	int searchCreatorNo;
	int searchWorkerNo;
	String searchPriority;
	String searchStatus;
	String searchDueDate;
}
