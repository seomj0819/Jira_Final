package com.team.util;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

import com.team.dto.ColorDto;

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
	
	public static List<ColorDto> getColorCode() {
		List<ColorDto> colorList = new ArrayList<>();
		
		colorList.add(new ColorDto("blue", "#669DF1"));
		colorList.add(new ColorDto("gray", "#B7B9BE"));
		colorList.add(new ColorDto("green", "#94C748"));
		colorList.add(new ColorDto("red", "#E26363"));
		colorList.add(new ColorDto("yellow", "#F6F693"));
		colorList.add(new ColorDto("pink", "#FFC79E"));
		colorList.add(new ColorDto("purple", "#D8AAFF"));
		colorList.add(new ColorDto("brown", "#BE9B9B"));
		
		return colorList;
	}
}
