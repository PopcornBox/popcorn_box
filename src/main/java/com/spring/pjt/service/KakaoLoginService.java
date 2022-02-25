package com.spring.pjt.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
 
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.pjt.controller.UserController;

@Service
public class KakaoLoginService {
	
	private static final Logger log = LoggerFactory.getLogger(KakaoLoginService.class);
	
	public JsonNode getKakaoAccessToken(String code, String state) {
		 
        final String RequestUrl = "https://kauth.kakao.com/oauth/token"; // Host
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
 
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", "cc1754dab9a17adb7dd44164ff108ba7")); // REST API 키
        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8181/pjt/user/kakaologin")); // Redirect URI
        postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정 중 얻은 code 값
        postParams.add(new BasicNameValuePair("state", state)); // 로그인 전에 있었던 페이지
 
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        JsonNode returnNode = null;
 
        try {
            post.setEntity(new UrlEncodedFormEntity(postParams));
 
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            log.info("Sending 'POST' request to URL : {}", RequestUrl);
            log.info("Post parameters : {}", postParams);
            log.info("Response Code : {}", responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper(); 
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        	// clear resources
        }
 
        return returnNode;
    }
	
	public JsonNode getKakaoUserInfo(JsonNode accessToken) {
		 
        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        // add header
        post.addHeader("Authorization", "Bearer " + accessToken);
 
        JsonNode returnNode = null;
 
        try {
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            log.info("Sending 'POST' request to URL : {}", RequestUrl);
            log.info("Response Code : {}", responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }
 
        return returnNode;
    }
	
	public JsonNode kakaoLogout(String accessToken) {
        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
        final HttpClient client = HttpClientBuilder.create().build(); 
        final HttpPost post = new HttpPost(RequestUrl);
 
        post.addHeader("Authorization", "Bearer " + accessToken);
 
        JsonNode returnNode = null;
 
        try { 
            final HttpResponse response = client.execute(post);
 
            ObjectMapper mapper = new ObjectMapper();            
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace(); 
        } catch (ClientProtocolException e) { 
            e.printStackTrace();
        } catch (IOException e) { 
            e.printStackTrace(); 
        } finally { 
        }
 
        return returnNode;
    }
	
	

}