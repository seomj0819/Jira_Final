package com.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TaskOrderDto {
	int statusNo;
	int taskNo;
	int afterTaskOrder;
	int beforeTaskOrder;
	String spaceKey;
}
