package com.spring.pjt.service;

import com.spring.pjt.domain.User;

public interface UserService {

	int registerNewUser(User user);
	boolean isValidId(String user_id);
	boolean isValidNickname(String user_nickname);
	boolean isValidEmail(String user_email);
	User checkSignIn(User user);
	User readUserByEmail(String user_email);
}
