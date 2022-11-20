package com.railtavelproject.cafe.manager.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.railtavelproject.cafe.manager.model.service.ManagerMemberService;
import com.railtavelproject.cafe.manager.model.vo.Member;

@Controller
public class ManagerMemberController {
	@Autowired
	private ManagerMemberService service;
	
	//전체멤버관리 페이지로 이동
		@GetMapping("/manager/sortMemberLevel")
		public String totalMemberManagerPage(Member member,
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit
				,Model model,
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
			System.out.println(limit);
			System.out.println(memberLevelNoResult);
			Map<String, Object> map = service.selectSortLevelMemberList(memberLevelNoResult,limit, cp);
			
			System.out.println(limit);
			
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			System.out.println(map.get("memberList"));
			System.out.println(map.get("pagination"));
			System.out.println(memberLevelNoResult);
			return "manager/totalMemberManager";
		}
}