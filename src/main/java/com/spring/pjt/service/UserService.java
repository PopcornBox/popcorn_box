package com.spring.pjt.service;

import com.spring.pjt.domain.User;

public interface UserService {

	int registerNewUser(User user);
	boolean isValidId(String user_id);
	boolean isValidNickname(String user_nickname);
	boolean isValidEmail(String user_email);
	User checkSignIn(User user);
	User readUserByEmail(String user_email);
	User readUserByNickname(String user_nickname);
    int resetPwd(User user);
    int validateKey(User user);
   
    // 회원 정보 수정
    void userInfoUpdate(User user);
    
    // 회원 활동 기록
    User callMypageBoardInfo(String user_nickname);
    User callMypageBoardReplyInfo(String user_nickname);
    User callMypageEventReplyInfo(String user_nickname);
    User callMypageMovieReplyInfo(String user_nickname);
    User callMypageMovieLikeInfo(String user_nickname);
    
    int deleteAccount(User user);
}
