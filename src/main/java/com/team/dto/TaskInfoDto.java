package com.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TaskInfoDto {
	String spaceKey;
	int taskNo;
	int creatorNo;
	Integer workerNo;
	String taskTitle;
	String taskDescription;
	String dueDate;
	String labelTitle;
	int statusNo;
	String priority;
	Integer UpperTaskNo;
	int taskOrder;
	Integer imageNo;
	String summary;
}
