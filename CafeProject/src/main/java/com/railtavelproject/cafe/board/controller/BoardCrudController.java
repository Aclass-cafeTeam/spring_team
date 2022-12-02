package com.railtavelproject.cafe.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.railtavelproject.cafe.board.model.service.BoardCrudService;
import com.railtavelproject.cafe.board.model.service.BoardDetailService;
import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.member.model.vo.Member;


@Controller
public class BoardCrudController {
	
	@Autowired
	private BoardCrudService service;
	
	@Autowired
	private BoardDetailService detailService;
	
	
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
	@ResponseBody
	@RequestMapping(value="/uploadImageFile", produces = "application/json; charset=utf8")
	public String uploadImageFile(
			@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws IOException {
		
		JsonObject json = new JsonObject();
		
		// 내부경로로 저장
		String webPath = "/resources/images/board/";
		String folderPath = request.getSession().getServletContext().getRealPath(webPath); // application scope
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지널 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		// 현재 시간을 기준으로해서 파일명으로 설정
	    int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성
	    String str = "_" + String.format("%05d", ranNum);
	    
	    String savedFileName = date+str+extension;	//저장될 파일명
	
		File targetFile = new File(folderPath + savedFileName);	
		
		
		try {
				// 파일 저장
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	
				
				// ajax로 전달
				json.addProperty("url", webPath+savedFileName);  
				json.addProperty("responseCode", "success");
		   
		 } catch (IOException e) {
		        FileUtils.deleteQuietly(targetFile);	
		        json.addProperty("responseCode", "error");
		        e.printStackTrace();
		 }
		
		 return json.toString();
	}
	
	
	// 게시글 작성(INSERT)
	@PostMapping("/board/write")
	public String writeBoard(
			Board board,
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra,
			HttpSession session, 
			@RequestHeader("referer") String referer) {
		
		// boardCode를 board 객체에 세팅
		int boardCode = board.getBoardCode();
		board.setBoardCode(boardCode);

		// 로그인 한 회원의 번호를 board 객체에 세팅
		board.setMemberNo(loginMember.getMemberNo());

		
		// 게시글 작성 서비스 수행 후 작성된 게시글의 번호로 반환
		int boardNo = service.writeBoard(board);
		// System.out.println(boardNo);
		
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
	
	
	
	// 게시글 삭제
	@GetMapping("/board/{boardCode}/{boardNo}/delete")
	public String deleteBoard(@RequestHeader("referer") String referer,
							@PathVariable int boardCode, @PathVariable int boardNo,
							RedirectAttributes ra) {

		// 게시글 번호를 이용해서 게시글 삭제 -> BOARD_DEL_FL = 'Y' (UPDATE)
		int result = service.deleteBoard(boardNo);

		String message = null;
		String path = null;
		
		if( result > 0 ) { // 게시글 삭제 성공 시
			message = "게시글이 삭제되었습니다.";
			path = "/board/" + boardCode;
			
		} else { // 게시글 삭제 실패 시
			message = "게시글 삭제 실패";
			path = referer;
			
		}
		
		ra.addFlashAttribute(message);		
		
		return "redirect:" + path;

	}
		
		
	
	// 게시글 수정 화면으로 전환
	@GetMapping("/board/{boardCode}/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardCode") int boardCode,
			@PathVariable("boardNo") int boardNo,
			Model model) {

		Board board = detailService.selectBoardDetail(boardNo);
		model.addAttribute("board", board);
	
		return "board/updateBoard";
	}
	
		
		
		
	// 게시글 수정
	// @PostMapping("/board/{boardCode}/{boardNo}/update")
//	public String boardUpdate(
//			Board board, // boardTitle, boardContent(커맨드 객체)
//			@PathVariable("boardCode") int boardCode, // 게시판 번호
//			@PathVariable("boardNo") int boardNo, // 수정할 게시글 번호
//			@RequestParam(value="cp", required=false, defaultValue="1") int cp, // 현재 페이지
//			@RequestParam(value="deleteList", required=false) String deleteList, // 삭제된 이미지 순서
//			@RequestParam(value="images", required=false) List<MultipartFile> imageList, // 업로드할 이미지
//			@RequestHeader("referer") String referer, // 이전 요청 주소
//			HttpSession session, // 서버 파일 저장 경로 얻기 용도
//			RedirectAttributes ra // 리다이렉트 시 응답 메세지 전달용
//			) throws Exception {
//		
//		// 1. board 객체에 boardCode 세팅
//		board.setBoardNo(boardNo);
//		
//		// 2. 이미지 저장 경로 얻어오기
//		String webPath = "/resources/images/board/";
//		String folderPath = session.getServletContext().getRealPath(webPath); // 서버 내에서 진짜 webPath 경로 반영
//		
//		// 3. 게시글 수정 서비스 호출
//		int result = service.boardUpdate(board, imageList, webPath, folderPath, deleteList);
//		
//		// 4. 서비스 결과에 따른 응답 제어
//		String path = null;
//		String message = null;
//		
//		if(result > 0) { // 게시글 수정 성공 시 
//			path = "/board/" + boardCode + "/" + boardNo + "?cp=" + cp; // 상세조회 경로로 이동
//			message = "게시글이 정상적으로 수정되었습니다.";
//			
//		} else {
//			message ="게시글 수정 실패";
//			path = referer;
//		}
//			
//		ra.addFlashAttribute(message);
//		
//		return "redirect:" + path;
//	}

}
