package com.team.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoDto {
	int userNo;
	String email;
	String pw;
	String googleApi;
	String userName;
	int imageNo;
	String verificationCode;
	String expireDate;
}
