package com.team.util;
import java.security.SecureRandom;

public class RandomCodeUtil {
	public static String generateRandomCode() {
		
		// Create Code
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		SecureRandom random = new SecureRandom();
		StringBuilder code = new StringBuilder();

		for (int i = 0; i < 6; i++) {
			int t = random.nextInt(chars.length());
			code.append(chars.charAt(t));
		}

		String verificationCode = code.toString();
		
		return verificationCode;
	}

}
