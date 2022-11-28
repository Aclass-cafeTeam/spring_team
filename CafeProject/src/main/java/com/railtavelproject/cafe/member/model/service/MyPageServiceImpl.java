package com.railtavelproject.cafe.member.model.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.railtavelproject.cafe.common.Util;
import com.railtavelproject.cafe.member.model.dao.MyPageDAO;
import com.railtavelproject.cafe.member.model.vo.Member;
import com.railtavelproject.cafe.member.model.vo.MyPageBoard;
import com.railtavelproject.cafe.member.model.vo.MyPagePagination;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	

	// 프로필 이미지 변경
	@Transactional (rollbackFor=Exception.class) // 예외가 발생하면 롤백
	@Override
	public int updateProfile(String webPath, String filePath, MultipartFile profileImage, Member loginMember)
			throws Exception{

		// 실패를 대비해서 이전 이미지 경로 저장
		String temp = loginMember.getProfileImage();
		
		// 중복 파일명 업로드를 대비하기 위해서 파일명 변경
		String rename = null;
		
		if(profileImage.getSize() == 0) { // 업로드된 파일이 없는 경우
			loginMember.setProfileImage(null);
			
		} else { // 업로드된 파일이 있을 경우
			
			// 원본 파일명을 이용해서 새로운 파일명 생성
			rename = Util.fileRename(profileImage.getOriginalFilename());
			loginMember.setProfileImage(webPath + rename);
			// /resources/images/member/변경된파일명
		}
		
		int result = dao.updateProfile(loginMember); // 0또는 1
		
		if(result >0) { // DB수정 성공 시 -> 실제로 서버에 파일 저장
			
			if(rename !=null) {
				// 변경된 이미지명이 있다 == 새로운 파일이 업로드되었다
				profileImage.transferTo(new File(filePath + rename));
				// 메모리에 임시 저장된 파일을 지정된 경로에 파일 형태로 변환 
				// == 서버 파일 업로드
			}
			
		}else {
			// 실패시 다시 이전 이미지를 세팅
			loginMember.setProfileImage(temp);
			throw new Exception("파일 업로드 실패"); // 예외 강제 발생
		}
		return result; // 결과 반환
	}

	
	// 로그인한 회원이 작성한 글 목록 조회 + 페이징 처리 계산
	@Override
	public Map<String, Object> selectMyPageBoard(int memberNo, int cp) {
		
		// 1. 로그인한 회원이 작성한 전체 게시글 수 조회(단, 삭제된 게시글 제외)
		int myListCount = dao.getMyListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(myListCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myPageBoardList = dao.selectMyPageBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myPageBoardList", myPageBoardList);
		
		return map;
	}


	// 로그인한 회원이 댓글 단 글 목록 조회 + 페이징
	@Override
	public Map<String, Object> selectMyCommentBoard(int memberNo, int cp) {
		// 1. 로그인한 회원이 댓글을 작성한 전체 게시글 수 조회(단, 댓글을 삭제한 게시글 제외)
		int commentListCount = dao.getCommentListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(commentListCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myCommentBoardList = dao.selectMyCommentBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myCommentBoardList", myCommentBoardList);
		
		return map;
	}


	// 로그인한 회원이 좋아요 한 글 목록 조회 + 페이징
	@Override
	public Map<String, Object> selectMyLikeBoard(int memberNo, int cp) {
		
		// 1. 로그인한 회원이 좋아요를 누른 전체 게시글 수 조회(단, 삭제된 게시글 제외)
		int likeListCount = dao.getLikeListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(likeListCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myLikeBoardList = dao.selectMyLikeBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myLikeBoardList", myLikeBoardList);
		
		return map;
	}


	// 로그인한 회원이 삭제한 글 목록 조회 + 페이징
	@Override
	public Map<String, Object> selectMyDeleteBoard(int memberNo, int cp) {
		
		// 1. 로그인한 회원이 삭제한 전체 게시글 수 조회
		int deleteListCount = dao.getDeleteListCount(memberNo);
		
		// 2. 전체 게시글 수 + cp(현재 페이지) 이용해서
		//		페이징 처리 객체 생성
		MyPagePagination pagination = new MyPagePagination(deleteListCount, cp);
		
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		List<MyPageBoard> myDeleteBoardList = dao.selectMyDeleteBoard(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("myDeleteBoardList", myDeleteBoardList);
		
		return map;
	}


	// 회원 탈퇴
	@Transactional
	@Override
	public int secession(int memberNo, String memberPw) {
		
		// 현재 비밀번호 조회
		String nowPw = dao.selectCurrentPw(memberNo);
		
		// 암호화된 비밀번호와 현재 비밀번호 일치하는지 확인
		if(bcrypt.matches(memberPw, nowPw)) {
			
			// 탈퇴 이력 추가
			int dLog = dao.insertSecessionLog(memberNo);
			
			return dao.secession(memberNo);
		}
		
		return 0;
	}

}
