package com.railtavelproject.cafe.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.board.model.dao.BoardCrudDAO;

@Service
public class BoardCrudServiceImpl implements BoardCrudService{
	
	@Autowired
	private BoardCrudDAO dao;

	// 태그 조회
	@Override
	public List<Map<String, Object>> selectTitleTag() {
		return dao.selectTitleTag();
	}

	// 글양식 조회
	@Override
	public List<Map<String, Object>> selectWritingFormType() {
		return dao.selectWritingFormType();
	}
	
}
