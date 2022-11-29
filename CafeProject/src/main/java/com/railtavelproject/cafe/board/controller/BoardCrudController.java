package com.railtavelproject.cafe.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.railtavelproject.cafe.board.model.service.BoardCrudService;


@Controller
public class BoardCrudController {
	
	@Autowired
	private BoardCrudService service;
	
	
	// 게시글 작성 페이지
	@GetMapping("/board/write")
	public String writeBoard(Model model) {
		
		// 태그조회
		List<Map<String, Object>> titleTagList = service.selectTitleTag();
		
		// 글양식조회
		List<Map<String, Object>> writingFormType = service.selectWritingFormType();

		model.addAttribute("titleTagList",titleTagList);
		model.addAttribute("writingFormType", writingFormType);
		
		return "board/writingBoard";
	}	
	
	
	// 게시글 작성
//	@PostMapping("/board/write/{boardCode}")
//	public int writeBoard(
//			@PathVariable("boardCode") int boardCode,
//			int titleTag
//			) {
//		return 
//	}

}
