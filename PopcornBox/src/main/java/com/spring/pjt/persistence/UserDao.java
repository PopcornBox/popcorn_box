package com.spring.pjt.persistence;

import com.spring.pjt.domain.User;

public interface UserDao {

	int create(User user);
	User checkUserId(String user_id);
	User checkNickname(String user_nickname);
	User checkEmail(String user_email);
	User read(User user);
}
