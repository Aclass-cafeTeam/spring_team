package com.railtavelproject.cafe.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.railtavelproject.cafe.board.model.service.BoardService;

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
		
		return "board/boardList";
	}
	
	// 특정 게시판 목록 조회 (일반)
	@GetMapping("/board/{boardCode}")
	public String selecNomalBoardList(@PathVariable("boardCode") int boardCode,
	Model model,
	@RequestParam(value="cp", required = false, defaultValue="1") int cp
	) {

Map<String, Object> map = service.selectBoardList(boardCode, cp);

model.addAttribute("map", map);

return "board/boardList";
}
	
	
	
	
	
	
	
	
	
	
	
	
	
}