package com.spring.pjt.persistence;

import com.spring.pjt.domain.User;

public interface UserDao {

	int create(User user);
	User checkUserId(String user_id);
	User checkNickname(String user_nickname);
	User checkEmail(String user_email);
	User read(User user);
	int getKey(String user_nickname, String user_key);
	int alter_userKey(String user_nickname, String key);
	int alter_userKey2(User user);
	User changeNickname(String user_nickname, String user_id);
	int lock_userKey(User user);
	int resetPwd(User user);
}
