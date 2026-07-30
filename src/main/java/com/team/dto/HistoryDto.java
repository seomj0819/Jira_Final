package com.team.dto;

public class HistoryDto {
	private int historyNo;
	private String spaceKey;
	private int taskNo;
	private Integer replyNo;
	private int userNo;
	private String fieldName;
	private String actionType;
	private String createdAt;
	private String oldValue;
	private String newValue;

	public HistoryDto(int historyNo, String spaceKey, int taskNo, Integer replyNo, int userNo, String fieldName,
			String actionType, String createdAt, String oldValue, String newValue) {
		this.setHistoryNo(historyNo);
		this.setSpaceKey(spaceKey);
		this.setTaskNo(taskNo);
		this.setReplyNo(replyNo);
		this.setUserNo(userNo);
		this.setFieldName(fieldName);
		this.setActionType(actionType);
		this.setCreatedAt(createdAt);
		this.setOldValue(oldValue);
		this.setNewValue(newValue);
	}

	public int getHistoryNo() {
		return historyNo;
	}

	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}

	public String getSpaceKey() {
		return spaceKey;
	}

	public void setSpaceKey(String spaceKey) {
		this.spaceKey = spaceKey;
	}

	public int getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}

	public Integer getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(Integer replyNo) {
		this.replyNo = replyNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getOldValue() {
		return oldValue;
	}

	public void setOldValue(String oldValue) {
		this.oldValue = oldValue;
	}

	public String getNewValue() {
		return newValue;
	}

	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}

	public HistoryDto() {}

	@Override
	public String toString() {
		return "HistoryDto [history_no = " + historyNo + ", space_key = " + spaceKey + ", task_no = " + taskNo
				+ ", reply_no = " + replyNo + ", user_no = " + userNo + ", field_name = " + fieldName
				+ ", action_type = " + actionType + ", created_at = " + createdAt + ", old_value = " + oldValue
				+ ", new_value = " + newValue + "]";
	}

}
