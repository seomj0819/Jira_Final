package com.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TaskSearchDto {
	int searchConditionNo;
	String accessType;
	String searchConditionTitle;
	String searchConditionDescription;
	int currentUserNo;
	String searchKeyWord;
	int searchWorkerNo;
	String operatorWorkerNo;
	int searchCreatorNo;
	String operatorCreatorNo;
	int searchStatusNo;
	String operatorStatusNo;
	String searchSpaceKey;
	String operatorSpceKey;
	String searchPriority;
	String operatorPriority;
	String searchDueDate;
	String operatorDueDate;
}
