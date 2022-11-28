package com.railtavelproject.cafe.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardCrudDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 태그 조회
	public List<Map<String, Object>> selectTitleTag() {
		return sqlSession.selectList("boardCrudMapper.selectTitleTag");
	}

	// 글양식 조회
	public List<Map<String, Object>> selectWritingFormType() {
		return sqlSession.selectList("boardCrudMapper.selectWritingFormType");
	}
}
