package com.railtavelproject.cafe.manager.model.service;

import org.springframework.web.multipart.MultipartFile;

import com.railtavelproject.cafe.manager.model.vo.CafeInfo;

public interface ManagerCafeInfoService {

	int updateCafeProfile(String webPath, String filePath, MultipartFile profileImage, CafeInfo cafeInfo) throws Exception;

	CafeInfo searchCafeInfo();

}
