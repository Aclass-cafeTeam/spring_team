package com.railtavelproject.cafe.manager.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.manager.model.vo.CafeInfo;

@Repository //DB 연결하는 역할 + bean 등록
public class ManagerCafeInfoDAO {
	@Autowired //같은 자료형
	private SqlSessionTemplate sqlSession;

	public int updateCafeProfile(CafeInfo cafeInfo) {
		return sqlSession.update("managerCafeMapper.updateCafeProfile", cafeInfo);
	}

	public CafeInfo searchCafeInfo() {
		
		return sqlSession.selectOne("managerCafeMapper.searchCafeInfo");
	}

	public int updateJoin(String join_get) {
		return sqlSession.update("managerCafeMapper.updateJoin", join_get);
	}

	public List<CafeInfo> selectmemberLevel() {
		return sqlSession.selectList("managerCafeMapper.selectmemberLevel");
	}

	public int updateMemberLevelTable(List<Object> cafeInfo) {
		
		return sqlSession.update("managerCafeMapper.updateMemberLevelTable", cafeInfo);
	}

	public int memberLevelUpdate(List<String> temp, int i) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("inputMember", temp);
		map.put("memberLeverNo", i);
		return sqlSession.update("managerCafeMapper.memberLevelUpdate" ,map);
	}
		
}
