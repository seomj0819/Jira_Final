package com.team.dto;

public class SpaceListDto {
	private String spaceKey;
	private String spaceTitle;
	private int spaceOrder;
	private String spaceStatus;
	private int imageNo;
	
	public SpaceListDto() {}
	public SpaceListDto(String spaceKey, String spaceTitle, int spaceOrder, String spaceStatus, int imageNo) {
		this.spaceKey = spaceKey;
		this.spaceTitle = spaceTitle;
		this.spaceOrder = spaceOrder;
		this.spaceStatus = spaceStatus;
		this.imageNo = imageNo;
	}
	
	public String getSpaceKey() {
		return spaceKey;
	}
	public void setSpaceKey(String spaceKey) {
		this.spaceKey = spaceKey;
	}
	
	public String getSpaceTitle() {
		return spaceTitle;
	}
	public void setSpaceTitle(String spaceTitle) {
		this.spaceTitle = spaceTitle;
	}
	
	public int getSpaceOrder() {
		return spaceOrder;
	}
	public void setSpaceOrder(int spaceOrder) {
		this.spaceOrder = spaceOrder;
	}
	
	public String getSpaceStatus() {
		return spaceStatus;
	}
	public void setSpaceStatus(String spaceStatus) {
		this.spaceStatus = spaceStatus;
	}
	
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	
	@Override
	public String toString() {
		return "SpaceListDto [spaceKey = "+ spaceKey +", spaceTitle = "+ spaceTitle +", spaceOrder = "+ spaceOrder +", spaceStatus = "+ spaceStatus +", imageNo = "+ imageNo + "]";
	}
	
	public static void main(String[] args) { 
		
	}
}
