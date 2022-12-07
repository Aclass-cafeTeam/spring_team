package com.railtavelproject.cafe.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.railtavelproject.cafe.email.model.service.EmailService;


@Controller
//@RequestMapping("/member/sendEmail")
@SessionAttributes("authKey")
public class EmailController {

    @Autowired
    private EmailService service;

    @GetMapping("/member/sendEmail/signUp")
    @ResponseBody
    public int signUp(String email, Model model) {

        String authKey = service.signUp(email);

        if(authKey != null) { // 인증키가 존재한다면
            model.addAttribute("authKey", authKey);
            return 1;
        }else {
            return 0;
        }
    }


    @GetMapping("/member/sendEmail/checkAuthKey")
    @ResponseBody
    public int checkAuthKey(String inputKey, @SessionAttribute("authKey") String authKey, 
            SessionStatus status){

        if(inputKey.equals(authKey)) {
            status.setComplete();
            return 1;
        }
        return 0;
    }
    
    
    @GetMapping("/member/findPw")
    public String findPw() {
    	return "member/findPw";
    }
  

}
