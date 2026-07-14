package com.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TaskSimpleInfoDto {
	String spaceKey;
	int taskNo;
	int workerNo;
	String taskTitle;
	String dueDate;
	String labelTitle;
	int statusNo;
	String priority;
	int taskOrder;
}
