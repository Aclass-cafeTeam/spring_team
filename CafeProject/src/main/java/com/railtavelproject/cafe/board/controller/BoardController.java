package com.railtavelproject.cafe.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.railtavelproject.cafe.board.model.service.BoardDetailService;
import com.railtavelproject.cafe.board.model.service.BoardService;
import com.railtavelproject.cafe.board.model.vo.BoardType;
import com.railtavelproject.cafe.member.model.vo.Member;

@Controller
@SessionAttributes({"boardInfo"})
public class BoardController {

	@Autowired
	private BoardService service;
	@Autowired
	private BoardDetailService dService;
	
	// 특정 게시판 목록 조회
	@GetMapping("/board/{boardCode}")
	public String selectBoardList(@PathVariable("boardCode") int boardCode,
			Model model,
			@RequestParam(value="cp", required = false, defaultValue="1") int cp,
			@RequestParam Map<String, Object> pm
			) {
		
		// 특정 게시판 정보(등급제한/말머리/좋아요/게시판형식) 조회 서비스 호출
		BoardType boardInfo = dService.selectBoardInfo(boardCode);
		model.addAttribute("boardInfo", boardInfo);
		
		// 특정 게시글 목록 조회
		Map<String, Object> map = service.selectBoardList(boardCode, cp);
		model.addAttribute("map", map);
		
		// 앨범형 게시글 목록 조회
		Map<String, Object> img = service.selectBoardImgList(boardCode, cp);
		model.addAttribute("img", img);
		
		// 게시글 별 공지 게시글 목록 조회
		Map<String, Object> notice = service.selectBoardNoticeList(boardCode);
		model.addAttribute("notice", notice);
		
		// 앨범형 공지 게시글 목록 조회
		Map<String, Object> albumNotice = service.selectBoardAlbumNoticeList(boardCode);
		model.addAttribute("albumNotice", albumNotice);
		
		// 전체 공지 게시글 목록 조회
		Map<String, Object> allNotice = service.selectBoardAllNoticeList(boardCode);
		model.addAttribute("allNotice", allNotice);

		// 게시글형 게시글 검색
		if(pm.get("key") == null) { // 검색이 아닌 경우
			Map<String, Object> search = service.selectBoardList(boardCode, cp);
			model.addAttribute("search", search);
			
		} else { // 검색인 경우
			pm.put("boardCode", boardCode);
			Map<String, Object> search = service.selectBoardList(pm, cp);
			model.addAttribute("search", search);
		}		
		
		return "board/boardList";
	}
	
	// 전체 글보기
	@GetMapping("/board/selectAll")
	public String selectBoardAllList(
			Model model,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp
			) {
		
		Map<String, Object> all = service.selectBoardAllList(cp);
		model.addAttribute("all", all);
		
		return "board/boardAllList";
	}
	
	// 베스트 게시글 (좋아요 높은 순)
	@GetMapping("/board/bestBoard")
	public String selectBoardBestList(
			Model model,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp
			) {
		
		Map<String, Object> best = service.selectBoardBestList(cp);
		model.addAttribute("best", best);
		
		return "board/boardBestList";
	}
	
}