package com.railtavelproject.cafe.manager.model.dao;

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
		
}
