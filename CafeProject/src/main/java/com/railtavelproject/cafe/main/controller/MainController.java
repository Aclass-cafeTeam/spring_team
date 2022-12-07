package com.railtavelproject.cafe.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.railtavelproject.cafe.main.model.service.IntroService;
import com.railtavelproject.cafe.main.model.vo.IntroBoard;

@Controller
public class MainController{
	@Autowired
	private IntroService service;

	// forward 시 Controller 메서드의 반환형은
		// String 또는 ModelAndView 둘 중 하나이다.

		// GET 방식 "/" 로 요청이 오면 해당 메서드에서 처리
		// == Handler Mapping
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String mainPage(Model model, HttpSession session){
			// 메인 페이지 요청 시 필요한 코드 작성 ....
			
			// 게시글 전체 불러오기
			Map<String, Object> boardList = null;
			boardList = service.introBoardList();
			
			model.addAttribute("boardList", boardList);
			
			// 공지만 불러오기
			Map<String, Object> noticeList = null;
			noticeList = service.noticeList();
			
			model.addAttribute("noticeList", noticeList);
			
			// 여행후기 게시판 게시글 불러오기
			Map<String, Object> travelReviewList = null;
			travelReviewList = service.travelReview();
			
			model.addAttribute("travelReviewList", travelReviewList);
			
			
			// 회원수 조회
			int memberCount = service.memberCount();
			session.getServletContext().setAttribute("memberCount", memberCount);
			
			// 사이드메뉴(카테고리명+게시판명) 조회
			List<Map<String, Object>> mainList = service.selectMainList();
			session.getServletContext().setAttribute("mainList", mainList);
			
			
			// 오늘 방문수 조회
			int todayVisitCount = service.todayVisitCount();
			session.getServletContext().setAttribute("todayVisitCount", todayVisitCount);
			
			// 전체 방문수 조회
			int allVisitCount = service.AllVisitCount();
			session.getServletContext().setAttribute("allVisitCount", allVisitCount);
			
			// 지난주 멤버 랭킹 - 댓글
			Map<String, Object> commentRank = null;
			commentRank = service.commentRank();
			session.getServletContext().setAttribute("commentRank", commentRank);
			
			// 지난주 멤버 랭킹 - 게시글
			Map<String, Object> boardRank = null;
			boardRank = service.boardRank();
			session.getServletContext().setAttribute("boardRank", boardRank);
			
			// 지난주 멤버 랭킹 - 로그인
			Map<String, Object> loginRank = null;
			loginRank = service.loginRank();
			session.getServletContext().setAttribute("loginRank", loginRank);
			
			// 지난주 게시글 랭킹 - 좋아요
			Map<String, Object> boardLike = null;
			boardLike = service.boardLike();
			session.getServletContext().setAttribute("boardLike", boardLike);
			
			// 지난주 게시글 랭킹 - 댓글
			Map<String, Object> boardComment = null;
			boardComment = service.boardComment();
			session.getServletContext().setAttribute("boardComment", boardComment);
			
			// 멤버 소식 - 방문
			Map<String, Object> memberVisit = null;
			memberVisit = service.memberVisit();
			session.getServletContext().setAttribute("memberVisit", memberVisit);
			
			// 멤버 소식 - 신입
			Map<String, Object> memberNew = null;
			memberNew = service.memberNew();
			session.getServletContext().setAttribute("memberNew", memberNew);
			
			// 최근 게시글/댓글 - 게시글
			Map<String, Object> newBoard = null;
			newBoard = service.newBoard();
			session.getServletContext().setAttribute("newBoard", newBoard);
			
			// 최근 게시글/댓글 - 댓글
			Map<String, Object> newComment = null;
			newComment = service.newComment();
			session.getServletContext().setAttribute("newComment", newComment);
			
			// 카페프로필 이미지
			Map<String, Object> cafeInfo = null;
			cafeInfo = service.cafeInfo();
			session.getServletContext().setAttribute("cafeInfo", cafeInfo);
			
			
			// * forward 방법 *
			// - View Resolver의 prefix / suffix를 제외한 jsp 경로를 작성
			return "common/main";
			
			// /WEB-INF/views/common/main.jsp
			// prefix : /WEB-INF/views/
			// suffix : .jsp
		}

		
}     