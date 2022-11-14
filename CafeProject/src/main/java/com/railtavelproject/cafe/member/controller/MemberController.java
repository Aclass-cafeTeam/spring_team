package com.railtavelproject.cafe.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
   
   @Autowired
   private MemberService service;
   

   
   @PostMapping("/member/login") //POST 방식의 /member/login 요청을 연결
   public String login(@ModelAttribute Member inputMember,
         Model model, 
         RedirectAttributes ra,
         @RequestParam(value ="saveId",required =false) String saveId,  // 체크박스 값 얻어오기
         HttpServletResponse resp, //쿠키 전달용
         @RequestHeader(value ="referer") String referer  //요청이전 주소
         ) {
      
      // Model : 데이터 전달용 객체 
      // -데이터를 Map 형식으로 저장하여 전달하는 객체
      // -request scope 가 기본값
      // + @SessionAttributes 어노테이션과 함께 작성 시 
      // session scope로 변환 가능 
      
      //redirectAttributes
      // - 리다이렉트 시 값을 전달하는 용도의 객체
      // - 응답 전 : request scope
      // - redirect 중 : session scope
      // - 응답 후 : new request scope
      
      //System.out.println(inputMember);
      
      // Servlet 프로젝트 
      // Servlet 객체 생성
      // try ~ catch 내부에 코드 작성
      
      // Spring 프로젝트 
      
      //서비스 호출 후 결과 반환 받기
	  System.out.println(inputMember);
      Member loginMember = service.login(inputMember);
     
      String path = null; //리다일렉트 경로를 저장할 변수
      
         // 로그인 성공 시 loginMember를 세션에 추가
         // 로그인 실패 시 "아이디 또는 비밀번호가 일치하지 않습니다" 세션에 추가
      if(loginMember != null) {
         System.out.println(loginMember);
         path ="/";
         // 로그인 성공 시 loginMember를 세션에 추가
         
         //addAttribute("K", V) == req.setAttribute("K",V)
         model.addAttribute("loginMember",loginMember);
         // -> request scope 상태
         
         //@SessionAttributes("loginMember") 클래스 위에 추가 
         // -> session scope로 변환
         
         //******************************************************************
         //쿠키 생성
         Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
         
         //쿠키 유지 시간 지정
         if(saveId != null) { //체크되었을 때 
            
            // 1년동안 쿠키 유지
            cookie.setMaxAge(60*60*24*365);
            
         }else {//체크 안되었을 때 
            //0초 동안 쿠키 유지 -> 생성과 동시에 삭제
            // --> 클라이언트의 쿠키 파일을 삭제
            cookie.setMaxAge(0);
            
         }
         //크키가 사용되는 경로 지정
         cookie.setPath("/");
         
         resp.addCookie(cookie);
         //*********************************************************************
      }else {
         // 기존 : HttpServletRequest req; 객체를 통채로 들고 오는거
         //        req.getHeader("referer");
         // new  : @RequestHeader(value ="referer") String referer 
         //         path = referer;
         
         path= referer; // 로그인 요청 전 페이지 주소(referer)
         // 로그인 실패 시 "아이디 또는 비밀번호가 일치하지 않습니다." 세션에 추가
//         model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다");
         // -> 메인 페이지 주소에 message 값 노출
         // -> RedirectAttributes로 변환
         ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다");
         
         //addFlashAttribute() : 잠깐 session scope에 추가
      }
      
      return "redirect:" +path;
   }
   
   //로그인 페이지 이동
   @GetMapping("/member/login")
   public String loginPage() {
      return "member/login";
   }
   
   //로그아웃
   @GetMapping("/member/logout")
   public String logout(SessionStatus status) {
      // 기존 :
      // HttpServletRequest req;
      // HttpSession session = req.getSession();
      // session.invalidate();
      //session.invalidate(); // 세션 무효화
      //-> 안됨 왜: @SessionAttributes로 session scope에 등록된 값을 무효화 시키려면
      // SessionStatus 라는 별도의 객체를 이용해야 한다.
      
      status.setComplete();
      
      return "redirect:/";
   }
}