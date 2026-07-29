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
	Integer currentUserNo;

	String searchKeyWord;

	String searchSpaceKey;
	String operatorSpace;      // "=" or "!="

	Integer searchCreatorNo;
	String operatorCreator;    // "=" or "!="
	
	Integer searchWorkerNo;
	String operatorWorker;     // "=" or "!="

	String searchPriority;
	String operatorPriority;   // "=" or "!="

	Integer searchStatusNo;
	String operatorStatusNo;     // "=" or "!="

	String searchDueDate;
	String operatorDueDate;    // ">=" or "<="
}
