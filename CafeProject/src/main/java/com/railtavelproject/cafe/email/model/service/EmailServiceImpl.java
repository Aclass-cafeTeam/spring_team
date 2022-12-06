package com.railtavelproject.cafe.email.model.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender mailSender; // email-context.xml에서 생성한 bean

    private String fromEmail = "nailcafe123@gmail.com"; // 보내는 사람 이메일
    private String fromUsername = "내일로, 기차로 카페";	// 보내는 사람 이름
    
    
    @Override
    public String createAuthKey() {
        // 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		
		String key = Integer.toString(checkNum);
		
		return key;
    }
    

    @Transactional
    @Override
    public String signUp(String email) {

        //6자리 난수 인증번호 생성
        String authKey = createAuthKey();
        
        try {

            //인증메일 보내기
        	MimeMessage mail = mailSender.createMimeMessage();

            // 제목
            String subject = "내일로, 기차로 회원가입 인증이메일입니다.";

            // 문자 인코딩
            String charset = "UTF-8";

            // 메일 내용
            String mailContent 
                = "<p>내일로, 기차로 카페를 방문해주셔서 감사합니다.</p>" 
                + "<p>인증번호는 <strong>" + authKey + "</strong> 입니다</p>";


            // 송신자(보내는 사람) 지정
            mail.setFrom(new InternetAddress(fromEmail, fromUsername));

            // 수신자(받는사람) 지정
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));


            // 이메일 제목 세팅
            mail.setSubject(subject, charset);

            // 내용 세팅
            mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨

            mailSender.send(mail); // 메일 발송
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        return authKey;
    }

}