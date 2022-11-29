package com.railtavelproject.cafe.member.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railtavelproject.cafe.member.model.service.MemberService;
import com.railtavelproject.cafe.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember","message","memberLevel"})
public class MemberController {
		
	// Service 객체 생성
	@Autowired
	private MemberService service ;


	//로그인 화면 페이지로 이동
	@GetMapping("/member/login")
	public String login() {
		return "member/login";
	}



	// 로그인
	@PostMapping("/member/login") // Post방식의 /member/login요청을 연결
	public String login(@ModelAttribute Member inputMember, 
						Model model, 
						RedirectAttributes ra,
						@RequestParam(value="saveId", required=false) String saveId, //체크박스 값 가져오기 required = false인 경우 전달된 파라미터가 없으면 null 
						HttpServletResponse resp, // 쿠키 전달용
						@RequestHeader(value="referer") String referer // 요청 이전 주소
						) {
	
		
		Member loginMember = service.login(inputMember);
		
		String path = null;  // 리다이렉트 경로를 저장할 변수
		
		// 로그인 성공과 실패에 따른 결과 -> 세션이 필요
		// 로그인 실패시 "아이디 또는 비밀번호가 일치하지 않습니다" 세션에 추가
		if(loginMember != null) { 
			
			// 로그인 이력 추가(INSERT)
			int memberNo = loginMember.getMemberNo();
			int result = service.insertLogHistory(memberNo);
			
			if (result > 0 ) {
				
				path = "/"; // 메인페이지로 이동

				loginMember.setLogHistoryCount(loginMember.getLogHistoryCount() +1); // 로그인 이력 수 +1
				model.addAttribute("loginMember", loginMember);
				
				// 쿠키 생성
				Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
				
				// 쿠키 유지 시간 지정
				if(saveId != null) { 
					cookie.setMaxAge(60 * 60 * 24 * 365);	// 1년동안 쿠키 유지
					
				} else {
					cookie.setMaxAge(0);
				}
				
				cookie.setPath("/"); 
				resp.addCookie(cookie);
				
			} 
			
		} else {
			path = referer; // 로그인 요청 전 페이지 주소(referer)
			ra.addFlashAttribute( "message", "아이디 또는 비밀번호가 일치하지 않습니다");
			
		}
		
		return "redirect:" + path;
	}
	
	
	
	// 로그아웃 
	@GetMapping("/member/logout")
	public String logout(SessionStatus status) {
		
		// session scope에 등록된 loginMember를 무효화를 위해 SessionStatus라는 별도의 객체 사용
		status.setComplete(); // SessionStatus객체의 setComplete()메서드를 통해 세션 상태를 무효화
		
		return "redirect:/";
	}
	
	

	// 회원가입 창으로 이동
	@GetMapping("/member/signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	
	// 회원가입
	@PostMapping("/member/signUp")
	public String signUp(@ModelAttribute Member member, RedirectAttributes ra, @RequestHeader("referer") String referer) {
		
		int result = service.signUp(member);
		
		String path = null; // 리다이렉트 경로 지정
		String message = null;		
		if (result > 0) {
			path = "/";
			message = member.getMemberNickname() + "님, 회원가입이 정상적으로 처리되었습니다.";
		} else {
			path = referer;
			message = "회원가입을 다시 시도해주세요.";
		}
		
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
	
	
	
	// 이메일 중복검사
	@GetMapping("/emailDupCheck")
	@ResponseBody // 반환되는 값을 jsp경로가 아닌 값 자체로 인식하여 호출한 ajax로 반환
	public Map<String, Object> emailDupCheck(String memberEmail) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 이메일 중복 검사
		int dup = service.emailDupCheck(memberEmail);
		// 강제 탈퇴 회원 검사 (가입불가)
		int secession = service.secessionCheck(memberEmail);
		map.put("dup", dup);
		map.put("secession", secession);
		return map;
	}
	
	
	// 닉네임 중복검사
	@GetMapping("/nickDupCheck")
	@ResponseBody
	public int nickDupCheck(String memberNickname) {	
		return service.nickDupCheck(memberNickname);
	}
	
	
	// MemberController에서 발생하는 모든 예외를 하나의 메서드에 모아서 처리
	// @ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		// Exception e : 발생한 예외를 전달 받는 매개변수
		e.printStackTrace();
		
		model.addAttribute("errorMessage","회원 관련 서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e", e);
		
		return "common/error";
	}
	
	
	// 멤버등급 안내보기
	@GetMapping("/cafe/memberLevel")
	public String viewMemberLevel(Model model) {
		
		List<Map<String, Object>> memberLevel = service.viewMemberLevel();
		model.addAttribute("memberLevel",memberLevel);
		
		return "member/viewMemberLevel";
	}

	
}
