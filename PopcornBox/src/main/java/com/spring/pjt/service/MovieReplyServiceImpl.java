package com.spring.pjt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.domain.MovieReply;
import com.spring.pjt.persistence.MovieReplyDao;

@Service
public class MovieReplyServiceImpl implements MovieReplyService {

	private static final Logger log = LoggerFactory.getLogger(MovieReplyServiceImpl.class);
	@Autowired MovieReplyDao movieReplyDao;
	
	@Override
	public int insert(MovieReply movieReply) {
		log.info("insert(movieReply:{}) 호출", movieReply);
		return movieReplyDao.insert(movieReply);
	}

	@Override
	public MovieReply checkMovieReplyExist(MovieReply movieReply) {
		log.info("checkMovieReplyExist(movieReply:{}) 호출", movieReply);
		return movieReplyDao.existMovieReply(movieReply);
	}

	@Override
	public List<MovieReply> readAllMovieReplies(Integer movie_no) {
		log.info("readAllMovieReplies(movie_no:{}) 호출", movie_no);
		return movieReplyDao.readAllMovieReplies(movie_no);
	}

	@Override
	public List<MovieReply> readTenMovieReplies(Integer movie_no, Integer viewpage) {
		log.info("readTenMovieReplies(movie_no:{}, viewpage:{}) 호출", movie_no, viewpage);
		return movieReplyDao.readTenMovieReplies(movie_no, viewpage);
	}

	@Override
	public int delete(Integer movie_reply_no) {
		log.info("delete(movie_reply_no:{}) 호출", movie_reply_no);
		return movieReplyDao.delete(movie_reply_no);
	}

	@Override
	public int deleteAllOnMovie(int movie_no) {
		log.info("deleteAllOnMovie(movie_no:{}) 호출", movie_no);
		return movieReplyDao.deleteAllOnMovie(movie_no);
	}

	@Override
	public int update(MovieReply movieReply) {
		log.info("update(movieReply:{}) 호출", movieReply);
		return movieReplyDao.update(movieReply);
	}

}
