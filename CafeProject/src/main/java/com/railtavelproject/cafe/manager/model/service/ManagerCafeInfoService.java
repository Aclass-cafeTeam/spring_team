package com.railtavelproject.cafe.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.railtavelproject.cafe.manager.model.vo.CafeInfo;
import com.railtavelproject.cafe.manager.model.vo.Member;

public interface ManagerCafeInfoService {

	int updateCafeProfile(String webPath, String filePath, MultipartFile profileImage, CafeInfo cafeInfo) throws Exception;

	CafeInfo searchCafeInfo();

	int updateJoin(String join_get);

	List<CafeInfo> selectmemberLevel();

	/**멤버 등업 조건 업데이트
	 * @param cafeInfo
	 * @return
	 */
	int updateMemberLevelTable(List<Object> cafeInfo);

	/** 멤버 등업 스케줄러
	 * @param seccessMember
	 * @return
	 */
	int LevelUPSchedulingUpdate(List<Member> seccessMember);

}
