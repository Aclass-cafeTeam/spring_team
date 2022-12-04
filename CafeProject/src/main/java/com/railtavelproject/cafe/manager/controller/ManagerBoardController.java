package com.railtavelproject.cafe.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.railtavelproject.cafe.manager.model.service.ManagerBoardService;


@Controller
public class ManagerBoardController {
	@Autowired
	private ManagerBoardService service;
}


