package com.railtavelproject.cafe.main.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.main.model.dao.IntroDAO;
import com.railtavelproject.cafe.main.model.vo.IntroBoard;

@Service
public class IntroServiceImpl implements IntroService{
	
	@Autowired
	private IntroDAO dao;

	// 전체글 불러오기
	@Override
	public Map<String, Object> introBoardList() {

		List<IntroBoard> introBoardList = dao.introBoardList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("introBoardList", introBoardList);
		
		return map;
	}
	

}
