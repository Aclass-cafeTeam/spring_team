package com.railtavelproject.cafe.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository //DB 연결하는 역할 + bean 등록
public class ManagerMemberDAO {
	
	@Autowired //같은 자료형
	private SqlSessionTemplate sqlsession;
	
}
