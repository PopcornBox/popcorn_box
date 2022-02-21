package com.spring.pjt.controller;

import java.util.List;

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

import com.spring.pjt.domain.MovieReply;
import com.spring.pjt.service.MovieReplyService;

@RestController
@RequestMapping(value = "/movie_replies")
public class MovieReplyRestController {

	private static final Logger log = LoggerFactory.getLogger(MovieReplyRestController.class);
	
	@Autowired private MovieReplyService movieReplyService;
	
	@RequestMapping(value = "/all/{movie_no}", method = RequestMethod.GET)
	public ResponseEntity<List<MovieReply>> readAllMovieReplies(@PathVariable(name = "movie_no") Integer movie_no) {
			log.info("readAllMovieReplies(movie_no:{})", movie_no);
			
			List<MovieReply> movieReplyList = movieReplyService.readAllMovieReplies(movie_no);
			
			ResponseEntity<List<MovieReply>> entity = new ResponseEntity<>(movieReplyList, HttpStatus.OK);
			
			return entity;
	}
	
	@RequestMapping(value = "/all/{movie_no}/{viewpage}", method = RequestMethod.GET)
	public ResponseEntity<List<MovieReply>> readTenMovieReplies(@PathVariable(name = "movie_no") Integer movie_no, @PathVariable(name = "viewpage") Integer viewpage) {
			log.info("readTenMovieReplies(movie_no:{}, viewpage:{})", movie_no, viewpage);
			
			List<MovieReply> movieReplyList = movieReplyService.readTenMovieReplies(movie_no, viewpage);
			
			ResponseEntity<List<MovieReply>> entity = new ResponseEntity<>(movieReplyList, HttpStatus.OK);
			
			return entity;
	}
		
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> createMovieReply(@RequestBody MovieReply movieReply) {
		// @RequestBody: 클라이언트가 보내는 데이터가 요청 패킷 본문(body)에 포함되어 있다고 선언하는 어노테이션.
	    // 요청 시 보내는 데이터가 query string에 포함되어 있지 않고, form data도 아닌 경우에 사용.
		log.info("createMovieReply(movieReply:{})", movieReply);
	   
	    int result = movieReplyService.insert(movieReply);
	   
        ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}

	@RequestMapping(value = "/{movie_reply_no}", method = RequestMethod.DELETE)
	public ResponseEntity<Integer> deleteMovieReply(@PathVariable(name = "movie_reply_no") Integer movie_reply_no) {
		log.info("deleteMovieReply(movie_reply_no={})", movie_reply_no);
		
		int result = movieReplyService.delete(movie_reply_no);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/{movie_reply_no}", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateMovieReply(
			@PathVariable(name = "movie_reply_no") Integer movie_reply_no,
			@RequestBody MovieReply movieReply) {
		log.info("updateMovieReply(movie_reply_no={}, movie_reply_content={})", movie_reply_no, movieReply.getMovie_reply_content());
		
		movieReply.setMovie_reply_no(movie_reply_no); // PathVariable 값으로 Reply 인스턴스의 rno 값(수정할 댓글 번호)를 설정.
		
		int result = movieReplyService.update(movieReply);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
}
