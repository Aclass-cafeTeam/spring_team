package com.railtavelproject.cafe.manager.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.railtavelproject.cafe.manager.model.service.ManagerMemberService;
import com.railtavelproject.cafe.manager.model.vo.Member;

@Controller
@SessionAttributes({"map"})
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
	public String totalMemberManagerPage(Member member,
			@RequestParam(value="limit" , required = false, defaultValue = "15")int limit,
			@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult
			,Model model,
			@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
		
		Map<String, Object> map = service.selectMemberList(limit, cp);
		
		System.out.println(limit);
		
		model.addAttribute("map",map);  //request scope 세팅
		model.addAttribute("memberLevelNoResult", memberLevelNoResult);
		System.out.println(map.get("memberList"));
		System.out.println(map.get("pagination"));
		return "manager/totalMemberManager";
	}
	
}
