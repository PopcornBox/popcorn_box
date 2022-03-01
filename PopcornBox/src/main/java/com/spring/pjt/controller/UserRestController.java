package com.spring.pjt.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.pjt.domain.User;
import com.spring.pjt.persistence.UserDao;
import com.spring.pjt.service.UserService;

@RestController
@RequestMapping(value = "/check_nickname")
public class UserRestController {

	private static final Logger log = LoggerFactory.getLogger(UserRestController.class);
	
	@Autowired private UserService userService;
	@Autowired private UserDao userDao;
	
	@RequestMapping(value = "/{user_no}", method = RequestMethod.POST)
	public ResponseEntity<Map<Object, Object>> checkDuplicate(@PathVariable(name = "user_no") int user_no, @RequestBody String user_nickname) {
	
		log.info("checkDuplicate(user_no:{}, user_nickname:{})", user_no, user_nickname);
	   
	    User user = userService.readUserByNickname(user_nickname);
	    
	    log.info("user:{}", user);
	   
	    int result = 0;
	    
	    if (user == null || user.getUser_no() == user_no) {
	    	result = 1;
	    }
	    
	    Map<Object, Object> map = new HashMap<>();
	    map.put("cnt", result);
	   
        ResponseEntity<Map<Object, Object>> entity = new ResponseEntity<>(map, HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping(value = "/pwd/{former_pwd}/{user_id}", method = RequestMethod.GET)
	public ResponseEntity<Integer> checkPwd(@PathVariable(name = "former_pwd") String former_pwd, @PathVariable(name = "user_id") String user_id) {
	
		log.info("checkPwd(former_pwd:{}, user_id:{})", former_pwd, user_id);
	   
	    User userFromDb = userDao.checkUserId(user_id);
	    String encodedPassword = userFromDb.getUser_pwd();
	    
	    log.info("encodedPassword:{}", encodedPassword);
	    
	
	    boolean check = passwordEncoder.matches(former_pwd, encodedPassword);
	    
	    log.info("check:{}", check);
	    
	    int result = 0;
	    
	    if (passwordEncoder.matches(former_pwd, encodedPassword)) { 
	           result = 1;
	        } 
	   
        ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping(value = "/resetpwd/{user_nickname}", method = RequestMethod.POST)
	public ResponseEntity<Integer> resetPwd(@PathVariable(name = "user_nickname") String user_nickname, @RequestBody String new_pwd) {
		
		log.info("resetPwd(user_nickname:{}, new_pwd:{})", user_nickname, new_pwd);
		
		String encryptPassword = passwordEncoder.encode(new_pwd);
		 
		 User user = new User();
		 user.setUser_nickname(user_nickname);
		 user.setUser_pwd(encryptPassword);
	   
	    int result = userService.resetPwd(user);
	   
        ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
}
