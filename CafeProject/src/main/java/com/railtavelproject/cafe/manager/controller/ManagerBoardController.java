package com.railtavelproject.cafe.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.railtavelproject.cafe.manager.model.service.ManagerBoardService;
import com.railtavelproject.cafe.manager.model.vo.Board;


@Controller
public class ManagerBoardController {
	@Autowired
	private ManagerBoardService service;
	
	@PostMapping("/insertBoardType")
	@ResponseBody
	public String insertBoardType(
			@RequestParam(value= "mainCategoryNameIn") String mainCategoryNameNo,//mainCategory.3
			@RequestParam(value= "mainCategoryNameIn2") String mainCategoryName,//질문 코너
			@RequestParam(value= "bordTitleNameIn") String boardName,   //앨범형 통합게시판  
			@RequestParam(value= "boardOrderIn") int boardOrder, // 현재 게시판 마지막 순서 (넣어줄 때 +1 해줘야함)
			@RequestParam(value= "bordTitleFormIn") String boardForm //A		
			) throws Exception{
		System.out.println(mainCategoryNameNo);
		String[] arr = mainCategoryNameNo.split("\\.");
	
		int mainCategoryNo = Integer.parseInt(arr[1]);
		
		
		Map<String, Object> map = service.insertBoardType(mainCategoryNo,mainCategoryName,boardName,boardOrder,boardForm);
	
		
		
		return new Gson().toJson(map);
	}
	
	
	@PostMapping("/insertMainCategoryBoardType")
	@ResponseBody
	public String insertMainCategoryBoardType(
			@RequestParam(value= "mainCategoryAdd") int mainCategoryAdd,          //카테고리 순서 +1
			@RequestParam(value= "mainCategoryNameAdd") String mainCategoryNameAdd   //카테고리 이름
			) throws Exception{
		
		
		
		Map<String, Object> map = service.insertMainCategoryBoardType(mainCategoryAdd+1,mainCategoryNameAdd);
	
		
		
		return new Gson().toJson(map);
	}
}


