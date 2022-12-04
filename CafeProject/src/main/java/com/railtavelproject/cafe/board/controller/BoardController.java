package com.railtavelproject.cafe.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.railtavelproject.cafe.board.model.service.BoardService;
import com.railtavelproject.cafe.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	// 특정 게시판 목록 조회
	@GetMapping("/board/{boardCode}")
	public String selectBoardList(@PathVariable("boardCode") int boardCode,
			Model model,
			@RequestParam(value="cp", required = false, defaultValue="1") int cp
			) {
		
		Map<String, Object> map = service.selectBoardList(boardCode, cp);
		model.addAttribute("map", map);
		
		Map<String, Object> notice = service.selectBoardNoticeList(boardCode);
		model.addAttribute("notice", notice);
		
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
	
	// 검색 목록 조회
	@GetMapping("/board/{boardCode}")
	public String selectBoardList(@PathVariable("boardCode") int boardCode,
			Model model,
			@RequestParam(value="cp", required = false, defaultValue="1") int cp,
			@RequestParam Map<String, Object> pm
			) {
		
		if(pm.get("key") == null) { // 검색이 아닌 경우
			Map<String, Object> map = service.selectBoardList(boardCode, cp);
			model.addAttribute("map", map);
			
		} else { // 검색인 경우
			pm.put("boardCode", boardCode);
			Map<String, Object> map = service.selectBoardList(pm, cp);
			model.addAttribute("map", map);
		}
		
		return "board/boardList"; // forward
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}