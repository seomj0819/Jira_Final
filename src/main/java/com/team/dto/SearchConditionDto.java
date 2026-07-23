package com.team.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SearchConditionDto {
	private int currentUserNo;
	private int searchConditionNo;
	private String searchConditionTitle;
	private String searchConditionDescription;

	private String operatorSpace;
	private List<String> spaceKeys;

	private String operatorWorker;
	private List<Integer> workerNos;

	private String operatorCreator;
	private List<Integer> creatorNos;

	private String operatorPriority;
	private List<String> priorities;

	private String operatorStatus;
	private List<Integer> statusNos;

	private String operatorDueDate;
	private List<String> dueDates; 

	private int accessUserNo;
	private String accessSpaceKey;
	private String accessType;
	private String favorite;
}
