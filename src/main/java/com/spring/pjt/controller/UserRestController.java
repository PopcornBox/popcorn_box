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
import com.spring.pjt.service.UserService;

@RestController
@RequestMapping(value = "/check_nickname")
public class UserRestController {

	private static final Logger log = LoggerFactory.getLogger(UserRestController.class);
	
	@Autowired private UserService userService;
	
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
}
