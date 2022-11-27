package com.railtavelproject.cafe.manager.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.railtavelproject.cafe.manager.model.service.ManagerCafeInfoService;
import com.railtavelproject.cafe.manager.model.service.ManagerMemberService;
import com.railtavelproject.cafe.manager.model.vo.CafeInfo;
import com.railtavelproject.cafe.manager.model.vo.Member;
import com.railtavelproject.cafe.member.model.service.MemberService;
import com.railtavelproject.cafe.member.model.vo.MemberLevel;

@Controller
@SessionAttributes({"memberCount","memberLevel", "cafeInfo"})
public class ManegerController {
	
	@Autowired
	private ManagerMemberService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ManagerCafeInfoService cafeInfoService;
	
	//managerjoin 이동
	@GetMapping("/manager/joinMemberManager")
	public String joinMemberManager() {
		return "manager/joinMemberManager";
	}
	
	//카페정보 이동
	@GetMapping("/manager/basicInfoManager")
	public String basicInfoManager(Model model) {
		
		CafeInfo cafeInfo = cafeInfoService.searchCafeInfo();
		
		model.addAttribute("cafeInfo",cafeInfo);
		
		return "manager/basicInfoManager";
	}
	
	//manager활동정지 이동
	@GetMapping("/manager/ActivityStopMemberManager")
	public String ActivityStopMemberManager(Member member,
			@RequestParam(value="limit" , required = false, defaultValue = "15")int limit
			,Model model,
			@RequestParam(value="cp" , required = false, defaultValue = "1") int cp,
			@RequestParam(value="search.memberId" , required = false) String memberEmail
			) {
		Map<String, Object> map = service.selectStopMemberList(limit, cp,memberEmail);
		int stopMemberCount = service.stopMemberCount();
		model.addAttribute("map",map);
		model.addAttribute("stopMemberCount",stopMemberCount);
		return "manager/ActivityStopMemberManager";
	}
	
	//managerMain 이동
	@GetMapping("/manager/managerMain")
	public String managerMainPage(HttpServletRequest req,
			Model model) {
		CafeInfo mainCafeInfo = cafeInfoService.searchCafeInfo();
	
		int mainMemberCount = service.memberCount();
		int mainBoardCount = service.boardCount();
		
		model.addAttribute("mainCafeInfo",mainCafeInfo);
		req.setAttribute("memberCount", mainMemberCount);
		model.addAttribute("memberCount", mainMemberCount);
		req.setAttribute("boardCount", mainBoardCount);
		return "manager/managerMain";
	}
	
	//전체멤버관리 페이지로 이동
	@GetMapping("/manager/totalMemberManager")
	public String totalMemberManagerPage(Member member,
			@RequestParam(value="limit" , required = false, defaultValue = "15")int limit,
			@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,
			@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption
			,Model model,
			HttpSession session,
			@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
		
		Map<String, Object> map = service.selectMemberList(limit, cp);
		List<Map<String, Object>> memberLevel = memberService.viewMemberLevel();
		model.addAttribute("map",map);
		model.addAttribute("memberCount",session.getAttribute("memberCount"));  //request scope 세팅
		model.addAttribute("memberLevelNoResult", memberLevelNoResult);
		model.addAttribute("srchOption", srchOption);
		model.addAttribute("memberLevel", memberLevel);
		System.out.println(map.get("memberList"));
		System.out.println(map.get("pagination"));
		return "manager/totalMemberManager";
	}
	
}
