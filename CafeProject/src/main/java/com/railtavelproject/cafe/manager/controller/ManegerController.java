package com.railtavelproject.cafe.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.railtavelproject.cafe.manager.model.service.ManagerMemberService;

@Controller
public class ManegerController {
	
	@Autowired
	private ManagerMemberService service;
	
	//managerMain 이동
	@GetMapping("/manager/managerMain")
	public String managerMainPage(HttpServletRequest req) {
		int mainMemberCount = service.memberCount();
		int mainBoardCount = service.boardCount();
		req.setAttribute("memberCount", mainMemberCount);
		req.setAttribute("boardCount", mainBoardCount);
		return "manager/managerMain";
	}
	
	//전체멤버관리 페이지로 이동
	@GetMapping("/manager/totalMemberManager")
	public String totalMemberManagerPage() {
		return "manager/totalMemberManager";
	}

}
