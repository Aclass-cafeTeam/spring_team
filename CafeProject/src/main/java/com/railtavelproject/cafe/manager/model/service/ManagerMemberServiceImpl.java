package com.railtavelproject.cafe.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.manager.model.dao.ManagerMemberDAO;

@Service
public class ManagerMemberServiceImpl implements ManagerMemberService{
	@Autowired
	private ManagerMemberDAO dao;
}
