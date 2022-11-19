package com.railtavelproject.cafe.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railtavelproject.cafe.member.model.service.MyPageService;
import com.railtavelproject.cafe.member.model.vo.Member;


@RequestMapping("/member/myPage")
@SessionAttributes("loginMember") // 탈퇴 성공 시 로그아웃에 사용
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	//마이 페이지 메인(내정보)
	@GetMapping("/info")
	public String myPage() {
		return "member/myPage-main";
	}
	
	// 마이페이지 프로필 이미지
	@GetMapping("/profile")
	public String myPageProfile() {
		return "member/myPage-profile";
	}
	
	//회원 탈퇴
	@GetMapping("/secession")
	public String secession() {
		return "member/myPage-secession";
	}
	
	//회원 탈퇴 
	@PostMapping("/secession")
	public String secession(
			@SessionAttribute("loginMember") Member loginMember,
			String memberPw,
			SessionStatus status,
			RedirectAttributes ra
			){
		
		// 서비스 호출 후 결과 반환 받기
		int result = service.secession(loginMember.getMemberNo(), memberPw);
		
		String message = null;
		String path = null;
		
		if(result > 0) { // 탈퇴 성공
			message = "회원 탈퇴 완료!";
			path = "/"; // 메인페이지로 이동
			
			// 로그아웃 코드
			status.setComplete();
			
		} else { // 탈퇴 실패
			message = "비밀번호가 일치하지 않습니다.";
			path = "secession"; // 탈퇴 페이지로 이동
		}
		
		// message 전달 코드
		ra.addFlashAttribute("message", message);
		
		
		return "redirect:"+path;
		
		// status.setComplete();// 세션 무효화
		// -> 클래스 레벨에 작성된
		// @SessionAttributes("key")에 작성된
		// key가 일치하는 값만 무효화
		
		// ex) session에서 "loginMember"를 없애야 한다
		// == @SessionAttributes("loginMember")
		//	...
		//	status.complate(); //"loginMember" 무효화

	}
	
	
	
	
}
