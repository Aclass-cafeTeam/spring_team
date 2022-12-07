package com.railtavelproject.cafe.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		System.out.println(mainCategoryNameAdd);
		
		Map<String, Object> map = service.insertMainCategoryBoardType(mainCategoryAdd+1,mainCategoryNameAdd);
	
		
		
		return new Gson().toJson(map);
	}
	
	/* 게시판 상세설정 및 게시판 분류 메인 카테고리 상세설정 */
	@PostMapping("/manager/menuManager/updateBoarddetail")
	public String updateBoarddetail(
			@RequestParam(value ="boardCodeUpdate" ,required=false, defaultValue="-1") int boardCode,
			@RequestParam(value ="MainCategoryUpdate" ,required=false, defaultValue ="") String MainCategoryUpdate,
			@RequestParam(value ="mainCategoryNameupdateIN" ,required=false, defaultValue ="") String mainCategoryName,
			@RequestParam(value ="settingboardName" ,required=false) String boardName, //boardName이 null이면 기본 게시판이라서 이름 수정 불가
			@RequestParam(value ="LevelNo" ,required=false) int boardMemberLevelNo,
			@RequestParam(value ="boardLikeCheckbox" ,required=false, defaultValue ="N") String boardLikeYN,
			@RequestParam(value ="titleTagCheckbox" ,required=false, defaultValue ="N") String TypeDelFL,
			RedirectAttributes ra
			) {
		
				/*
				 * if(MainCategoryUpdate != null) { String[] arr =
				 * MainCategoryUpdate.split("\\."); int mainCategoryNo =
				 * Integer.parseInt(arr[1]);
				 * 
				 * System.out.println(mainCategoryNo); }
				 * 
				 * if(boardCode != -1) { // 게시판 수정         
			
					}else { // -1  메인 카테고리 이름 수정
						
					}
				 */
		
		int result = service.updateBoarddetail(boardCode,MainCategoryUpdate,mainCategoryName,boardName,boardMemberLevelNo,boardLikeYN,TypeDelFL);
		String message = null;
		if(result > 0) {
			message = "성공적으로 반영되었습니다.";
		}else {
			message = "반영에 실패하셨습니다.";
		}
		
		System.out.println(boardCode);
		System.out.println(MainCategoryUpdate);
		System.out.println(mainCategoryName);
		System.out.println(boardName);
		System.out.println(boardMemberLevelNo);
		System.out.println(boardLikeYN);
		System.out.println(TypeDelFL);
		

		ra.addFlashAttribute("message", message);
		return "redirect:/manager/menuManager";
	}
	
	//   /deleteBoardType
	@PostMapping("/deleteBoardType")
	@ResponseBody
	public String deleteBoardType(
			@RequestParam(value="mainCategoryNameIn") String mainCategoryNameIn, 
			@RequestParam(value="boardCodeIn",required=false, defaultValue="-1") int boardCode
			) throws Exception {
			
			System.out.println(boardCode);
			System.out.println(mainCategoryNameIn);
		
			String[] arr =mainCategoryNameIn.split("\\."); 
			int mainCategoryNo =Integer.parseInt(arr[1]);		
			
			String message = service.deleteBoardType(boardCode,mainCategoryNo);

										
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("message",message);
			map.put("mainCategoryNo",mainCategoryNo);	
			map.put("boardCode",boardCode);	
								
			return new Gson().toJson(map);
	}
	
	//게시판 이동(아래로 누르는 거)
	@PostMapping("/updateBoardOrderPage")
	@ResponseBody
	public String updateBoardOrderPage(
			@RequestParam(value="mainCategoryNameIn") String mainCategoryNameIn, 
			@RequestParam(value="boardCodeIn",required=false, defaultValue="-1") int boardCode,
			@RequestParam(value="boardOrderupdate",required=false, defaultValue="-1") int boardOrderupdate,
			@RequestParam(value="nexTBoardOrderupdate",required=false, defaultValue="-1") int nexTBoardOrderupdate,
			@RequestParam(value="nexTBoardOrderupdateCode",required=false, defaultValue="-1") int boardNextupdateCode
			) throws Exception {
			
			System.out.println(boardCode);
			System.out.println(boardOrderupdate);
			System.out.println(nexTBoardOrderupdate);
			System.out.println(boardNextupdateCode);
				
			String message = service.updateBoardOrderPage(boardCode,boardOrderupdate,nexTBoardOrderupdate,boardNextupdateCode);

										
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("message",message);
			map.put("boardOrderupdate",boardOrderupdate);	
			map.put("nexTBoardOrderupdate",nexTBoardOrderupdate);	
			map.put("boardCode",boardCode);	
								
			return new Gson().toJson(map);
	}
	
	
	
	//게시판 이동(위로 누르는 거)
	@PostMapping("/updateBoardOrderPageUP")
	@ResponseBody
	public String updateBoardOrderPageUP(
			@RequestParam(value="mainCategoryNameIn") String mainCategoryNameIn, 
			@RequestParam(value="boardCodeIn",required=false, defaultValue="-1") int boardCode,
			@RequestParam(value="boardOrderupdate",required=false, defaultValue="-1") int boardOrderupdate,
			@RequestParam(value="preBoardOrderupdate",required=false, defaultValue="-1") int preBoardOrderupdate,
			@RequestParam(value="preBoardOrderupdateCode",required=false, defaultValue="-1") int preBoardOrderupdateCode
			) throws Exception {
			
			System.out.println(boardCode);
			System.out.println(boardOrderupdate);
			System.out.println(preBoardOrderupdate);
			System.out.println(preBoardOrderupdateCode);
				
			String message = service.updateBoardOrderPageUP(boardCode,boardOrderupdate,preBoardOrderupdate,preBoardOrderupdateCode);

										
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("message",message);
								
			return new Gson().toJson(map);
	}
	
	
	//팝업창(삭제된 상세글 보기)으로 가기
			@RequestMapping("/manager/manageRemoveArticleListPopup/{boardNo}")
			public String ManageSecedePopup(Model model,
					@PathVariable("boardNo") int boardNo) {
				
			    Board detailBoardList = service.selectdetailBoardList(boardNo); 
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("removeBoardList",detailBoardList);
				model.addAttribute("map",map);
				return "manager/manageRemoveArticleListPopup";
			}
			
			
		
}


