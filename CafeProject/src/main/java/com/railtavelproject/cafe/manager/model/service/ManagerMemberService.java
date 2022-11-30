package com.railtavelproject.cafe.manager.model.service;

import java.util.List;
import java.util.Map;

//설계, 유지보수성 향상, AOP 때문에
public interface ManagerMemberService {

	int memberCount();

	int boardCount();

	Map<String, Object> selectMemberList(int limit, int cp);

	Map<String, Object> selectSortLevelMemberList(int memberLevelNoResult,int limit, int cp);

	Map<String, Object> selectInputMember(int srchOption, String inputMember, int limit, int cp);

	Map<String, Object> selectDetailBoard(int periodOption, int articleCountInput, int aboveOption,
			int memberLevelNoResult, int limit, int cp);

	Map<String, Object> selectDetailComment(int periodOption, int commentCountInput, int aboveOption,
			int memberLevelNoResult, int limit, int cp);

	Map<String, Object> selectDetailVisitCount(int periodOption, int visitCountInput, int aboveOption,
			int memberLevelNoResult, int limit, int cp);

	Map<String, Object> selectDetailDate(int entryType, String startDateInput, String endDateInput,
			int memberLevelNoResult, int limit, int cp);

	Map<String, Object> selectStopMemberList(int limit, int cp, String memberEmail);

	int stopMemberCount();

	Map<String, Object> forcedSecessionMemberList(int limit, int cp, String memberEmail);

	int forcedSecessionMemberCount();

	String updateMemberLevelNo(List<String> memberEmail, int memberLevelNo,int memberCount) throws Exception;

	String updateActivityStopMember(List<String> memberEmail, String comment, int memberCount, int HmemberNo) throws Exception;



}
