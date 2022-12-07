package com.railtavelproject.cafe.manager.model.service;

import java.util.List;
import java.util.Map;

import com.railtavelproject.cafe.manager.model.vo.Member;

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

	/** 멤버 등급 변경 기능(팝업)
	 * @param memberEmail
	 * @param memberLevelNo
	 * @param memberCount
	 * @return
	 * @throws Exception
	 */
	String updateMemberLevelNo(List<String> memberEmail, int memberLevelNo,int memberCount) throws Exception;

	/** 활동 정지 기능 팝업창
	 * @param memberEmail
	 * @param comment
	 * @param memberCount
	 * @param HmemberNo
	 * @return
	 * @throws Exception
	 */
	String updateActivityStopMember(List<String> memberEmail, String comment, int memberCount, int HmemberNo) throws Exception;

	/** 강제 탈퇴 기능 팝업 창
	 * @param memberEmail
	 * @param comment
	 * @param memberCount
	 * @param secessionreason
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	String ManageSecedePopup(List<String> memberEmail, String comment, int memberCount, String secessionreason,
			int memberNo)throws Exception;

	/**활동 정지 해제 기능
	 * @param memberEmail
	 * @param memberCount
	 * @return
	 * @throws Exception
	 */
	String updateReleaseStopMember(List<String> memberEmail, int memberCount) throws Exception;

	/** 재 가입 가능하게 변경 기능
	 * @param memberEmail
	 * @param memberCount
	 * @return
	 * @throws Exception
	 */
	String updateReleaseSecedeMember(List<String> memberEmail, int memberCount) throws Exception;

	/** 재 가입 불가 기능
	 * @param memberEmail
	 * @param memberCount
	 * @return
	 */
	String updateNotReleaseSecede(List<String> memberEmail, int memberCount) throws Exception;

	/**스탭 멤버 검색해오기
	 * @return
	 */
	List<Map<String, Object>> manageCafeStaffView();

	/**부매니저 시킬 사람 검색해오기
	 * @param searchType
	 * @param searchMember
	 * @return
	 */
	Member manageSearchCafeMember(int searchType, String searchMember);

	/**스탭 카운트
	 * @return
	 */
	int manageCafeStaffViewCount();

	/**부매니저 임명하기(부매니저가 없을 시 화면에서 조건문으로 다 막아 놓았지만 다시 한번 컨트롤에서 확인함)
	 * @param electedStaffId
	 * @return
	 */
	int updateSubManagerSelect(String electedStaffId);

	/**부매니저 삭제하기
	 * @param subManagerDelete
	 * @return
	 */
	int deleteSubManagerSelect(String subManagerDelete);

	/** 등업 스케줄러 검색
	 * @return
	 */
	List<Member> selectMemberListALL();


}
