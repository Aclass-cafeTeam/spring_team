package com.railtavelproject.cafe.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.manager.model.dao.ManagerBoardDAO;



@Service
public class ManagerBoardServiceImpl implements ManagerBoardService {
	@Autowired
	private ManagerBoardDAO dao;

	@Override
	public List<Map<String, Object>> selectBoardType() {
		
		return dao.selectBoardType();
	}
}
