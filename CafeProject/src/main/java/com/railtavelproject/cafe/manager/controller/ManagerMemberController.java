package com.railtavelproject.cafe.manager.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.railtavelproject.cafe.manager.model.service.ManagerMemberService;
import com.railtavelproject.cafe.manager.model.vo.Member;

@Controller
@SessionAttributes({"memberCount","memberLevelNoResult","limit"})
public class ManagerMemberController {
	@Autowired
	private ManagerMemberService service;
	
	//정렬
		@GetMapping("/manager/sortMemberLevel")
		public String totalMemberManagerPage(Member member,
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit,
				@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption
				,Model model,
				HttpSession session,
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
			System.out.println(limit);
			System.out.println(memberLevelNoResult);
			Map<String, Object> map = service.selectSortLevelMemberList(memberLevelNoResult,limit, cp);
			
			System.out.println(limit);
			model.addAttribute("memberCount",session.getAttribute("memberCount"));
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			model.addAttribute("limit", limit);
			model.addAttribute("srchOption", srchOption);
			System.out.println(map.get("memberList"));
			System.out.println(map.get("pagination"));
			System.out.println(memberLevelNoResult);
			return "manager/totalMemberManager";
		}
		// 멤버 아이디 및 별명 검색
		@GetMapping("/manager/selectInputMember")
		public String selectInputMember(Member member,
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit,
				@RequestParam(value="inputMember" , required = true)String inputMember,
				@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption
				,Model model,
				HttpSession session,
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
			System.out.println(inputMember);
			System.out.println(memberLevelNoResult);
			
			Map<String, Object> map = service.selectInputMember(srchOption,inputMember,limit, cp);
			
			System.out.println(limit);
			model.addAttribute("memberCount",session.getAttribute("memberCount"));
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("inputMember",inputMember); 
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			model.addAttribute("srchOption", srchOption);
			
			System.out.println(map.get("memberList"));
			System.out.println(map.get("pagination"));

			return "manager/totalMemberManager";
		}
		
		//게시글 상세조회 검색
		@GetMapping("/manager/selectDetailBoard")
		public String selectDetailBoard(Member member,
				//@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,//등급별 정렬
				//@RequestParam(value="limit" , required = false, defaultValue = "15")int limit, //보여지는 멤버 수 정렬
				@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption,   //아이디,별명 조회
				@RequestParam(value="periodOption" , required = false, defaultValue = "0") int periodOption, //0이면 전체 조회 1이면 최근 한달
				@RequestParam(value="articleCountInput" , required = false, defaultValue = "0") int articleCountInput, //멤버별 게시글 수 
				@RequestParam(value="aboveOption" , required = false, defaultValue = "1") int aboveOption, //멤버별 게시글 수 이상 or 이하
				Model model,
				HttpSession session, 
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
			System.out.println(session.getAttribute("memberLevelNoResult")+"뭐야 들고 와짐??");
			System.out.println(periodOption);
			System.out.println(articleCountInput);
			System.out.println(aboveOption);
			int memberLevelNoResult = (int) session.getAttribute("memberLevelNoResult");
			int limit = (int) session.getAttribute("limit");
			Map<String, Object> map = service.selectDetailBoard(periodOption,articleCountInput,aboveOption,memberLevelNoResult,limit, cp);
			
			
			model.addAttribute("memberCount",session.getAttribute("memberCount"));
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			model.addAttribute("srchOption", srchOption);
			model.addAttribute("periodOption", periodOption);
			model.addAttribute("aboveOption", aboveOption);
			
			System.out.println(map.get("memberList"));
			System.out.println(map.get("pagination"));

			return "manager/totalMemberManager";
		}
}