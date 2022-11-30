package com.railtavelproject.cafe.manager.model.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.railtavelproject.cafe.common.Util;
import com.railtavelproject.cafe.manager.model.dao.ManagerCafeInfoDAO;
import com.railtavelproject.cafe.manager.model.vo.CafeInfo;

@Service
public class ManagerCafeInfoServiceImpl implements ManagerCafeInfoService{
	@Autowired
	private ManagerCafeInfoDAO dao;

	@Override
	public CafeInfo searchCafeInfo() {
		return dao.searchCafeInfo();
	}
	
	// 프로필 이미지 수정
	@Transactional(rollbackFor = Exception.class) // 예외가 발생하면 롤백
	@Override
	public int updateCafeProfile(String webPath, String filePath, 
			MultipartFile profileImage, CafeInfo cafeInfo) throws
	Exception{
		// 실패를 대비해서 이전 이미지 경로 저장
				String temp = cafeInfo.getProfileImg();
				
				// 중복 파일명 업로드를 대비하기 위해서 파일명 변경
				String rename = null;
				
				if(profileImage.getSize() == 0) { // 업로드된 파일이 없는 경우
					cafeInfo.setProfileImg(null);
					
				}else { // 업로드된 파일이 있을 경우
					
					// 원본파일명을 이용해서 새로운 파일명 생성
					rename = Util.fileRename( profileImage.getOriginalFilename() );
					
					cafeInfo.setProfileImg(webPath + rename);
					// /resources/images/memberProfile/변경된파일명
				}
				

				int result = dao.updateCafeProfile(cafeInfo); // 0 또는 1
				
				if( result > 0 ) { // DB 수정 성공 시 -> 실제로 서버에 파일 저장
					
					if(rename != null) { 
						// 변경된 이미지명이 있다 == 새로운 파일이 업로드 되었다
						
						profileImage.transferTo(new File(filePath +  rename));
						// 메모리에 임시 저장된 파일을 지정된 경로에 파일 형태로 변환 
						// == 서버 파일 업로드
					}
					
				}else {
					// 실패 시 다시 이전 이미지를 세팅
					cafeInfo.setProfileImg(temp);
					throw new Exception("파일 업로드 실패"); // 예외 강제 발생
				}
				
				return result; // 결과 반환
	}

	@Override
	public int updateJoin(String join_get) {
		return dao.updateJoin(join_get);
	}

	
}
