package com.railtavelproject.cafe.common;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//예외 처리용 컨트롤러
@ControllerAdvice
public class ExceptionController {
	//프로젝트 내부에서 발생하는 모든 예외 처리
		//@ExceptionHandler(SQLException.class)
		@ExceptionHandler(Exception.class)  //자식클래스까지 다 처리하기 때문에 세세한 처리를 원하면 Exception.class 사용하면 안됨
		public String exceptionHandler(Exception e, Model model) {
			// 매개변수 Exception e : 발생한 예외 전달 받은 매개변수
			
			e.printStackTrace();
			
			model.addAttribute("errorMessage", "서비스 이용 중 문제가 발생했습니다.");
			model.addAttribute("e", e);
			
			return "/common/error";
		}
}
