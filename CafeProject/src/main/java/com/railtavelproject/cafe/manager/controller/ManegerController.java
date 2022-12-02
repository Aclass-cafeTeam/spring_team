package com.railtavelproject.cafe.manager.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.railtavelproject.cafe.manager.model.service.ManagerCafeInfoService;
import com.railtavelproject.cafe.manager.model.service.ManagerMemberService;
import com.railtavelproject.cafe.manager.model.vo.CafeInfo;
import com.railtavelproject.cafe.manager.model.vo.Member;
import com.railtavelproject.cafe.member.model.service.MemberService;
import com.railtavelproject.cafe.member.model.vo.MemberLevel;

@Controller
@SessionAttributes({"memberCount","memberLevel", "mainCafeInfo","loginMember"})
public class ManegerController {
	
	@Autowired
	private ManagerMemberService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ManagerCafeInfoService cafeInfoService;
	
	//managerjoin 이동
	@GetMapping("/manager/joinMemberManager")
	public String joinMemberManager(@SessionAttribute("mainCafeInfo") CafeInfo cafeInfo, /* 카페 정보 */
			Model model) {
		
		model.addAttribute("cafeInfo",cafeInfo);
		return "manager/joinMemberManager";
	}
	
	//카페정보 이동
	@GetMapping("/manager/basicInfoManager")
	public String basicInfoManager(@SessionAttribute("mainCafeInfo") CafeInfo cafeInfo, 
			Model model) {
		
		/* CafeInfo cafeInfo = cafeInfoService.searchCafeInfo(); */
		
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
	
	//manager강제 탈퇴 이동
	@GetMapping("/manager/ForcedSecessionMemberManager")
	public String ForcedSecessionMemberManager(Member member,
				@RequestParam(value="limit" , required = false, defaultValue = "15")int limit
				,Model model,
				@RequestParam(value="cp" , required = false, defaultValue = "1") int cp,
				@RequestParam(value="search.memberId" , required = false) String memberEmail
				) {
		Map<String, Object> map = service.forcedSecessionMemberList(limit, cp,memberEmail);
		int forcedSecessionMemberCount = service.forcedSecessionMemberCount();
		model.addAttribute("map",map);
		model.addAttribute("forcedSecessionMemberCount",forcedSecessionMemberCount);
		return "manager/ForcedSecessionMemberManager";
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
	//스탭 관리 페이지로 이동
	@GetMapping("/manager/ManageCafeStaffView")
	public String manageCafeStaffView(Member member,
			@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,
			@RequestParam(value="searchType" , required = false, defaultValue = "-1") int searchType,
			@RequestParam(value="SearchMember" , required = false) String SearchMember
			,Model model,
			HttpSession session){ //세션으로 로그인 멤버들고 와서 카페 관리자만 삭제 버튼 보여줘고 부관리자는 스탭관리창에서 할수 있는 게 없움
			// 별명 아이디로 검색 할 수 있게 해야하고 체크박스 값 들고 와야하고 
			// input 값 들고 와야함 //로그인 세션이랑 //검색했을 때 권한이나 멤버 등급도 무조건 같이 들고 와야함
			// 전체 매니저는 무조건 조건할 거고 부 매니저가 있는 지 없는 지 판단 해서 들고 있어야함
		
			// 검색한 값 부 관리자가 없으면 부매니저로 추가 가능 
			// 부 매니저는 1명만 가능하기 때문에 카페 매니저만 부 매니저를 삭제하고 추가할 수 있음
			
			// 1. 로그인 세션을 들고 가서 부매니저 추가 삭제 할때 할 수 있는 지 조건 
			// 2. 부매니저랑 전체 매니저 처음에 검색 해서 가고 전체 매니저는 삭제버튼 존재X 부 매니저는 로그인 화면이 전체 매니저일때 삭제버튼 O
			// 3. 부 매니저가 있을 시 스텝 추가 기능에 부 매니저는 한명만 가능 alert창 
			// 4. 

			List<Map<String, Object>> stepMember = service.manageCafeStaffView();
			
			//int stepMemberCount = memberService.manageCafeSaffCount();
			/*
			 * Member searchMemberResult = null; if(searchType != -1 ) { searchMemberResult
			 * = service.manageSearchCafeMember(searchType,SearchMember); }
			 */
			
			int stepMemberCount = service.manageCafeStaffViewCount(); 
			// 세션에 한번 들어가면 세션에서 꺼내쓰면 된다
			//model.addAttribute("loginMember",session.getAttribute("loginMember"));  //
			model.addAttribute("stepMember", stepMember);
			//model.addAttribute("searchMember", searchMemberResult);
			model.addAttribute("stepMemberCount", stepMemberCount);
			model.addAttribute("searchType", searchType);
			//model.addAttribute("stepMember", stepMember);
			
			return "manager/ManageCafeStaffView";
	}
	
	//스탭 관리 멤버 검색
		@PostMapping("/SearchMemberStepView")
		@ResponseBody
		public String SearchMemberStepView(Member member,
				@RequestParam(value="memberLevelNo" , required = false, defaultValue = "0") int memberLevelNoResult,
				@RequestParam(value="searchType" , required = false, defaultValue = "-1") int searchType,
				@RequestParam(value="SearchMember" , required = false) String SearchMember
				,Model model,
				HttpSession session){ 

				Member searchMemberResult = null;
				if(searchType != -1 ) {
					searchMemberResult = service.manageSearchCafeMember(searchType,SearchMember);
				}
				
				System.out.println(searchMemberResult);
				//model.addAttribute("searchMember", searchMemberResult);

				//model.addAttribute("stepMember", stepMember);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("searchMemberResult",searchMemberResult);
				return new Gson().toJson(map);
		}
		
		
		//manager등급관리
		@GetMapping("/manager/gradeMemberManager")
		public String gradeMemberManager() {
		
			return "manager/gradeMemberManager";
		}

}
