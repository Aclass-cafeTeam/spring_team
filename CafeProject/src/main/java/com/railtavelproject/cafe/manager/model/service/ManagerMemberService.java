package com.railtavelproject.cafe.manager.model.service;

import java.util.Map;

//설계, 유지보수성 향상, AOP 때문에
public interface ManagerMemberService {

	int memberCount();

	int boardCount();

	Map<String, Object> selectMemberList(int limit, int cp);

	Map<String, Object> selectSortLevelMemberList(int memberLevelNoResult,int limit, int cp);

}
