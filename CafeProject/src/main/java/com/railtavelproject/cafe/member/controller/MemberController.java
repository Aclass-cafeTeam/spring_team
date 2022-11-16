package com.railtavelproject.cafe.member.controller;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railtavelproject.cafe.member.model.service.MemberService;
import com.railtavelproject.cafe.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember","message"})
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
			path = "/"; // 메인페이지
			
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
}
