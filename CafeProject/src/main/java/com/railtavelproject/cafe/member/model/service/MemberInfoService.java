package com.railtavelproject.cafe.member.model.service;

import java.util.Map;

public interface MemberInfoService {
	
	/** 회원 정보 페이지 특정 회원이 작성한 글 목록
	 * @param memberNo
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMemberBoard(int memberNo, int cp);


}
