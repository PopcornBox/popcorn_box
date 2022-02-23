package com.spring.pjt.controller;


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

import com.spring.pjt.service.MovieRatingService;
import com.spring.pjt.service.UserService;


@RestController 
@RequestMapping(value = "/movie_rating")
public class MovieRatingRestController {

	private static final Logger log = LoggerFactory.getLogger(MovieRatingRestController.class);
	@Autowired private MovieRatingService movieRatingService;
	@Autowired private UserService userService;
	
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ResponseEntity<Integer> insertScore(@RequestBody String data) {
		JSONObject json = new JSONObject(data);
		
		int movie_no = json.getInt("movie_no");
		String user_nickname = json.getString("user_nickname");
		double movie_score = json.getDouble("movie_score");
		
		log.info("insertScore(movie_no:{}, user_nickname:{}, movie_score:{}) 호출", movie_no, user_nickname, movie_score);
		
		int user_no = userService.readUserByNickname(user_nickname).getUser_no();
		
		int result = movieRatingService.insert(movie_no, user_no, movie_score);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/check/{movie_no}/{user_nickname}", method = RequestMethod.GET)
	public ResponseEntity<Double> readScore(@PathVariable(name = "movie_no") Integer movie_no, @PathVariable(name = "user_nickname") String user_nickname) {
			log.info("readScore(movie_no:{}, user_nickname:{})", movie_no, user_nickname);
			
			int user_no = userService.readUserByNickname(user_nickname).getUser_no();
			
			double score = movieRatingService.readScore(movie_no, user_no);
			
			log.info("score:{}", score);
			
			ResponseEntity<Double> entity = new ResponseEntity<>(score, HttpStatus.OK);
			
			return entity;
	}
	
	@RequestMapping(value = "/update/{movie_no}/{user_nickname}", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateScore(@PathVariable(name = "movie_no") Integer movie_no, @PathVariable(name = "user_nickname") String user_nickname, @RequestBody String data) {
		JSONObject json = new JSONObject(data);
		
		double movie_score = json.getDouble("updated_score");	
		
		log.info("updateScore(movie_no:{}, user_nickname:{}, movie_score:{}) 호출", movie_no, user_nickname, movie_score);
		
		int user_no = userService.readUserByNickname(user_nickname).getUser_no();
		
		int result = movieRatingService.update(movie_no, user_no, movie_score);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/delete/{movie_no}/{user_nickname}", method = RequestMethod.DELETE)
	public ResponseEntity<Integer> deleteScore(@PathVariable(name = "movie_no") Integer movie_no, @PathVariable(name = "user_nickname") String user_nickname) {
		log.info("deleteScore(movie_no={}, user_nickname={})", movie_no, user_nickname);
		
		int user_no = userService.readUserByNickname(user_nickname).getUser_no();
		
		int result = movieRatingService.delete(movie_no, user_no);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/average/{movie_no}", method = RequestMethod.GET)
	public ResponseEntity<Double> averageScore(@PathVariable(name = "movie_no") Integer movie_no) {
			log.info("averageScore(movie_no:{})", movie_no);
			
			double averageScore = movieRatingService.averageScore(movie_no);
			
			log.info("averageScore:{}", averageScore);
			
			ResponseEntity<Double> entity = new ResponseEntity<>(averageScore, HttpStatus.OK);
			
			return entity;
	}
	
	
	@RequestMapping(value = "/all_movies", method = RequestMethod.GET)
	public ResponseEntity<List<Object>> allMovies() {
			log.info("allMovies() 호출");
			
			List<Object> objList = movieRatingService.readAllMoives();
			
			log.info("objList:{}", objList);
			
			ResponseEntity<List<Object>> entity = new ResponseEntity<>(objList, HttpStatus.OK);
			
			return entity;
	}
	
	
}
