package com.railtavelproject.cafe.member.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.railtavelproject.cafe.member.model.vo.Member;

public interface MyPageService {

	/** 프로필 이미지 변경
	 * @param webPath
	 * @param filePath
	 * @param profileImage
	 * @param loginMember
	 * @return
	 */
	int updateProfile(String webPath, String filePath, MultipartFile profileImage, Member loginMember) throws Exception ;
	
	/** 로그인한 회원이 작성한 글 목록 조회 + 페이징 처리 계산
	 * @param myBoardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMyPageBoard(int memberNo, int cp);

	/** 로그인한 회원이 댓글 단 글 목록 조회 + 페이징
	 * @param memberNo
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMyCommentBoard(int memberNo, int cp);

	/** 로그인한 회원이 좋아요 한 글 목록 조회 + 페이징
	 * @param memberNo
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectMyLikeBoard(int memberNo, int cp);

	/** 로그인한 회원이 삭제한 글 목록 조회 + 페이징
	 * @param memberNo
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectMyDeleteBoard(int memberNo, int cp);
	
	/** 회원 탈퇴
	 * @param memberNo
	 * @param memberPw
	 * @return
	 */
	int secession(int memberNo, String memberPw);

	/** 마이 페이지 내정보 수정(닉네임, 지역)
	 * @param inputMember
	 * @return result
	 */
	int updateInfo(Member inputMember);

	/** 비밀번호 변경 전 비밀번호 확인 서비스
	 * @param paramMap
	 * @return result
	 */	
	int pwConfirm(int memberNo, String memberPw);

	/** 마이페이지 비밀번호 변경 서비스
	 * @param paramMap
	 * @return result
	 */
	int changePw(Map<String, Object> paramMap);

}
