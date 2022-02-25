package com.spring.pjt.persistence;

import com.spring.pjt.domain.User;

public interface UserDao {

	int create(User user);
	User checkUserId(String user_id);
	User checkNickname(String user_nickname);
	User checkEmail(String user_email);
	User readByUserNickname(String user_nickname);
	int getKey(String user_nickname, String user_key);
	int alter_userKey(String user_nickname, String key);
	int alter_userKey2(User user);
	
	// 회원 정보 수정
	void userInfoUpdate(User user);
	
	// 회원 활동 기록
	User callMypageBoardInfo(String user_id);
	
	int lock_userKey(User user);
	int resetPwd(User user);
	
	int delete(User user);
}
