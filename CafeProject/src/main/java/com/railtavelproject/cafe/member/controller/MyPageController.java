package com.railtavelproject.cafe.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railtavelproject.cafe.member.model.service.MyPageService;
import com.railtavelproject.cafe.member.model.vo.Member;


@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"}) // 로그인 멤버 정보를 얻어오는 어노테이션
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	//마이 페이지 메인(내정보)
	@GetMapping("/info")
	public String myPage() {
		return "member/myPageMain";
	}
	
	
	// 마이 페이지 내정보 수정(닉네임, 지역)
	@PostMapping("/info")
	public String updateInfo(Member InputMember, 
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra
			){
		
		// inputMember : 입력받은 memberNickname / memberResidence
		
		// 1. 로그인된 회원 정보에서 회원 번호를 얻어와 inputMember에 저장
		InputMember.setMemberNo(loginMember.getMemberNo());
		
		// 회원 정보 수정 서비스 호출 후 결과 반환 받기
		int result=service.updateInfo(InputMember);

		String message=null;
		
		if(result>0) {
			message = "회원 정보가 수정되었습니다.";
			
			// DB - session 동기화 작업
			loginMember.setMemberNickname(InputMember.getMemberNickname());
			loginMember.setMemberResidence(InputMember.getMemberResidence());
		
		} else	{
				message = "회원 정보 수정 실패...";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:info"; // 내 정보 재요청
	}
	
	// 비밀번호 변경 전 - 비밀번호 확인 페이지
	@GetMapping("/pwConfirm")
	public String pwConfirm() {
		
		return "member/myPagePwConfirm";
	}
	
	// 비밀번호 확인 후 비밀번호 변경 페이지로 전환
	@PostMapping("/pwConfirm")
	public String confirmPw ( @ModelAttribute("loginMember") Member loginMember,
			                 String memberPw,
			                 RedirectAttributes ra) {

		int result = service.pwConfirm(loginMember.getMemberNo(), memberPw);
		
		if(result>0) {
			return "member/myPageChangePw"; // 비밀번호 변경 페이지로 이동
		}else {
			ra.addFlashAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
			return "redirect:pwConfirm"; // 비밀번호 확인 페이지 재요청
		}
		
	}
	
	// 마이페이지 비밀번호 변경
	@GetMapping("/changePw")
	public String changePw() {
		
		return "member/myPageChangePw";
	}
	
	// 마이페이지 비밀번호 변경
	@PostMapping("/changePw")
	public String changePw(@SessionAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap,
			RedirectAttributes ra
			) {
		
		 // 1. loginMember에서 회원 번호를 얻어와 paramMap에 추가
		 paramMap.put("memberNo", loginMember.getMemberNo());
		 
		 // 2. 서비스 호출 후 결과 반환 받기
		 int result = service.changePw(paramMap);
		 
		 String message = null;
		 String path = null;
		 
		 if(result >0) { //성공
			message = "비밀번호가 변경 되었습니다.";
			path = "pwConfirm";
			 
		 } else { // 실패
			message = "현재 사용중인 비밀번호로 변경할 수 없습니다.";
			path = "changePw";
		 }
		 
		 ra.addFlashAttribute("message", message);
		 return "redirect:"+path;
	}
	
	// 마이페이지 프로필 이미지
	@GetMapping("/profile")
	public String myPageProfile() {
		return "member/myPageProfile";
	}
	
	// 마이페이지 프로필 이미지 변경
	@PostMapping("/updateProfile")
	public String updateProfile(
			@RequestParam(value="profileImage") MultipartFile profileImage, /*업로드된 파일*/
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra,
			HttpServletRequest req /*저장할 서버 경로*/
			) throws Exception {
		
		// 인터넷 주소로 접근할 수 있는 경로
		String webPath="/resources/images/member/";
		
		// 실제 파일이 저장된 컴퓨터 상의 절대 경로
		String filePath = req.getSession().getServletContext().getRealPath(webPath);
		
		int result = service.updateProfile(webPath, filePath, profileImage, loginMember);
		
		String message = null;
		
		if(result>0) {
			message = "프로필 이미지가 변경되었습니다.";
	
		} else	{
			message = "프로필 이미지 변경 실패";
		}
		
		ra.addFlashAttribute("message", message);
		return "redirect:profile";
		
	}
		
	// 마이페이지 로그인한 회원이 작성한 글 목록
	@GetMapping("/myBoard")
	public String selectMyPageBoard(
			@ModelAttribute("loginMember") Member loginMember,
			Model model,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp) {
		
		Map<String, Object> map = null;
		map = service.selectMyPageBoard(loginMember.getMemberNo(), cp);
		
		model.addAttribute("map", map);
		
		return "member/myPageBoard";
	}
	
	// 마이페이지 로그인한 회원이 댓글 단 글 목록
	@GetMapping("/myCommentBoard")
	public String selectMyCommentBoard(
			@ModelAttribute("loginMember") Member loginMember,
			Model model,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp) {
		
		Map<String, Object> map = null;
		map = service.selectMyCommentBoard(loginMember.getMemberNo(), cp);
		
		model.addAttribute("map", map);
		
		return "member/myCommentBoard";
	}
	
	// 마이페이지 로그인한 회원이 좋아요 한 글 목록
	@GetMapping("/myLikeBoard")
	public String selectMyLikeBoard(
			@ModelAttribute("loginMember") Member loginMember,
			Model model,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp) {
		
		Map<String, Object> map = null;
		map = service.selectMyLikeBoard(loginMember.getMemberNo(), cp);
		
		model.addAttribute("map", map);
		
		return "member/myPageLike";
	}
	
	// 마이페이지 로그인한 회원이 삭제한 글 목록
	@GetMapping("/myDeleteBoard")
	public String selectMyDeleteBoard(
			@ModelAttribute("loginMember") Member loginMember,
			Model model,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp) {
		
		Map<String, Object> map = null;
		map = service.selectMyDeleteBoard(loginMember.getMemberNo(), cp);
		
		model.addAttribute("map", map);
		return "member/myPageDelete";
	}
	
	//회원 탈퇴
	@GetMapping("/secession")
	public String secession() {
		return "member/myPageSecession";
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
			//"loginMember" 무효화
			status.setComplete();
			
		} else { // 탈퇴 실패
			message = "비밀번호가 일치하지 않습니다.";
			path = "secession"; // 탈퇴 페이지로 이동
		}
		
		// message 전달 코드
		ra.addFlashAttribute("message", message);
		
		
		return "redirect:"+path;
	}
	
}
