package com.railtavelproject.cafe.email.model.service;

public interface EmailService {

	String createAuthKey();
	
	String signUp(String email);

}
