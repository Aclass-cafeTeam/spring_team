package com.railtavelproject.cafe.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.main.model.vo.IntroBoard;

@Repository
public class IntroDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 인트로 전체글보기
	 * @return
	 */
	public List<IntroBoard> introBoardList() {
		RowBounds rowBounds = new RowBounds(0, 25);
		return sqlSession.selectList("introMapper.selectBoardList", null ,rowBounds);
	}

}
