package com.spring.pjt.service;

import java.util.List;

import com.spring.pjt.domain.MovieReply;

public interface MovieReplyService {

	int insert(MovieReply movieReply);

	MovieReply checkMovieReplyExist(MovieReply movieReply);

	List<MovieReply> readAllMovieReplies(Integer movie_no);
	
	List<MovieReply> readTenMovieReplies(Integer movie_no, Integer viewpage);

	int delete(Integer movie_reply_no);
	
	int deleteAllOnMovie(int movie_no);

	int update(MovieReply movieReply);
}
