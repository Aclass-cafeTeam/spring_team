package com.railtavelproject.cafe.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.railtavelproject.cafe.board.model.service.BoardCrudService;


@Controller
public class BoardCrudController {
	
	@Autowired
	private BoardCrudService service;
	
	
	// 게시글 작성
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

}
