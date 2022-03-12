package com.spring.pjt.service;

import com.fasterxml.jackson.databind.JsonNode;

public interface KakaoLoginService {

	JsonNode getKakaoAccessToken(String code, String state);
	JsonNode getKakaoUserInfo(JsonNode accessToken);
	JsonNode kakaoLogout(String accessToken);
	JsonNode kakaoUnlink(String accessToken);
	
}
