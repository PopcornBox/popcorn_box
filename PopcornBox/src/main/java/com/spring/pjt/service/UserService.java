package com.spring.pjt.service;

import com.spring.pjt.domain.User;

public interface UserService {

	int registerNewUser(User user);
	boolean isValidId(String user_id);
	boolean isValidNickname(String user_nickname);
	boolean isValidEmail(String user_email);
	User checkSignIn(User user);
	User readUserByEmail(String user_email);
    int resetPwd(User user);
    int validateKey(User user);
    
    // 회원 정보 조회
    User userInfo(String SignInUserNickname);
    
    // 회원 정보 수정
    void userInfoUpdate(User user);
}
