package com.railtavelproject.cafe.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.railtavelproject.cafe.board.model.service.BoardCrudService;
import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.board.model.vo.Member;


@Controller
public class BoardCrudController {
	
	@Autowired
	private BoardCrudService service;
	
	
	// 게시글 작성 화면
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
	
	
	
	
	// 썸머노트 - 이미지 업로드 (boardContent 내에 저장) 
	// produces 속성 : @ResponseBody를 사용하여 문자열을 return할 때 인코딩 문제 해결(이미지 파일명)
	// produces = "application/json; charset=utf8"
	@ResponseBody
	@PostMapping("insertImage")
	public String uploadSummernoteImageFile(
			@RequestParam("file") MultipartFile multipartFile )  {
		
		JsonObject jsonObject = new JsonObject();
		
		// 외부경로로 저장
		String fileRoot = "C:\\summernoteImg\\";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImg/"+savedFileName); 
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.toString();
	}
	
	
	// 게시글 작성(INSERT)
	@PostMapping("/board/write/${boardCode}")
	public String writeBoard(
			Board board,
			@SessionAttribute("loginMember") Member loginMember,
			@PathVariable("boardCode") int boardCode,
			RedirectAttributes ra,
			HttpSession session, 
			@RequestHeader("referer") String referer) {
		
		// 1. boardCode를 board 객체에 세팅
		board.setBoardCode(boardCode);
		System.out.println(board.getBoardCode());
		// 2. 로그인 한 회원의 번호를 board 객체에 세팅
		board.setMemberNo(loginMember.getMemberNo());

		// 3. 게시글 작성 서비스 수행 후 작성된 게시글의 번호로 반환
		int boardNo = service.writeBoard(board);
		
		String message = null;
		String path = null;
		if(boardNo > 0) {
			message = "게시글이 정상적으로 등록되었습니다.";
			path = "/board/" + boardCode + "/" + boardNo;
			
		} else {
			message = "내용을 확인하세요.";
			path = referer;
		}
		
		ra.addFlashAttribute("message");
		
		return "redirect:" + path;
		
		
	}
		

}
