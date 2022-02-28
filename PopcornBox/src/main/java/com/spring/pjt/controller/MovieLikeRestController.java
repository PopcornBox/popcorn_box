package com.spring.pjt.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.pjt.service.MovieLikeService;
import com.spring.pjt.service.UserService;

@RestController 
@RequestMapping(value = "/movie_like")
public class MovieLikeRestController {
	
	private static final Logger log = LoggerFactory.getLogger(MovieLikeRestController.class);
	@Autowired private MovieLikeService movieLikeService;
	@Autowired private UserService userService;

	@RequestMapping(value = "/check/{user_nickname}", method = RequestMethod.GET)
	public ResponseEntity<List<Integer>> readLike(@PathVariable(name = "user_nickname") String user_nickname) {
			log.info("readLike(user_nickname:{})", user_nickname);
			
			int user_no = userService.readUserByNickname(user_nickname).getUser_no();
			
			List<Object> objList = movieLikeService.readLike(user_no);
			
			log.info("movieNoList:{}", objList);
			
			if (objList.size() == 0) {
				return null;
			}
			
			List<Integer> movieNoList = new ArrayList<>();
			
			for (Object obj : objList) {
				int movie_number = Integer.valueOf(String.valueOf(obj));
				movieNoList.add(movie_number);
			}
			
			ResponseEntity<List<Integer>> entity = new ResponseEntity<>(movieNoList, HttpStatus.OK);
			
			return entity;
	}
	
	
	@RequestMapping(value = "/read/{user_nickname}/{movie_no}", method = RequestMethod.GET)
	public ResponseEntity<Integer> readLike2(@PathVariable(name = "user_nickname") String user_nickname, @PathVariable(name = "movie_no") int movie_no) {
			log.info("readLike2(user_nickname:{}, movie_no:{})", user_nickname, movie_no);
			
			int user_no = userService.readUserByNickname(user_nickname).getUser_no();
			
			Object obj = movieLikeService.readLike2(user_no, movie_no);
			
			log.info("obj:{}", obj);
			
			if (obj == null) {
				return null;
			}
			
			int movie_number = Integer.parseInt(String.valueOf(obj));
			
			ResponseEntity<Integer> entity = new ResponseEntity<>(movie_number, HttpStatus.OK);
			
			return entity;
	}
	
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ResponseEntity<Integer> insertLike(@RequestBody String data) {
		JSONObject json = new JSONObject(data);
		
		int movie_no = json.getInt("movie_no");
		String user_nickname = json.getString("user_nickname");
		
		log.info("insertLike(movie_no:{}, user_nickname:{}) 호출", movie_no, user_nickname);
		
		int user_no = userService.readUserByNickname(user_nickname).getUser_no();
		
		int result = movieLikeService.insertLike(movie_no, user_no);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/delete/{movie_no}/{user_nickname}", method = RequestMethod.DELETE)
	public ResponseEntity<Integer> deleteLike(@PathVariable(name = "movie_no") Integer movie_no, @PathVariable(name = "user_nickname") String user_nickname) {
		log.info("deleteLike(movie_no={}, user_nickname={})", movie_no, user_nickname);
		
		int user_no = userService.readUserByNickname(user_nickname).getUser_no();
		
		int result = movieLikeService.deleteLike(movie_no, user_no);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/count/{movie_no}", method = RequestMethod.GET)
	public ResponseEntity<List<Integer>> countLike(@PathVariable(name = "movie_no") int movie_no) {
			log.info("countLike(movie_no:{})", movie_no);
			
			List<Object> objList = movieLikeService.readUsers(movie_no);
			
			log.info("userNoList:{}", objList);
			
			List<Integer> userNoList = new ArrayList<>();
			
			if (objList.size() == 0) {
				userNoList.add(0);
			}
			
			for (Object obj : objList) {
				int user_number = Integer.valueOf(String.valueOf(obj));
				userNoList.add(user_number);
			}
			
			ResponseEntity<List<Integer>> entity = new ResponseEntity<>(userNoList, HttpStatus.OK);
			
			return entity;
	}
	
	
}
