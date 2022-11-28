package com.railtavelproject.cafe.manager.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//lombok 라이브러리
@NoArgsConstructor
@Getter
@Setter
@ToString
public class CafeInfo {
	private int cafeNo; //CAFE_NO
	private String profileImg;  // PROFILE_IMG;
	private String mainHeaderImg;  // CAFE_MAIN_HEADER_IMG;
	private String topFrontImg;  // CAFE_TOP_FRONT_IMG;
	private String bottomFrontImg;  // CAFE_BOTTOM_FRONT_IMG;
	private String cafeJoinFL;  // CAFE_JOIN_FL;
}
