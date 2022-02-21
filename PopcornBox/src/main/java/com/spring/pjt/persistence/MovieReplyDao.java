package com.spring.pjt.persistence;

import java.util.List;

import com.spring.pjt.domain.MovieReply;

public interface MovieReplyDao {
	int insert(MovieReply movieReply);

	MovieReply existMovieReply(MovieReply movieReply);

	List<MovieReply> readAllMovieReplies(Integer movie_no);

	int delete(Integer movie_reply_no);
	
	int deleteAllOnMovie(int movie_no);

	int update(MovieReply movieReply);

	List<MovieReply> readTenMovieReplies(Integer movie_no, Integer viewpage);
}
