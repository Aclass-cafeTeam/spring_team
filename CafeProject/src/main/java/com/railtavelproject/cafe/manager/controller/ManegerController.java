package com.railtavelproject.cafe.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ManegerController {
	
	
	//로그인 페이지 이동
	@GetMapping("/manager/managerMain")
	public String managerMainPage() {
		return "manager/managerMain";
	}
	
	//로그인 페이지 이동
	@GetMapping("/manager/totalMemberManager")
	public String totalMemberManagerPage() {
		return "manager/totalMemberManager";
	}

}
