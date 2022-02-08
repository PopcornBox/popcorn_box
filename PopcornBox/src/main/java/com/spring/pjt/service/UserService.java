package com.spring.pjt.service;

import com.spring.pjt.domain.User;

public interface UserService {

	int registerNewUser(User user);
	boolean isValidId(String user_id);
}
