package com.railtavelproject.cafe.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railtavelproject.cafe.manager.model.service.ManagerCafeInfoService;
import com.railtavelproject.cafe.manager.model.vo.CafeInfo;

@SessionAttributes("cafeInfo") // 탈퇴 성공 시 로그아웃에 사용
@RequestMapping("/manager/basicInfoManager")
@Controller
public class ManagerCafeInfoController {
	
	@Autowired
	private ManagerCafeInfoService service;
	
	// 프로필 이미지 수정
		@PostMapping("/updateCafeProfile")
		public String updateCafeProfile(
				@RequestParam(value="profileImage") MultipartFile profileImage, /*업로드된 파일*/
				@SessionAttribute("cafeInfo") CafeInfo cafeInfo, /* 로그인 회원 정보 */
				RedirectAttributes ra, /* 메세지 전달용 */
				HttpServletRequest req /* 저장할 서버 경로 */
				) throws Exception{
			
			// ** 업로드된 이미지를 프로젝트 폴더 내부에 저장하는 방법 **
			// 1) server -> 지정된 서버 설정 -> Serve modules without publishing 체크
			// 2) 파일을 저장할 폴더 생성
			// 3) HttpServletRequest를 이용해서 저장 폴더 절대 경로 얻어오기
			// 4) MultipartFile.transferTo()를 이용해서 지정된 경로에 파일 저장
			
			// 인터넷 주소로 접근할 수 있는 경로
			String webPath = "/resources/images/manager/";
			
			// 실제 파일이 저장된 컴퓨터 상의 절대 경로
			String filePath = req.getSession().getServletContext().getRealPath(webPath);
			
			int result = service.updateCafeProfile(webPath, filePath, profileImage, cafeInfo);
			
			String message = null;
			if(result > 0)	message = "프로필 이미지가 변경되었습니다.";
			else			message = "프로필 이미지 변경 실패";
			
			ra.addFlashAttribute("message", message);
			
			return "redirect:/manager/basicInfoManager";
		}
}