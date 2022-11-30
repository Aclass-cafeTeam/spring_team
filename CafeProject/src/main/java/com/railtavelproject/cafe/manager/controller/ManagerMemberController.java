package com.railtavelproject.cafe.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.railtavelproject.cafe.manager.model.service.ManagerMemberService;
import com.railtavelproject.cafe.manager.model.vo.CafeInfo;
import com.railtavelproject.cafe.manager.model.vo.Member;

@Controller
@SessionAttributes({"memberCount","memberLevelNoResult","limit","memberLevel","loginMember"})
public class ManagerMemberController {
	@Autowired
	private ManagerMemberService service;
	
	//정렬
		@GetMapping("/manager/totalMemberManager/sortMemberLevel")
		public String totalMemberManagerPage(Member member,
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit,
				@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption
				,Model model,
				HttpSession session,
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
		
			Map<String, Object> map = service.selectSortLevelMemberList(memberLevelNoResult,limit, cp);
			
	
			model.addAttribute("memberCount",session.getAttribute("memberCount"));
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			model.addAttribute("limit", limit);
			model.addAttribute("srchOption", srchOption);
			model.addAttribute("memberLevel", session.getAttribute("memberLevel"));
		
			model.addAttribute("requestURL", "/sortMemberLevel");
			return "manager/totalMemberManager";
		}
		// 멤버 아이디 및 별명 검색
		@GetMapping("/manager/totalMemberManager/selectInputMember")
		public String selectInputMember(Member member,
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit,
				@RequestParam(value="inputMember" , required = true)String inputMember,
				@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption
				,Model model,
				HttpSession session,
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
	
			
			Map<String, Object> map = service.selectInputMember(srchOption,inputMember,limit, cp);
			
			
			model.addAttribute("memberCount",session.getAttribute("memberCount"));
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("inputMember",inputMember); 
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			model.addAttribute("srchOption", srchOption);
			model.addAttribute("memberLevel", session.getAttribute("memberLevel"));
			
			model.addAttribute("requestURL", "/selectInputMember");

			return "manager/totalMemberManager";
		}
		
		//게시글 상세조회 검색 //countBy=0&periodOption=1&articleCountInput=6&aboveOption=1#
		@GetMapping("/manager/totalMemberManager/selectDetailBoard")
		public String selectDetailBoard(Member member,
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,//등급별 정렬
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit, //보여지는 멤버 수 정렬
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

			if(session.getAttribute("memberLevelNoResult") != null) {
				memberLevelNoResult = (int) session.getAttribute("memberLevelNoResult");
			}
			if(session.getAttribute("limit") == null) {
				limit = 15;
			}else {
				limit = (int) session.getAttribute("limit");
			}
			
			Map<String, Object> map = service.selectDetailBoard(periodOption,articleCountInput,aboveOption,memberLevelNoResult,limit, cp);
			
			
			model.addAttribute("memberCount",session.getAttribute("memberCount"));
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			model.addAttribute("srchOption", srchOption);
			model.addAttribute("periodOption", periodOption);
			model.addAttribute("aboveOption", aboveOption);
			model.addAttribute("memberLevel", session.getAttribute("memberLevel"));
			
			model.addAttribute("requestURL", "/selectDetailBoard");

			return "manager/totalMemberManager";
		}
		
		//visitCountInput
		//댓글 상세조회 검색 //countBy=1&periodOption=1&commentCountInput=6&aboveOption=1#
		@GetMapping("/manager/totalMemberManager/selectDetailComment")
		public String selectDetailComment(
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,//등급별 정렬
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit, //보여지는 멤버 수 정렬

				@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption,   //아이디,별명 조회
				@RequestParam(value="periodOption" , required = false, defaultValue = "0") int periodOption, //0이면 전체 조회 1이면 최근 한달
				@RequestParam(value="commentCountInput" , required = false, defaultValue = "0") int commentCountInput, //멤버별 게시글 수 
				@RequestParam(value="aboveOption" , required = false, defaultValue = "1") int aboveOption, //멤버별 게시글 수 이상 or 이하
				Model model,
				HttpSession session, 
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
			
			if(session.getAttribute("memberLevelNoResult") == null) {
				memberLevelNoResult = 0;
			}else {
				memberLevelNoResult = (int) session.getAttribute("memberLevelNoResult");
			}
			if(session.getAttribute("limit") == null) {
				limit = 15;
			}else {
				limit = (int) session.getAttribute("limit");
			}
			
			Map<String, Object> map = service.selectDetailComment(periodOption,commentCountInput,aboveOption,memberLevelNoResult,limit, cp);
			model.addAttribute("memberLevel", session.getAttribute("memberLevel"));
			model.addAttribute("memberCount",session.getAttribute("memberCount"));
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			model.addAttribute("srchOption", srchOption);
			model.addAttribute("periodOption", periodOption);
			model.addAttribute("aboveOption", aboveOption);
			model.addAttribute("requestURL", "/selectDetailComment");
			return "manager/totalMemberManager";
		}
		

		//방문수 상세조회 검색 //countBy=1&periodOption=1&visitCountInput=6&aboveOption=1#
		@GetMapping("/manager/totalMemberManager/selectDetailVisitCount")
		public String selectDetailVisitCount(
			@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,//등급별 정렬
			@RequestParam(value="limit" , required = false, defaultValue = "15")int limit, //보여지는 멤버 수 정렬

			@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption,   //아이디,별명 조회
			@RequestParam(value="periodOption" , required = false, defaultValue = "0") int periodOption, //0이면 전체 조회 1이면 최근 한달
			@RequestParam(value="visitCountInput" , required = false, defaultValue = "0") int visitCountInput, //멤버별 게시글 수 
			@RequestParam(value="aboveOption" , required = false, defaultValue = "1") int aboveOption, //멤버별 게시글 수 이상 or 이하
			Model model,
			HttpSession session, 
			@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
					
			if(session.getAttribute("memberLevelNoResult") == null) {
				memberLevelNoResult = 0;
			}else {
				memberLevelNoResult = (int) session.getAttribute("memberLevelNoResult");
				}
			if(session.getAttribute("limit") == null) {
				limit = 15;
			}else {
				limit = (int) session.getAttribute("limit");
			}
					
			Map<String, Object> map = service.selectDetailVisitCount(periodOption,visitCountInput,aboveOption,memberLevelNoResult,limit, cp);
			model.addAttribute("memberLevel", session.getAttribute("memberLevel"));		
			model.addAttribute("memberCount",session.getAttribute("memberCount"));
			model.addAttribute("map",map);  //request scope 세팅
			model.addAttribute("memberLevelNoResult", memberLevelNoResult);
			model.addAttribute("srchOption", srchOption);
			model.addAttribute("periodOption", periodOption);
			model.addAttribute("aboveOption", aboveOption);
			model.addAttribute("requestURL", "/selectDetailVisitCount");
			return "manager/totalMemberManager";
		}
		
		
		//방문수 상세조회 검색 //countBy=1&periodOption=1&visitCountInput=6&aboveOption=1#
		@GetMapping("/manager/totalMemberManager/selectDetailDate")
		public String selectDetailDate(
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,//등급별 정렬
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit, //보여지는 멤버 수 정렬

				@RequestParam(value="srchOption" , required = false, defaultValue = "0") int srchOption,   //아이디,별명 조회
				@RequestParam(value="entryType" , required = false, defaultValue = "0") int entryType, //0이면 가입일  1이면 최종 방문일 
				@RequestParam(value="startDateInput" , required = false, defaultValue = "0") String startDateInput, //날짜 부터
				@RequestParam(value="endDateInput" , required = false, defaultValue = "1") String endDateInput, //날짜 까지
				Model model,
				HttpSession session, 
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp) {
					System.out.println(startDateInput+"부터"+endDateInput+"까지 날짜");
					if(session.getAttribute("memberLevelNoResult") == null) {
						memberLevelNoResult = 0;
					}else {
						memberLevelNoResult = (int) session.getAttribute("memberLevelNoResult");
						}
					if(session.getAttribute("limit") == null) {
						limit = 15;
					}else {
						limit = (int) session.getAttribute("limit");
					}
							
					Map<String, Object> map = service.selectDetailDate(entryType,startDateInput,endDateInput,memberLevelNoResult,limit, cp);
					model.addAttribute("memberLevel", session.getAttribute("memberLevel"));
					model.addAttribute("memberCount",session.getAttribute("memberCount"));
					model.addAttribute("map",map);  //request scope 세팅
					model.addAttribute("memberLevelNoResult", memberLevelNoResult);
					model.addAttribute("srchOption", srchOption);
					model.addAttribute("entryType", entryType);
					model.addAttribute("startDateInput", startDateInput);
					model.addAttribute("endDateInput", endDateInput);
					model.addAttribute("requestURL", "/selectDetailDate");
					return "manager/totalMemberManager";
		}
		
		//팝업창(멤버등급 변경)으로 가기
		@RequestMapping("/manager/ManageLevelUpPopup")
		public String manageLevelUpPopup(Model model,
				HttpSession session) {
			model.addAttribute("memberLevel", session.getAttribute("memberLevel"));
			return "manager/ManageLevelUpPopup";
		}
		
		//팝업창(멤버등급 변경하기)
		@PostMapping("/updateMemberLevelNo")
		@ResponseBody
		public String selectEmail(
				@RequestParam(value="memberEmail[]") List<String> memberEmail, 
	            @RequestParam(value="comment") String comment,
	            @RequestParam(value="memberCount") int memberCount,
	            @RequestParam(value="memberLevelNo") int memberLevelNo) throws Exception {
						
			String message = service.updateMemberLevelNo(memberEmail,memberLevelNo,memberCount);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("message",message);
			map.put("memberLevelNo",memberLevelNo);	
			map.put("memberCount",memberCount);	
			map.put("memberEmail",memberEmail);	
			// GSON 라이브러리를 이용해서 Member 객체 -> JSON 변환(String)
			return new Gson().toJson(map);
		}
		
		//팝업창(활동 정지)으로 가기
		@RequestMapping("/manager/ManageActivityStopPopup")
		public String ManageActivityStopPopup(Model model,
				HttpSession session) {
			model.addAttribute("loginMember", session.getAttribute("loginMember"));
			return "manager/ManageActivityStopPopup";
		}
		
		//팝업창(활동 정지)
		@PostMapping("/updateActivityStopMember")
		@ResponseBody
		public String updateActivityStopMember(
				@RequestParam(value="memberEmail[]") List<String> memberEmail, 
			    @RequestParam(value="comment") String comment,
			    @RequestParam(value="memberCount") int memberCount,
			    @RequestParam(value="radioNum") int radioNum,
			    @SessionAttribute("loginMember") com.railtavelproject.cafe.member.model.vo.Member loginMember,
			    HttpSession session) throws Exception {
								
					String message = service.updateActivityStopMember(memberEmail,comment,memberCount,loginMember.getMemberNo());

					//System.out.println(loginMember);
					//System.out.println(loginMember.getMemberNo());
					//System.out.println(loginMember.getMemberEmail());
					//System.out.println(loginMember.getAuthorityName());
					//System.out.println(loginMember.getAuthorityNo());
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("message",message);
					map.put("radioNum",radioNum);	
					map.put("memberCount",memberCount);	
					map.put("memberEmail",memberEmail);	
					// GSON 라이브러리를 이용해서 Member 객체 -> JSON 변환(String)
	
					return new Gson().toJson(map);
		}
		
		//팝업창(강제 탈퇴)으로 가기
		@RequestMapping("/manager/ManageSecedePopup")
		public String ManageSecedePopup(Model model,
				HttpSession session) {
				model.addAttribute("loginMember", session.getAttribute("loginMember"));
				return "manager/ManageSecedePopup";
		}
		
		//팝업창(강제 탈퇴)
		@PostMapping("/ManageSecedePopup")
		@ResponseBody
		public String ManageSecedePopup(
					@RequestParam(value="memberEmail[]") List<String> memberEmail, 
					@RequestParam(value="comment") String comment,
					@RequestParam(value="memberCount") int memberCount,
					@RequestParam(value="radioNum") int radioNum,
					@RequestParam(value="secessionreason") String secessionreason,
					@SessionAttribute("loginMember") com.railtavelproject.cafe.member.model.vo.Member loginMember,
					HttpSession session) throws Exception {
										
							String message = service.ManageSecedePopup(memberEmail,comment,memberCount,secessionreason,loginMember.getMemberNo());

					
							Map<String, Object> map = new HashMap<String, Object>();
							map.put("message",message);
							map.put("radioNum",radioNum);	
							map.put("memberCount",memberCount);	
							map.put("memberEmail",memberEmail);	
							map.put("secessionreason",secessionreason);	
			
						return new Gson().toJson(map);
			}
				
		
		
}