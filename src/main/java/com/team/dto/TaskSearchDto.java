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
	Integer searchConditionNo;
	String accessType;
	String searchConditionTitle;
	String searchConditionDescription;
	
	Integer currentUserNo;
	
	String searchKeyWord;
	
	Integer searchWorkerNo;
	String operatorWorkerNo;
	
	Integer searchCreatorNo;
	String operatorCreatorNo;
	
	Integer searchStatusNo;
	String operatorStatusNo;
	
	String searchSpaceKey;
	String operatorSpaceKey;
	
	String searchPriority;
	String operatorPriority;
	
	String searchDueDate;
	String operatorDueDate;
}
