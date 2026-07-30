package com.team.dto;

public class ColorDto {
	private String colorName;
	private String colorCode;
	
	public ColorDto(String colorName, String colorCode) {
		this.colorName = colorName;
		this.colorCode = colorCode;
	}
	
	public ColorDto() {}
	
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public String getColorCode() {
		return colorCode;
	}
	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	
}
