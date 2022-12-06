package com.railtavelproject.cafe.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.railtavelproject.cafe.board.model.service.BoardDetailService;
import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.board.model.vo.BoardType;
import com.railtavelproject.cafe.member.model.vo.Member;

@Controller
@SessionAttributes({"boardInfo"})
public class BoardDetailController {

	@Autowired
	private BoardDetailService service;
	
	// 게시글 상세조회
	@GetMapping("/board/{boardCode}/{boardNo}")
	public String boardDetail(
			@PathVariable("boardNo") int boardNo,
			@PathVariable("boardCode") int boardCode,
			Model model,
			HttpServletRequest req, HttpServletResponse resp,
			@SessionAttribute(value = "loginMember", required = false) Member loginMember) throws ParseException {
		// Session에 loginMember가 없으면 null
		

		// 게시글 상세조회 서비스
		Board board = service.selectBoardDetail(boardNo);
		
		String referer = req.getHeader("referer");

//		System.out.println(" 게시판 글보기 ======> "+referer);
		
		// 좋아요 기능
		if(board !=null) { // 게시글 상세조회 성공 시

			if(loginMember !=null) { // 로그인 상태인 경우
				Map<String, Object> map= new HashMap<String, Object>();
				map.put("boardNo", boardNo);
				map.put("memberNo", loginMember.getMemberNo());
				
				// BOARD_LIKE 테이블에 게시글 번호와 로그인한 회원번호가 일치하는지 조회하는 서비스
				int result = service.boardLikeCheck(map);
				
				if(result >0) { // 좋아요가 되어있는 경우
					
					model.addAttribute("likeCheck", "on");
				}
			}
		}
		
		// + 조회 수 증가(쿠키를 이용해서 해당 IP당 하루 한번)
		if(board !=null) { // 게시글 상세 조회 성공 시
			
			// 컴퓨터 1대당 게시글마다 1일 1번씩만 조회수 증가
			// -> 쿠키 이용
			
			Cookie[] cookies = req.getCookies();
			
			// 쿠키 중 "readBoardNo"가 있는지 확인
			Cookie ck = null;
			
			if(cookies !=null) { //쿠키가 있을 경우
				for(Cookie temp : cookies) {
					
					// 얻어온 쿠키의 이름이 "readBoardNo"인 경우
					if(temp.getName().equals("readBoardNo")) {
						ck=temp;
					}
				}
			}
			
			int result = 0;  // 조회수 증가 service 호출 결과 저장
			
			if(ck==null) { //"readBoardNo" 쿠키가 없을 경우
						  // == 해당 컴퓨터로 오늘 상세 조회를 한 번도 안했다
				
				// 조회수를 업데이트하는 서비스
				result = service.updateReadCount(boardNo);
				
				// boardNo 게시글을 상세조회 했음을 쿠키에 기록
				ck = new Cookie("readBoardNo","|"+ boardNo + "|");
								// |게시글번호|
				
			} else { //"readBoardNo" 쿠키가 있을 경우
				// ck.getValue() : "readBoardNo" 쿠키에 저장된 값(|게시글번호|)
				
				// 쿠키에 저장된 값 중 "|게시글번호|"가 존재하는지 확인
				if(ck.getValue().indexOf("|"+ boardNo + "|") == -1) {
					// 존재하지 않는 경우
					// == 오늘 처음 조회하는 게시글 번호
					// -> 조회 수 증가
					result = service.updateReadCount(boardNo);
					
					// 현재 조회한 게시글 번호를 쿠키에 값으로 추가
					ck.setValue(ck.getValue()+"|"+ boardNo + "|");
				}
			}
	
			if(result>0) { // 조회 수 증가 성공 시
							// DB와 조회된 Board 조회수 동기화
				
				board.setReadCount(board.getReadCount()+1);
				
				// 쿠키 적용 경로, 수명 설정 후 클라이언트에게 전달
				ck.setPath("/"); // localhost/(최상위 경로/) 이하로 적용
				
				// 오늘 23시 59분 59초까지 남은 시간을 초단위로 구하기
				// Date : 날짜용 객체
				// Calendar : Date 업그레이드 객체
				// SimpleDateFormat : 날짜를 원하는 형태의 문자열로 변환
				
				// 오늘 23시 59분 59초까지 남은 시간을 초단위로 구하기
				Date now = new Date(); // 현재 시간
				
				// 기준시간 : 1970년 1월 1일 09시 0분 0초
				// new Date(ms) : 기준 시간 + ms 만큼 지난 시간
				
				Calendar cal = Calendar.getInstance();
//						cal.add(단위, 추가할 값);
				cal.add(cal.DATE, 1); // 날짜에 1 추가
				
				// SimpleDateFormat을 이용해서 cal 날짜 중 시, 분, 초를 0:0:0 바꿈		
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				Date temp = new Date(cal.getTimeInMillis());
				// 하루 증가한 내일 날짜의 ms값을 이용해서 Date 객체 생성
				
				Date b = sdf.parse(sdf.format(temp));
						// 날짜형식 String -> Date로 변환
				
				// 내일 자정 ms - 현재시간 ms
				long diff = b.getTime() - now.getTime();
				
				ck.setMaxAge((int)(diff/1000)); // 10분(임시)
				
				resp.addCookie(ck); // 쿠키를 클라이언트에게 전달
			}
		}
		
		model.addAttribute("board", board);
		model.addAttribute("referer", referer);
		
		return "board/boardDetail";
	}
	
	// 좋아요 수 증가(INSERT)
	@GetMapping("/boardLikeUp")
	@ResponseBody
	public int boardLikeUp(@RequestParam Map<String, Object> paramMap) {
		// @RequestParam Map<String, Object>
		// -> 요청 시 전달된 파라미터를 하나의 Map으로 반환
		return service.boardLikeUp(paramMap);
		
	}
	// 좋아요 수 감소(DELETE)
	@GetMapping("/boardLikeDown")
	@ResponseBody
	public int boardLikeDown(@RequestParam Map<String, Object> paramMap) {
		// @RequestParam Map<String, Object>
		// -> 요청 시 전달된 파라미터를 하나의 Map으로 반환
		return service.boardLikeDown(paramMap);
		
	}
	
}
