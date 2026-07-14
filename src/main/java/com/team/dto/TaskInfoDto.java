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
	int workerNo;
	String taskTitle;
	String taskDescription;
	String dueDate;
	String labelTitle;
	int statusNo;
	String priority;
	int UpperTaskNo;
	int taskOrder;
	int imageNo;
	String summary;
}
