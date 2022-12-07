package com.railtavelproject.cafe.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railtavelproject.cafe.board.model.dao.BoardCrudDAO;
import com.railtavelproject.cafe.board.model.vo.Board;
import com.railtavelproject.cafe.board.model.vo.BoardImage;
import com.railtavelproject.cafe.member.model.vo.Member;

@Service
public class BoardCrudServiceImpl implements BoardCrudService{
	
	@Autowired
	private BoardCrudDAO dao;

	// 태그 조회
	@Override
	public List<Map<String, Object>> selectTitleTag() {
		return dao.selectTitleTag();
	}


	
	// 게시글 작성
	@Override
	public int writeBoard(Board board) {
		
		// 게시글 삽입의 결과로 새로 작성된 게시글 번호를 반환
		int boardNo = dao.writeBoard(board);
		
		if(boardNo > 0) {	
			
			// DB에 삽입할 이미지 정보가 담긴 리스트 생성
        	List<BoardImage> boardImageList = new ArrayList();
        	// boardImageList
	        // 시퀀스 번호, 저장 경로, 변경명, boardNo
        	
        	
			// 실제로 업로드된 파일만 분류
			// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
	        Matcher matcher = pattern.matcher(board.getBoardContent());     
	        
	        // BoardImage객체 생성
	        BoardImage img = new BoardImage();
	        
	        String src = null; // src 속성값을 저장할 임시 참조 변수
	        String filePath = null; // 파일명을 제외한 경로만 별도 저장
	        String fileName = null; // 업로드될 파일명
	        

	        // matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true 
	        while(matcher.find()){
	        	
	        	filePath = "/resources/images/board/";
	        	src=  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
	        	fileName = src.substring(src.lastIndexOf("/")+ 1); // 업로드된 파일명만 잘라서 별도로 저장.
	        	
	        	// BoardImage(VO)내에 값 세팅
	        	img.setImagePath(filePath);
	        	img.setImageRename(fileName);
	        	img.setBoardNo(boardNo);
	        	
	        	// boardImageList에 이미지 추가
	        	boardImageList.add(img);
	        }
	        
	        
	        // 업로드된 이미지가 있다면 DB에 파일 정보 insert
	        if(!boardImageList.isEmpty()) {
	        	int result = dao.insertBoardImageList(boardImageList);
			}
		}
		return boardNo;
	}

	    
	
	
	// 게시글 삭제
	@Override
	public int deleteBoard(int boardNo) {
		// 게시글이 삭제될 때 이미지테이블에 존재하는 이미지도 삭제
		// System.out.println(boardNo);
		dao.deleteImgList(boardNo);

		// 게시글 삭제
		return dao.deleteBoard(boardNo);
	}


	// 게시글 상세 조회
	@Override
	public Board boardDetail(int boardNo) {
		return dao.boardDetail(boardNo);
	}

	
	// 게시글 수정
	@Override
	public int boardUpdate(Board board) {
		
		// 게시물 수정시에 기존 DB에 있는 게시물 이미지 삭제
		dao.deleteImgList(board.getBoardNo());
		
		// 게시글 수정
		return dao.boardUpdate(board);
	}


	
	// 임시등록(INSERT)
	@Override
	public int tempPost(Board board) {
		return dao.tempPost(board);
	}

	
	// 임시등록 조회
	@Override
	public List<Board> selectTempPost(int memberNo) {
		return dao.selectTempPost(memberNo);
	}


	// 임시등록 전체 삭제
	@Override
	public int deleteTempAll(int memberNo) {
		return dao.deleteTempAll(memberNo);
	}


	// 게시판 목록 조회(로그인한 회원 등급에 따라)
	@Override
	public List<Map<String, Object>> selectBoardType(Member loginMember) {
		return dao.selectBoardType(loginMember);
	}


	// 임시등록-> 일반 게시글로 변동
	@Override
	public int updateTempPost(int boardNo) {
		return dao.updateTempPost(boardNo);
	}



	


	




}
