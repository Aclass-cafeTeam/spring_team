package com.railtavelproject.cafe.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.manager.model.dao.ManagerBoardDAO;
import com.railtavelproject.cafe.manager.model.vo.Board;



@Service
public class ManagerBoardServiceImpl implements ManagerBoardService {
	@Autowired
	private ManagerBoardDAO dao;

	/**게시판 종류 검색하기
	 *
	 */
	@Override
	public Map<String, Object> selectBoardType() {
		List<Board> boardType = dao.selectBoardType();
		List<Board> mainCategory = dao.selectMainCategory();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardType", boardType);
		map.put("mainCategory",mainCategory);
		return map;
	}
}
